package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

import software.amazon.awssdk.core.sync.*;
import software.amazon.awssdk.services.s3.*;
import software.amazon.awssdk.services.s3.model.*;

@Service
public class FreeBoardService {
	
	@Autowired
	private S3Client s3;
	
	@Value("${aws.s3.bucketName}")
	private String bucketName;
	
	@Autowired
	private FreeBoardMapper mapper;

	@Autowired
	private FreeBoardLikeMapper likeMapper;
	
	@Autowired
	private FreeCommentMapper commentMapper;
	
	public List<FreeBoard> listProcess() {
//		List<FreeBoard> list = mapper.listForm();
		
		List<FreeBoard> list = mapper.getCountList();
		return list;
	}

	public FreeBoard getProcess(Integer id, Authentication authentication) {
		FreeBoard board = mapper.getBoardList(id); 
		
		//좋아요 눌렀는지 안눌렀는지 코드
		if(authentication != null) {
			FreeBoardLike like = likeMapper.select(id,authentication.getName());
			if(like != null) {
				board.setLiked(true);
			}
		}
		return board;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public boolean addProcess(FreeBoard board, MultipartFile[] files, String category) throws Exception{
		int cnt = mapper.insertForm(board);
		System.out.println(files.length);
		for(MultipartFile file : files) {
			if(file.getSize() > 0) {
				mapper.insertFileName(board.getId(), file.getOriginalFilename());
				String ObjectKey = "teamPrj/" + board.getId() + "/" + file.getOriginalFilename();
					
				PutObjectRequest por = PutObjectRequest.builder()
						.bucket(bucketName)
						.key(ObjectKey)
						.acl(ObjectCannedACL.PUBLIC_READ)
						.build();
				RequestBody rb = RequestBody.fromInputStream(file.getInputStream(),file.getSize());
				
				s3.putObject(por, rb);
				}
			}
		
		return cnt == 1;
	}

	public boolean removeProcess(Integer id) {
		
		commentMapper.deleteComment(id);
		
		List<String> photoNames = mapper.selectFilebyBoardId(id);
		
		mapper.removeFilebyBoardId(id);
		
		for(String photoName : photoNames) {
			String objectKey ="teamPrj/" + id + "/" + photoName;
			DeleteObjectRequest dor = DeleteObjectRequest.builder()
					.bucket(bucketName)
					.key(objectKey)
					.build();
			
				s3.deleteObject(dor);
		}
		
		int cnt = mapper.removeForm(id);
		return cnt == 1;
	}

	@Transactional()
	public boolean updateProcess(FreeBoard board, List<String> removePhotoNames,
			MultipartFile[] addFile) throws Exception{
		
		//파일삭제
		if(removePhotoNames != null && !removePhotoNames.isEmpty()) {
			for(String fileName : removePhotoNames) {
				String objectKey = "teamPrj/" + board.getId() + "/" + fileName;
				DeleteObjectRequest dor = DeleteObjectRequest.builder()
						.bucket(bucketName)
						.key(objectKey)
						.build();
				
				s3.deleteObject(dor);
				//테이블 삭제
				mapper.deleteFileNameUpdate(board.getId(),fileName);
			}
		}
		
		//파일 수정추가
		for(MultipartFile file : addFile) {
			if(file.getSize() > 0) {
				mapper.updatetFileName(board.getId(),file.getOriginalFilename());
				
				String objectKey = "teamPrj/" + board.getId() + "/" + file.getOriginalFilename();
				PutObjectRequest por = PutObjectRequest.builder()
						.acl(ObjectCannedACL.PUBLIC_READ)
						.bucket(bucketName)
						.key(objectKey)
						.build();
				
				RequestBody rb = RequestBody.fromInputStream(file.getInputStream(), file.getSize());
				s3.putObject(por, rb);
			}
		}
		int cnt = mapper.updateBoard(board);
		return cnt == 1;
	}

	public Map<String, Object> like(FreeBoardLike like, Authentication authentication) {
		Map<String, Object> result = new HashMap<>();
		
		result.put("like", false);
		
		like.setMemberId(authentication.getName());
		Integer deleteCnt =  likeMapper.delete(like);
		if(deleteCnt != 1) {
			Integer insertCnt = likeMapper.insert(like);
			result.put("like", true);
		}
		Integer count = likeMapper.countBoardId(like.getBoardId());
		result.put("count", count);
		
		return result;
	}	
	public Object getBoard(Integer id) {
		// TODO Auto-generated method stub
		return getProcess(id,null);
	}

	public List<FreeBoard> getCountList() {
		
		List<FreeBoard> list = mapper.getCountList();
		return list;
	}

	public List<FreeBoard> getCountReply(Integer id) {
		List<FreeBoard> list = mapper.replyCounting(id);
		return list;
	}

	public Map<String, Object> getCountList(String boardCategory, String search, String type) {
		Integer allRecords = mapper.countRecord(search,type); 
		
		List<FreeBoard> list = mapper.selectPaging(boardCategory,search,type);
		return Map.of("boardList",list);
	}
}
