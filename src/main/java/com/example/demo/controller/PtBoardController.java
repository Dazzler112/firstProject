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
@RequestMapping("ptBoard")
public class PtBoardController {
	
	@Autowired
	private PtBoardService service;

	@RequestMapping("list")
	public String list(Model model,
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "type", required = false) String type) {
		
		Map<String, Object> result = service.listBoard(page, search, type);
		
		model.addAllAttributes(result);
		
		return "ptBoard/list";
	}
	
	@GetMapping("id/{id}")
	public String board(@PathVariable("id") Integer id, Model model) {
		PtBoard board = service.getBoard(id);
		
		model.addAttribute("board", board);
		
		return "ptBoard/get";
	}
	
	@GetMapping("/modify/{id}")
	public String modifyForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("board", service.getBoard(id));
		
		return "ptBoard/modify";
	}
	
	@PostMapping("/modify/{id}")
	public String modifyProcess(PtBoard board,
			@RequestParam(value = "files", required = false) MultipartFile[] addFiles,
			@RequestParam(value = "removeFiles", required = false) List<String> removeFileNames,
			RedirectAttributes rttr) throws Exception{
		boolean ok = service.modify(board, addFiles, removeFileNames);
		
		if(ok) {
			
			rttr.addFlashAttribute("message", board.getId() + "번 게시물이 수정되었습니다.");
			return "redirect:/ptBoard/id/" + board.getId();
		} else {
			rttr.addFlashAttribute("message", board.getId() + "번 게시물이 수정되지 않았습니다.");
			return "redirect:/ptBoard/modify/" + board.getId();
		}		
	}
	
	@PostMapping("remove")
	public String remove(Integer id, RedirectAttributes rttr) {
		boolean ok = service.remove(id);
		
		if(ok) {
			rttr.addFlashAttribute("message", id + "번 게시물이 삭제되었습니다.");
			return "redirect:/ptBoard/list";
		} else {
			return "redirect:/ptBoard/id/" + id;
		}
	}
	
	@GetMapping("add")
	public void addForm() {
		
	}
	
	@PostMapping("add")
	public String addProcess(PtBoard board,
			@RequestParam("files") MultipartFile[] files,
			RedirectAttributes rttr) throws Exception {
		boolean ok = service.addBoard(board, files);
		
		if(ok) {
			rttr.addFlashAttribute("message", board.getId() + "번 게시물이 등록되었습니다.");
			return "redirect:/ptBoard/list";
		} else {
			rttr.addFlashAttribute("message", "게시물 등록 중 문제가 발생하였습니다.");
			rttr.addFlashAttribute("board", board);
			return "redirect:/ptBoard/add";
		}
	}
	
	@PostMapping("/like")
	@ResponseBody
	public Map<String, Object> like(@RequestBody Like like) {
		System.out.println(like);
		
		return null;
	}
}














