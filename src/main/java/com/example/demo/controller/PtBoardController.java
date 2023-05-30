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
@RequestMapping("ptBoard")
public class PtBoardController {

	@Autowired
	private PtBoardService service;
	
	@GetMapping("ptList")
	public void ptList(Model model) {
		List<PtBoard> list = service.listPtBoard();
		model.addAttribute("ptBoardList", list);
	}
	
	@GetMapping("/id/{id}")
	public String ptBoard(@PathVariable("id") Integer id, Model model) {
		PtBoard ptBoard = service.getPtBoard(id);
		model.addAttribute("ptBoard", ptBoard);
		
		return "ptBoard/ptGet";
	}
	
	
	
	@GetMapping("ptAdd")
	public void ptAddForm() {
		
	}
	
	@PostMapping("ptAdd")
	public String ptAddProcess(PtBoard ptBoard, RedirectAttributes rttr) {
		
		
		boolean ok = service.addBoard(ptBoard);
		
		if (ok) {
			return "redirect:/ptBoard/id/" + ptBoard.getId();
		} else {
			rttr.addFlashAttribute("ptBoard", ptBoard);
			return "redirect:/ptBoard/ptAdd";
		}		
	}
	
	@GetMapping("/ptModify/{id}")
	public String ptModify(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("ptBoard",service.getPtBoard(id));
		return "ptBoard/ptModify";
	}
	
	@PostMapping("/ptModify/{id}")
	public String ptModifyProcess(PtBoard ptBoard, RedirectAttributes rttr) {
		boolean ok = service.ptModify(ptBoard);
		
		if(ok) {
			rttr.addFlashAttribute("message", ptBoard.getId() + "번 게시물이 수정되었습니다.");
			return "redirect:/ptBoard/id/" + ptBoard.getId();
		} else {
			rttr.addFlashAttribute("message", ptBoard.getId() + "번 게시물이 수정되지 않았습니다.");
			return "redirect:/ptBoard/ptModify/" + ptBoard.getId();
		}
	}
	
	@PostMapping("ptRemove")
	public String ptRemove(Integer id, RedirectAttributes rttr) {
		boolean ok = service.ptRemove(id);
		
		if(ok) {
			rttr.addFlashAttribute("message", id + "번 게시물이 삭제되었습니다.");
			
			return "redirect:/ptBoard/ptList"; 
		} else {
			return "redirect:/ptBoard/id/" + id;
		}
	}
	
}













