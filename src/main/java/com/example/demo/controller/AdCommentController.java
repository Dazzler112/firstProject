package com.example.demo.controller;

import java.util.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("adComment")
public class AdCommentController {
	
	@GetMapping("list")
	public List<String> list(@RequestParam("board") Integer boardId) {
		return List.of("댓1","댓2", "댓3");
	}

}
