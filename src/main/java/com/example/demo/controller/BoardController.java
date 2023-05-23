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
	public void list(Model model) {
		List<Board> list = service.listBoard();
		
		model.addAttribute("boardList", list);
		
	}
	
	@GetMapping("adList")
	public void adList(Model model) {
		List<AdBoard> list = service.listAdBoard();
		model.addAttribute("adBoardList", list);
		
	}
	
	@GetMapping("ptList")
	public void ptList(Model model) {
		List<PtBoard> list = service.listPtBoard();
		model.addAttribute("ptBoardList", list);
	}
	
	@GetMapping("id/{id}")
	public String board(@PathVariable("id") Integer id, Model model) {
		Board board = service.getBoard(id);
		model.addAttribute("board", board);
		
		return "board/get";
	}
	
}









