package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("/")
public class FreeBoardController {

	@Autowired
	private FreeBoardService service;
	
	@GetMapping({"/","freelist"})
	public String list (Model model){
//		List<FreeBoard> list = service.listProcess();
		
		List<FreeBoard> list = service.getCountList();
		
		model.addAttribute("boardList",list);
		return "freelist";
	}
	
	
	@GetMapping("/id/{id}")
	public String get(@PathVariable("id") Integer id, Model model
						,Authentication authentication) {
		
		List<FreeBoard> list = service.getCountReply(id);
		FreeBoard board = service.getProcess(id, authentication);
		
		model.addAttribute("getBoard",board);
		model.addAttribute("commentCnt",list);
		
		return "freeget";
	}
	
	@GetMapping("freeadd")
	public void getAddView() {
		// TODO Auto-generated method stub
	}
	
	@PostMapping("freeadd")
	public String addForm(@RequestParam("fileList") MultipartFile[] files
						,FreeBoard board 
						,RedirectAttributes rttr) 
								throws Exception{
		boolean ok = service.addProcess(board,files);
		
		if(ok) {
			rttr.addFlashAttribute("message","게시글이 생성되었습니다.");
			return "redirect:/id/" + board.getId();
		}else {
			rttr.addFlashAttribute("message", board.getId() + "게시글 생성에 실패하였습니다.");
			return "redirect:/freeadd";
		}
	}
	
	@PostMapping("remove")
	public String removeForm(Integer id ,RedirectAttributes rttr) {
		boolean ok = service.removeProcess(id);
		
		if(ok) {
		rttr.addFlashAttribute("message",id +"번 게시물이 삭제되었습니다.");
		return "redirect:/freelist";
		}else {
		System.out.println("실패");
		rttr.addFlashAttribute("message","게시물 삭제에 실패하였습니다.");
		return "redirect:/id/" + id;
		}
	}
	
	@GetMapping("/freeupdate/{id}")
	public String updateView(@PathVariable("id")Integer id,Model model) {
		
		model.addAttribute("board",service.getBoard(id));
		return "freeupdate";
	}
	
	@PostMapping("freeupdate/{id}")
	public String update(FreeBoard board,
			@RequestParam(value="removeFiles", required = false) List<String> removePhotoNames,
			@RequestParam(value = "listFiles" ,required = false) MultipartFile[] addFile,
			RedirectAttributes rttr) throws Exception {
		boolean ok = service.updateProcess(board,removePhotoNames,addFile);
		
		if(ok) {
			rttr.addFlashAttribute("message" , board.getId() + "번 게시물이 수정되었습니다");
			return"redirect:/id/" + board.getId();
		}else {
			rttr.addFlashAttribute("message", board.getId() + "게시물 수정에 실패하였습니다.");
			return"redirect:/freeupdate/" + board.getId();
		}
	}
	
	@PostMapping("/like")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> like(@RequestBody FreeBoardLike like,
									Authentication authentication) {
		if(authentication ==null) {
			return ResponseEntity
					.status(403)
					.body(Map.of("message","로그인을 해주세요."));
		}else {
			return ResponseEntity
					.ok()
					.body(service.like(like,authentication));
		}
		
	}	
	
}
