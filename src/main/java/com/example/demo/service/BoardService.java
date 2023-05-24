package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

import software.amazon.awssdk.core.sync.*;
import software.amazon.awssdk.services.s3.*;
import software.amazon.awssdk.services.s3.model.*;

@Service
public class BoardService {
	
	@Autowired
	private S3Client s3;
	
	@Value("${aws.s3.bucketName}")
	private String bucketName;
	
	@Autowired
	private BoardMapper mapper;

	public List<Board> listProcess() {
		List<Board> list = mapper.listForm();
		
		return list;
	}

	public Board getProcess(Integer id) {
		Board board = mapper.getBoardList(id); 
		
		return board;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public boolean addProcess(Board board, MultipartFile[] files) throws Exception{
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
	
	
}
