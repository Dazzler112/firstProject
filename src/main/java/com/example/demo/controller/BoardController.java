package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("/")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping({"/","list"})
	public String list (Model model) {
		List<Board> list = service.listProcess();
		
		model.addAttribute("boardList",list);
		return "list";
	}
	
	@GetMapping("/id/{id}")
	public String get(@PathVariable("id") Integer id, Model model) {
		
		Board board = service.getProcess(id);
		
		model.addAttribute("getBoard",board);
		
		return "get";
	}
	
	@GetMapping("add")
	public void getAddView() {
		// TODO Auto-generated method stub
	}
	
	@PostMapping("add")
	public String addForm(@RequestParam("fileList") MultipartFile[] files
						,Board board 
						,RedirectAttributes rttr) 
								throws Exception{
		boolean ok = service.addProcess(board,files);
		
		if(ok) {
			rttr.addFlashAttribute("message","게시글이 생성되었습니다.");
//			return "redirect:/id/" + board.getId();
			return "redirect:list";
		}else {
			rttr.addFlashAttribute("message", board.getId() + "게시글 생성에 실패하였습니다.");
			return "redirect:/add";
		}
	}
	
	@PostMapping("remove")
	public String removeForm(Integer id ,RedirectAttributes rttr) {
		boolean ok = service.removeProcess(id);
		
		if(ok) {
		rttr.addFlashAttribute("message",id +"번 게시물이 삭제되었습니다.");
		return "redirect:/list";
		}else {
		System.out.println("실패");
		rttr.addFlashAttribute("message","게시물 삭제에 실패하였습니다.");
		return "redirect:/id/" + id;
		}
	}
	
}
