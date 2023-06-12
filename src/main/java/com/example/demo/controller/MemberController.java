package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

import jakarta.servlet.http.*;

@Controller
@RequestMapping("member")

public class MemberController {

	@Autowired
	MemberService service;

	@Autowired
	MailService mailService;

	@GetMapping("signup")
	@PreAuthorize("isAnonymous()")
	public void signUpForm() {
		mailService.sendMail();

	}

	@PostMapping("signup")
	@PreAuthorize("isAnonymous()")
	public String signupProcess(Member member, RedirectAttributes rttr) {

		try {
			service.signup(member);
			rttr.addFlashAttribute("message", "회원가입이 완료되었습니다");
			return "redirect:/member/list";
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("member", member);
			rttr.addFlashAttribute("message", "회원가입 중 문제가 발생하였습니다.");
			return "redirect:/member/signup";
		}
	}

//	운영자 권한이 있는 계정만 볼 수 있음
	@GetMapping("list")
	@PreAuthorize("hasAuthority('admin')")
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

	@GetMapping("checkPhoneNum/{PhoneNum}")
	@ResponseBody
	public Map<String, Object> checkPhoneNum(@PathVariable("PhoneNum") String phoneNum) {
		
		return service.checkPhoneNum(phoneNum);
	}

	@GetMapping("checkNickName/{NickName}")
	@ResponseBody
	public Map<String, Object> checkNickName(@PathVariable("NickName") String nickName) {
		
		return service.checkNickName(nickName);
	}
	
	@GetMapping("login")
	public void loginForm() {
		
	}
	
	@GetMapping("info")
	@PreAuthorize("hasAuthority('admin') or (isAuthenticated() and authentication.name eq #id)")
	public void getInfo(String id, Model model) {
		Member member = service.getUser(id);
		model.addAttribute("member", member);		
	}
	
	@GetMapping("modify")
	@PreAuthorize("hasAuthority('admin') or (isAuthenticated() and authentication.name eq #id)")
	public void modifyForm(String id, Model model) {
		Member member = service.getUser(id);
		model.addAttribute("member", member);
	}
	
	@PostMapping("modify")
	public String modifyProcess(Member member, RedirectAttributes rttr, String oldPassword) {
		boolean ok = service.modifyAccount(member, oldPassword);
		if(ok) {
			return "redirect:/member/info?id=" + member.getId();  
		}
		else {
			return "redirect:/member/modify?id=" + member.getId();
		}		
	}
		
	@PostMapping("remove")
	public String idRemove(Member member, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		boolean ok = service.removeAccount(member);
		System.out.println(member.getPassword());
		if(ok) {
			rttr.addFlashAttribute("message", "회원 탈퇴하였습니다.");

			//로그아웃
			request.logout();
			
			return "redirect:/member/signup";
		}else {
			rttr.addFlashAttribute("message", "회원 탈퇴 중 문제가 발생하였습니다.");
			return "redirect:/member/info?id=" + member.getId();
		}
	}
}
