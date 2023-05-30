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
@RequestMapping("adBoard")
public class AdBoardController {
	
	@Autowired
	private AdBoardService service;

	
	@GetMapping("adList")
	public void adList(Model model) {
		List<AdBoard> list = service.listAdBoard();
		model.addAttribute("adBoardList", list);
		
	}
	
	
	@GetMapping("/id/{id}")
	public String adBoard(@PathVariable("id") Integer id, Model model) {
		AdBoard adBoard = service.getAdBoard(id);
		model.addAttribute("adBoard", adBoard);
		
		return "adBoard/adGet";
	}
	
	@GetMapping("adAdd")
	public void adAddForm() {
		
	}
	
	@PostMapping("adAdd")
	public String adAddProcess(AdBoard adBoard, RedirectAttributes rttr) {
		
		
		boolean ok = service.addBoard(adBoard);
		
		if (ok) {
			return "redirect:/adBoard/id/" + adBoard.getId();
		} else {
			rttr.addFlashAttribute("adBoard", adBoard);
			return "redirect:/adBoard/adAdd";
		}		
	}
	
	@GetMapping("/adModify/{id}")
	public String adModifyForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("adBoard",service.getAdBoard(id));
		return "adBoard/adModify";
	}
	
	@PostMapping("/adModify/{id}")
	public String adModifyProcess(AdBoard adBoard, RedirectAttributes rttr) {
		boolean ok = service.adModify(adBoard);
		
		if(ok) {
			rttr.addFlashAttribute("message", adBoard.getId() + "번 게시물이 수정되었습니다.");
			return "redirect:/adBoard/id/" + adBoard.getId();
		} else {
			rttr.addFlashAttribute("message", adBoard.getId() + "번 게시물이 수정되지 않았습니다.");
			return "redirect:/adBoard/adModify/" + adBoard.getId();
		}
	}
	
	@PostMapping("adRemove")
	public String adRemove(Integer id, RedirectAttributes rttr) {
		boolean ok = service.adRemove(id);
		
		if(ok) {
			rttr.addFlashAttribute("message", id + "번 게시물이 삭제되었습니다.");
			
			return "redirect:/adBoard/adList"; 
		} else {
			return "redirect:/adBoard/id/" + id;
		}
	}
}
	








