package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("cheat")
public class CheatController {

	@Autowired
	CheatService service;
	
	@GetMapping("/check")
	public void cheatCheck() {
		
//		return "cheat/check";
	}
	
	@GetMapping("/list")
	public void cheatList (@RequestParam(value="search", defaultValue="") String search, 
						     @RequestParam(value="type", required=false) String type,
						     Model model) {
		List<Cheat> list = service.cheatCheck(search, type);
		model.addAttribute("cheatList", list);
//		System.out.println(list);
		
//		return "list";
	}
	
	@GetMapping("/result")
	public void cheatCount (@RequestParam(value="search", defaultValue="") String search, 
						  	  @RequestParam(value="type", required=false) String type,
						      Model model) {

		List<Cheat> list = service.cheatCheck(search, type);
		model.addAttribute("cheatList", list);
		
		Integer cheatcount = service.cheatCount(search, type);
		model.addAttribute("cheatCount", cheatcount);

//		System.out.println(cheatcount);
		
//		return "result";
	}
	
}
