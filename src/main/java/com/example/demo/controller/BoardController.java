package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService service;

	@GetMapping("list")
	public String list(Model model) {
		List<Board> list = service.listBoard();
		
		model.addAttribute("boardList", list);
		return "board/list";
	}
	
	@GetMapping("adList")
	public String adList(Model model) {
		List<AdBoard> list = service.listAdBoard();
		model.addAttribute("adBoardList", list);
		return "board/adList";
	}
	
}









