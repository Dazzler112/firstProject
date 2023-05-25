package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.service.*;

@Controller
@RequestMapping("comment")
public class CommentController {

	@Autowired
	private CommentService service;
	
	@GetMapping("list")
	@ResponseBody
	public List<String> list(@RequestParam("board") Integer boardId) {
		
		return List.of("댓1","댓2","댓3");
		//return service.list(boardId);
	}
}
