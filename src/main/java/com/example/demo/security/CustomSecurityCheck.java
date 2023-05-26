package com.example.demo.security;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Component
public class CustomSecurityCheck {
	
	@Autowired
	private FreeBoardMapper boardMapper;
	
	@Autowired
	private FreeCommentMapper commentMapper;
	
	public boolean checkBoardWriter(Authentication authentication, Integer boardId) {
		FreeBoard board =  boardMapper.getBoardList(boardId);
		
		String username = authentication.getName();
		String writer = board.getWriter();
		
		return username.equals(writer);
	}
}
