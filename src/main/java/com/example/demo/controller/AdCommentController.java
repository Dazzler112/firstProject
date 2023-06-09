package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("adComment")
public class AdCommentController {
	
	@Autowired
	private AdCommentService service;
	
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody AdComment comment) {
		service.update(comment);
		
		return "ok";
	}
	
	@GetMapping("id/{id}")
	@ResponseBody
	public AdComment get(@PathVariable("id") Integer id) {
		return service.get(id);
	}
	
	@DeleteMapping("id/{id}")
	@ResponseBody
	public String remove(@PathVariable("id") Integer id) {
		service.remove(id);
		
		return "ok";
	}
	
	@PostMapping("add")
	public ResponseEntity<Map<String, Object>> add(@RequestBody AdComment comment) {
		Map<String, Object> res = service.add(comment);
		
		return ResponseEntity.ok().body(res);
	}
	
	@GetMapping("list")
	@ResponseBody
	public List<AdComment> list(@RequestParam("board") Integer boardId) {
		return service.list(boardId);
	}

}
