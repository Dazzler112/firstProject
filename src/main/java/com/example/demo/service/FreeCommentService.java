package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
@Transactional(rollbackFor = Exception.class)
public class FreeCommentService {

	@Autowired
	private FreeCommentMapper mapper;

	public List<FreeComment> list(Integer boardId, Authentication authentication) {
		List<FreeComment> comments = mapper.selectAllComment(boardId);
		if(authentication != null) {
		
		  for(FreeComment comment : comments) {
		 	comment.setEditable(comment.getMemberId().equals(authentication.getName()));
			}
		}		
		return comments;
	}

	//댓글 생성
	public Map<String, Object> add(FreeComment comment, Authentication authentication) {
		comment.setMemberId(authentication.getName());
		
		var res = new HashMap<String,Object>();
		comment.setDepth(0);
		int cnt = mapper.insert(comment);
		if(cnt == 1) {
			res.put("message", "댓글이 등록되었습니다.");
		}else {
			res.put("message", "댓글이 등록되지 않았습니다.");
		}
		return res;
	}

	public Map<String, Object> remove(Integer id) {
		int cnt = mapper.deleteCommentId(id);
		
		var list = new HashMap<String,Object>();
		
		if(cnt == 1) {
			list.put("message","댓글이 삭제되었습니다.");
		}else {
			list.put("message","실행중 오류가 발생하였습니다.");
		}
		return list;
	}


	public FreeComment get(Integer id) {

		return mapper.selectById(id);
	}

	public Map<String, Object> update(FreeComment comment) {
		int cnt = mapper.update(comment);
		
		var list = new HashMap<String, Object>();
		if(cnt == 1) {
			list.put("message", "댓글이 수정되었습니다.");
		}else {
			list.put("message", "댓글이 수정되지 않았습니다.");
		}
		return list;
	}

	public Map<String, Object> addReply(FreeComment comment, Authentication authentication) {
		
		comment.setMemberId(authentication.getName());
		
		comment.setDepth(1);
		comment.setParentId(comment.getId());
		var res = new HashMap<String,Object>();
		int cnt = mapper.insertReply(comment);
		System.out.println("parentId => " + comment.getParentId());
		if(cnt == 1) {
			res.put("message", "댓글이 등록되었습니다.");
		}else {
			res.put("message", "댓글이 등록되지 않았습니다.");
		}
		return res;
	}

	public List<FreeComment> reList(Integer boardId, Authentication authentication) {
		List<FreeComment> comments = mapper.selectReplyId(boardId);
		
		if(authentication != null) {
		
		  for(FreeComment comment : comments) {
		 	comment.setEditable(comment.getMemberId().equals(authentication.getName()));
			}
		}		
		return comments;
	}

	
}
