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

	@GetMapping("list1")
	public String list1(Model model,
			@RequestParam(value = "price", defaultValue = "") Integer price,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "inserted", defaultValue = "") Optional<LocalDateTime> inserted,
			@RequestParam(value = "address", defaultValue = "") String address
			) {
			
		List<Board> result = service.listBoard(price, title, inserted, address);
		model.addAttribute("productList1", result);
		return "list";
	}
	
	@GetMapping("list2")
	public String list2(Model model,
			@RequestParam(value = "price", defaultValue = "") Integer price,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "inserted", defaultValue = "") Optional<LocalDateTime> inserted,
			@RequestParam(value = "address", defaultValue = "") String address,
			@RequestParam(value = "Likes", defaultValue = "") Integer likes
			) {
			
		List<Board> result = service.listBoard(price, title, inserted, address, likes);
		model.addAttribute("productList2", result);
		return "list";
	}
}