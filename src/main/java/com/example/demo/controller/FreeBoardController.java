package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("freeboard")
public class FreeBoardController {

	@Autowired
	private FreeBoardService service;
	
	@GetMapping("freelist")
	public String list (Model model,
						@RequestParam(value = "search" ,defaultValue = "")String search,
						@RequestParam(value="type", required = false)String type){
//		List<FreeBoard> list = service.listProcess();
		
//		List<FreeBoard> list = service.getCountList();
		Map<String, Object> list = service.getCountList(search,type);
		
		model.addAllAttributes(list); 
		return "freeboard/freelist";
	}
	
	@GetMapping(value = "freelist", params = "boardCategory")
	public String boardCategoryList(@RequestParam(value ="boardCategory")String boardCategory, Model model) {
		Map<String, Object> list = service.getBoardList(boardCategory);
		
		model.addAllAttributes(list);
		return "freeboard/freelist";
	}
	
	
	@GetMapping("/id/{id}")
	public String get(@PathVariable("id") Integer id, Model model
						,Authentication authentication) {
		
		List<FreeBoard> list = service.getCountReply(id);
		FreeBoard board = service.getProcess(id, authentication);
		
		model.addAttribute("getBoard",board);
		model.addAttribute("commentCnt",list);
		
		return "freeboard/freeget";
	}
	
	@GetMapping("freeadd")
	@PreAuthorize("isAuthenticated()")
	public void getAddView() {
		// TODO Auto-generated method stub
	}
	
	@PostMapping("freeadd")
	public String addForm(@RequestParam("fileList") MultipartFile[] files,
						  @RequestParam("boardCategory") String category
						,FreeBoard board 
						,RedirectAttributes rttr
						,Model model,
						Authentication authentication) 
								throws Exception{
		board.setWriter(authentication.getName());
		boolean ok = service.addProcess(board,files,category);
		
		model.addAttribute("category",category);
		if(ok) {
			rttr.addFlashAttribute("message","게시글이 생성되었습니다.");
			return "redirect:/freeboard/id/" + board.getId();
		}else {
			rttr.addFlashAttribute("message", board.getId() + "게시글 생성에 실패하였습니다.");
			return "redirect:/freeboard/freeadd";
		}
	}
	
	@PostMapping("remove")
	@PreAuthorize("isAuthenticated() and @customSecurityCheck.checkBoardWriter(authentication,#id)")
	public String removeForm(Integer id ,RedirectAttributes rttr) {
		boolean ok = service.removeProcess(id);
		
		if(ok) {
		rttr.addFlashAttribute("message",id +"번 게시물이 삭제되었습니다.");
		return "redirect:/freeboard/freelist";
		}else {
		System.out.println("실패");
		rttr.addFlashAttribute("message","게시물 삭제에 실패하였습니다.");
		return "redirect:/freeboard/id/" + id;
		}
	}
	
	@GetMapping("/freeupdate/{id}")
	@PreAuthorize("isAuthenticated() and @customSecurityCheck.checkBoardWriter(authentication, #id)")
	public String updateView(@PathVariable("id")Integer id,Model model) {
		
		model.addAttribute("board",service.getBoard(id));
		return "freeboard/freeupdate";
	}
	
	@PostMapping("freeupdate/{id}")
	@PreAuthorize("isAuthenticated() and @customSecurityCheck.checkBoardWriter(authentication,#board.id)")
	public String update(FreeBoard board,
			@RequestParam(value="removeFiles", required = false) List<String> removePhotoNames,
			@RequestParam(value = "listFiles" ,required = false) MultipartFile[] addFile,
			RedirectAttributes rttr) throws Exception {
		boolean ok = service.updateProcess(board,removePhotoNames,addFile);
		
		if(ok) {
			rttr.addFlashAttribute("message" , board.getId() + "번 게시물이 수정되었습니다");
			return"redirect:/freeboard/id/" + board.getId();
		}else {
			rttr.addFlashAttribute("message", board.getId() + "게시물 수정에 실패하였습니다.");
			return"redirect:/freeboard/freeupdate/" + board.getId();
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
