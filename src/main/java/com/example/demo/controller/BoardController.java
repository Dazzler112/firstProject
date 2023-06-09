package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;
import com.example.demo.service.*;

import ch.qos.logback.core.model.*;

@Controller
@RequestMapping("/")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	//localhost:8084/list
	
	@GetMapping("mainhomepage")
	public String QuickMenu(Model model) {
		return null;
	}
	
	
	@GetMapping("categorypage")
	public String CategoryMenu(Model model) {
		return null;
	}
	
	@GetMapping("productpage")
	public String productpageMenu(Model model) {
		return null;
	}
	
	@GetMapping("header")
	public String headerMenu(Model model) {
		return null;
	}
	@GetMapping("mainAdd")
	public String mainAdd(Model model) {
		return null;
	}

	

	
}
