package com.example.demo.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;


@Controller
@RequestMapping("/")
public class NoticeController {
	
	@Autowired
	NoticeService service;

//	@GetMapping("noticeList")
//	public void notice(Model model, @RequestParam(value="page", defaultValue="1") Integer page) {
//		
//		List<Notice> noticeList = service.getNotice(); // 페이지 처리 전
//		model.addAttribute("noticeList", noticeList);
//		
//	}		
	
	@GetMapping("noticeList")
	public String list(Model model, 
					   @RequestParam(value = "page", defaultValue = "1") Integer page,
					   @RequestParam(value = "search", defaultValue = "") String search,
					   @RequestParam(value = "type", required = false/* type 파라미터가 null도 가능 */) String type) {

		Map<String, Object> result = service.listNotice(page, search, type); // 페이지 처리

//		List<Notice> noticeList = service.getNotice(); // 페이지 처리 전
		model.addAllAttributes(result);

		// 4. forward / redirect
		return "noticeList";
	}
	
	@GetMapping("/id/{id}")
	public String board(
			@PathVariable("id") Integer id, 
			Model model,
			Authentication authentication) {

		Notice notice = service.getNotice(id);
		model.addAttribute("notice", notice);
		return "getNotice";
	}
	
	@GetMapping("addNotice")
	public void noticeAddForm() {
		
	}
	
	@PostMapping("addNotice")
	public String addNoticeProcess(Notice notice) throws Exception {

		boolean ok = service.addNotice(notice);
		if (ok) {
			return "redirect:/id/" + notice.getId();
		} else {
			return "redirect:/addNotice";
		}
	}
	
	
	@PostMapping("remove")
	public String noticeRemoceProcess(Integer id) {
		
		boolean ok = service.removeNotice(id);
		
		if(ok) {
			return "redirect:/noticeList";
		}else {
			return "redirect:/getNotice";			
		}
	}
	
	@GetMapping("update/{id}")
	public String noticeUpdateFrom(@PathVariable ("id") Integer id, Model model) {
		Notice notice = service.getNotice(id);
		model.addAttribute("notice", notice);
		return "updateNotice";
	}
	
	@PostMapping("update/{id}")
	public String noticeUpdateProcess(Notice notice) {
	
		boolean ok = service.update(notice);
		if(ok) {
			return "redirect:/id/" + notice.getId();			
		}else {
			return "redirect:/updateNotice/" + notice.getId();						
		}
	}
}