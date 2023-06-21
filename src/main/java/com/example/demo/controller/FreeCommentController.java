package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("comment")
public class FreeCommentController {

	@Autowired
	private FreeCommentService service;
	
	@GetMapping("list")
	@ResponseBody
	public List<FreeComment> list(@RequestParam("board") Integer boardId,Authentication authentication) {
		
		
		return service.list(boardId,authentication);
	}
	
	@PostMapping("add")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> add(@RequestBody FreeComment comment,
					  							  Authentication authentication) {
		
		if(authentication == null) {
			Map<String, Object> list = Map.of("message","로그인 후 댓글을 달아주세요.");
			return ResponseEntity.status(401).body(list);
		}else {
			Map<String, Object> list = service.add(comment,authentication);
			return ResponseEntity.ok().body(list);
		}
		
	}
	
	@PostMapping("addReply")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> addReply(@RequestBody FreeComment comment,Authentication authentication) {
		
		
		if(authentication == null) {
			Map<String, Object> list = Map.of("message","로그인 후 댓글을 달아주세요.");
			return ResponseEntity.status(401).body(list);
		}else {
			Map<String, Object> list = service.addReply(comment,authentication);
			return ResponseEntity.ok().body(list);
		}
	}
	
	@DeleteMapping("id/{id}")
	@ResponseBody
	@PreAuthorize("authenticated and @customSecurityCheck.checkCommentWriter(authentication, #id)")
	public ResponseEntity<Map<String, Object>> remove(@PathVariable("id")Integer id) {
		Map<String, Object> list =  service.remove(id);
		
		return ResponseEntity.ok().body(list);
	}
	
	@GetMapping("id/{id}")
	public FreeComment get(@PathVariable("id")Integer id) {
		return service.get(id);
	}
	
	@PutMapping("update")
	@ResponseBody
	@PreAuthorize("authenticated and @customSecurityCheck.checkCommentWriter(authentication, #comment.id)")
	public ResponseEntity<Map<String, Object>> update(@RequestBody FreeComment comment) {
		Map<String, Object> list = service.update(comment);
		
		return ResponseEntity.ok().body(list);
	}
	
	@PostMapping("updateShape")
	@ResponseBody
	public String updateCommentShape(@RequestParam("boardId")Integer boardId,
									@RequestParam("depth")Integer depth) {

		service.updateCommentShape(boardId,depth);
		return "ok";
	}
}
