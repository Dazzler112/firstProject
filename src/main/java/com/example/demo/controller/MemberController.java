package com.example.demo.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("member")

public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("signup")
	public void signUpForm() {
		
	}
	
	@PostMapping("signup")
	public String signupProcess(Member member, RedirectAttributes rttr) {
	
		try {
			service.signup(member);			
			return "redirect:/member/list";
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("member", member);		
			return "redirect:/member/signup";
		}
	}
}
