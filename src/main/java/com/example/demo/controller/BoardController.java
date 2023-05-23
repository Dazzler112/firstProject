package com.example.demo.controller;

import java.time.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("teamProject")
public class BoardController {

	@Autowired
	private BoardService service;

	@GetMapping("list")
	public String list(Model model,
			@RequestParam(value = "price", defaultValue = "") Double price,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "address", defaultValue = "") String address,
			@RequestParam(value = "inserted", defaultValue = "") Optional<LocalDateTime> inserted,
			@RequestParam(value = "writer", defaultValue = "") String writer,
			@RequestParam(value = "likes", defaultValue = "") Integer likes
			
			) {
			
		List<Board> result = service.listBoard(price, title, address, inserted, writer, likes);
		
		return "list";
	}
}