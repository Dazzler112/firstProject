package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("location")
public class LocationBoardController {

	@Autowired
	private LocationBoardService locationService;
	
	@GetMapping("main")
	public String main(Model model) {
		
		List<LocationBoard> main = locationService.mainList();
		
		model.addAttribute("mainList",main);
		
		return"main";
	}
}
