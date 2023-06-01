package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
@Transactional(rollbackFor = Exception.class)
public class FreeCommentService {

	@Autowired
	private FreeCommentMapper mapper;

	public List<FreeComment> list(Integer boardId) {
		List<FreeComment> comments = mapper.selectAllComment(boardId);
		
		/*
		 * for(Comment comment : comments) {
		 * comment.setEditable(comment.getMemberId().equals(authentication.getName()));
			}
		나중에 접근제한 추가하면 사용  
		 */
				
		return comments;
	}

	public void add(FreeComment comment) {
		comment.setMemberId("test1");
		comment.setDepth(0);
		mapper.insert(comment);
	}

	public void remove(Integer id) {
		mapper.deleteCommentId(id);
	}

	public FreeComment get(Integer id) {
		// TODO Auto-generated method stub
		return mapper.selectById(id);
	}

	public void update(FreeComment comment) {
		mapper.update(comment);
	}

	public void addReply(FreeComment comment) {
		comment.setMemberId("test1");
		comment.setDepth(1);
		mapper.insertReply(comment);
	}

	
}
