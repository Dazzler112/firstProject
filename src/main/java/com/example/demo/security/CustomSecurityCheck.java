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
	private AdBoardMapper adBoardMapper;
	
	@Autowired
	private AdCommentMapper adCommentMapper;
	
	@Autowired
	private FreeCommentMapper commentMapper;
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	public boolean checkBoardWriter(Authentication authentication, Integer boardId) {
		FreeBoard board =  boardMapper.getBoardList(boardId);
		
		String username = authentication.getName();
		String writer = board.getWriter();
		
		return username.equals(writer);
	}
	
	public boolean checkAdBoardWriter(Authentication authentication, Integer id) {
		AdBoard board = adBoardMapper.selectById(id);
		
		String username = authentication.getName();
		String writer = board.getWriter();
		
		return username.equals(writer);
	}
	
	
	public boolean checkCommentWriter(Authentication authentication,
								      Integer commentId) {
		FreeComment comment = commentMapper.selectById(commentId);
		
		return comment.getMemberId().equals(authentication.getName());
	}
	
	public boolean checkAdCommentWriter(Authentication authentication,
			Integer commentId) {
		AdComment comment = adCommentMapper.selectById(commentId);
		
		return comment.getMemberId().equals(authentication.getName());
	}
	

	public boolean checkNoticeWriter(Authentication authentication, Integer id) {
		Notice notice = noticeMapper.selectById(id);
		
		String username= authentication.getName();
		String writer = notice.getWriter();
		
		return username.equals(writer);
	}
}
