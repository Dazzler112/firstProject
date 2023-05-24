package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

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
	
	@GetMapping("/id/{id}")
	public String board(@PathVariable("id") Integer id, Model model) {
		Board adBoard = service.getAdBoard(id);
		model.addAttribute("adBoard", adBoard);
		
		return "board/adGet";
	}
	
	@GetMapping("adAdd")
	public void addForm() {
		
	}
	
	@PostMapping("adAdd")
	public String addProcess(AdBoard adBoard, RedirectAttributes rttr) {
		
		
		boolean ok = service.addBoard(adBoard);
		
		if (ok) {
			return "redirect:/board/id/" + adBoard.getId();
		} else {
			rttr.addFlashAttribute("adBoard", adBoard);
			return "redirect:/board/adAdd";
		}		
	}
	
	@GetMapping("/adModify/{id}")
	public String modify(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("adBoard",service.getAdBoard(id));
		return "board/adModify";
	}
	
}









