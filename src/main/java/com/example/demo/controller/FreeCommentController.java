package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
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
	public List<FreeComment> list(@RequestParam("board") Integer boardId) {
		
		
		return service.list(boardId);
	}
	
	@PostMapping("add")
	@ResponseBody
	public String add(@RequestBody FreeComment comment) {
		
		service.add(comment);
		
		return "ok";
	}
	
	@PostMapping("addReply")
	@ResponseBody
	public String addReply(@RequestBody FreeComment comment) {
		
		service.addReply(comment);
		
		return "ok";
	}
	
	@DeleteMapping("id/{id}")
	@ResponseBody
	public String remove(@PathVariable("id")Integer id) {
		service.remove(id);
		
		return "ok";
	}
	
	@GetMapping("id/{id}")
	@ResponseBody
	public FreeComment get(@PathVariable("id")Integer id ) {
		return service.get(id);
	}
	
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody FreeComment comment) {
		service.update(comment);
		
		return "ok";
	}
	
}
