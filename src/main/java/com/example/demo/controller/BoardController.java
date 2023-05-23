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
public class BoardController {
	
	@Autowired
	BoardService service;

	@GetMapping("noticeList")
	public void notice(Model model) {
		
		List<Notice> noticeList = service.getNotice();
		model.addAttribute("noticeList", noticeList);
		
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
	public String noticeUpdateProcess(@PathVariable ("id") Integer id, String title, String body, Notice notice) {
	
		boolean ok = service.update(title, body, id);
		if(ok) {
			return "redirect:/id/" + notice.getId();			
		}else {
			return "redirect:/updateNotice/" + notice.getId();						
		}
	}
}