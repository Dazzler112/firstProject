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
@Transactional(rollbackFor = Exception.class)
public class AdBoardService {

	@Autowired
	private S3Client s3;

	@Value("${aws.s3.bucketName}")
	private String bucketName;

	@Autowired
	private AdBoardMapper mapper;
	
	@Autowired
	private AdBoardLikeMapper likeMapper;
	
	@Autowired
	private AdCommentMapper commentMapper;

	public List<AdBoard> listBoard() {
		List<AdBoard> list = mapper.selectAll();
		return list;
	}

	public AdBoard getBoard(Integer id, Authentication authentication) {
		AdBoard board = mapper.selectById(id);
		
		if (authentication != null) {
			AdLike like = likeMapper.select(id, authentication.getName());
			if(like != null) {
				board.setLiked(true); 
			}
		}

		return board;
	}

	public boolean modify(AdBoard board, MultipartFile[] addFiles, List<String> removeFileNames) throws Exception{

		// FileName 테이블 삭제
		if (removeFileNames != null && !removeFileNames.isEmpty()) {
			for (String fileName : removeFileNames) {
				// s3에서 파일(객체) 삭제
				String objectKey = "teamPrj/" + board.getId() + "/" + fileName;
				DeleteObjectRequest dor = DeleteObjectRequest.builder()
						.bucket(bucketName)
						.key(objectKey)
						.build();
				s3.deleteObject(dor);

				// 테이블에서 삭제
				mapper.deleteFileNameByBoardIdAndFileName(board.getId(), fileName);
			}
		}

		// 새 파일 추가
		for (MultipartFile newFile : addFiles) {
			if (newFile.getSize() > 0) {
				// 테이블에 파일명 추가
				mapper.insertFileName(board.getId(), newFile.getOriginalFilename());

				// s3에 파일(객체) 업로드
				String objectKey = "teamPrj/" + board.getId() + "/" + newFile.getOriginalFilename();
				PutObjectRequest por = PutObjectRequest.builder()
						.acl(ObjectCannedACL.PUBLIC_READ)
						.bucket(bucketName)
						.key(objectKey)
						.build();
				RequestBody rb = RequestBody.fromInputStream(newFile.getInputStream(), newFile.getSize());
				s3.putObject(por, rb);
			}
		}

		int cnt = mapper.update(board);

		return cnt == 1;

	}

	public boolean remove(Integer id) {
		
		commentMapper.deleteByBoardId(id);
		
		likeMapper.deleteByBoardId(id);
		
		List<String> fileNames = mapper.selectFileNamesByBoardId(id);
		
		mapper.deleteFileNameByBoardId(id);
		
		for (String fileName : fileNames) {
			String objectKey = "teamPrj/" + id + "/" + fileName;
			DeleteObjectRequest dor = DeleteObjectRequest.builder()
					.bucket(bucketName)
					.key(objectKey)
					.build();
			s3.deleteObject(dor);
		}
		
		int cnt = mapper.deleteById(id);

		return cnt == 1;
	}

	public boolean addBoard(AdBoard board, MultipartFile[] files) throws Exception {

		// 게시물 insert
		int cnt = mapper.insert(board);

		for (MultipartFile file : files) {
			if (file.getSize() > 0) {
				String objectKey = "teamPrj/" + board.getId() + "/" + file.getOriginalFilename();

				PutObjectRequest por = PutObjectRequest.builder()
						.bucket(bucketName)
						.key(objectKey)
						.acl(ObjectCannedACL.PUBLIC_READ)
						.build();
				RequestBody rb = RequestBody.fromInputStream(file.getInputStream(), file.getSize());

				s3.putObject(por, rb);

				// db에 관련 정보 저장(insert)
				mapper.insertFileName(board.getId(), file.getOriginalFilename());
			}
		}

		return cnt == 1;
	}

	public Map<String, Object> listBoard(Integer page, String search, String type) {
		
		// 페이지당 행의 수
				Integer rowPerPage = 10;

				// 쿼리 LIMIT 절에 사용할 시작 인덱스
				Integer startIndex = (page - 1) * rowPerPage;

				// 페이지네이션이 필요한 정보
				// 전체 레코드 수
				Integer numOfRecords = mapper.countAll(search, type);
				// 마지막 페이지 번호
				Integer lastPageNumber = (numOfRecords - 1) / rowPerPage + 1;
				// 페이지네이션 왼쪽번호
				Integer leftPageNum = page - 5;
				// 1보다 작을 수 없음
				leftPageNum = Math.max(leftPageNum, 1);

				// 페이지네이션 오른쪽번호
				Integer rightPageNum = leftPageNum + 9;
				// 마지막페이지보다 클 수 없음
				rightPageNum = Math.min(rightPageNum, lastPageNumber);

				Map<String, Object> pageInfo = new HashMap<>();
				pageInfo.put("rightPageNum", rightPageNum);
				pageInfo.put("leftPageNum", leftPageNum);
				pageInfo.put("currentPageNum", page);
				pageInfo.put("lastPageNum", lastPageNumber);

				// 게시물 목록
				List<AdBoard> list = mapper.selectAllPaging(startIndex, rowPerPage, search, type);

				return Map.of("pageInfo", pageInfo,
						"adBoardList", list);
	}

	public Map<String, Object> like(AdLike like, Authentication authentication) {
		Map<String, Object> result = new HashMap<>();
		
		result.put("like", false);
		
		like.setMemberId(authentication.getName());
		Integer deleteCnt = likeMapper.delete(like);
		
		if (deleteCnt != 1) {
			Integer insertCnt = likeMapper.insert(like);
			result.put("like", true);
		}
		
		Integer count = likeMapper.countByBoardId(like.getBoardId());
		result.put("count", count);
		
		return result;
	}

	public Object getBoard(Integer id) {
		// TODO Auto-generated method stub
		return getBoard(id, null);
	}

	public void removeByAdWriter(String writer) {
		List<Integer> idList = mapper.selectIdByWriter(writer);
		
		for(Integer id : idList) {
			remove(id);
		}
	}
}










