package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class CommentService {

	@Autowired
	private CommentMapper mapper;

	public List<Comment> list(Integer boardId) {
		List<Comment> comments = mapper.selectAllComment(boardId);
		
		/*
		 * for(Comment comment : comments) {
		 * comment.setEditable(comment.getMemberId().equals(authentication.getName()));
			}
		나중에 접근제한 추가하면 사용  
		 */
				
		return comments;
	}
}
