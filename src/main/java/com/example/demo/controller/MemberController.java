package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("member")

public class MemberController {

	@Autowired
	MemberService service;

	@Autowired
	MailService mailService;
	
	@GetMapping("signup")
	public void signUpForm() {
		mailService.sendMail();
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

//	운영자 권한이 있는 계정만 볼 수 있음
	@GetMapping("list")
	public void userList(Model model) {
		List<Member> userList = service.userList();
		model.addAttribute("userList", userList);
//		System.out.println(userList);
	}

	@GetMapping("checkId/{id}")
	@ResponseBody
	public Map<String, Object> checkId(@PathVariable("id") String id) {
		
		return service.checkId(id);
	}
}
