package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.core.*;
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

	@Autowired
	CheatService cheatService;

	@GetMapping("signup")
	@PreAuthorize("isAnonymous()")
	public void signUpForm() {

	}

	@PostMapping("signup")
	@PreAuthorize("isAnonymous()")
	public String signupProcess(Member member, RedirectAttributes rttr) {

		try {
			service.signup(member);
			rttr.addFlashAttribute("message", "회원가입이 완료되었습니다");
			return "redirect:/member/login";
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("member", member);
			rttr.addFlashAttribute("message", "회원가입 중 문제가 발생하였습니다.");
			return "redirect:/member/signup";
		}
	}

	@GetMapping("login")
	public void loginForm() {

	}

	@GetMapping("userSearch")
	public void findId() {

	}

	// 아이디 찾기
	@PostMapping("findId")
	@ResponseBody
	public String find_id(String name, String email, Model model) {

		String result = service.findId(name, email);
		model.addAttribute("id", result);
		return result;
	}
	
	@GetMapping("sendTempPw")
	public void sendPw() {
		
	}
	
	@PostMapping("sendTempPw")
	public boolean sendTempPw(String name, String email, HttpSession session) {
		System.out.println(name);
		System.out.println(email);
		boolean result = mailService.createPw(name, email, session);
		System.out.println(result);
		return result;
	}

	@PostMapping("mail")
	public void mailSend(String email, HttpSession session) {

		mailService.sendMail(email, session);

	}

	@PostMapping("mailCheck")
	@ResponseBody
	public Map<String, Object> mailCheck(Model model, Integer enteredCode, HttpSession session) {

		Boolean ok = mailService.compareNum(enteredCode, session);
		System.out.println(ok);
		model.addAttribute("authentication", ok);
		return Map.of("authentication", ok);

	}

	@GetMapping("jusoPopup")
	public void jusoPopup() {

	}

	@PostMapping("jusoPopup")
	public void jusoPopup2() {

	}

//	운영자 권한이 있는 계정만 볼 수 있음
	@GetMapping("list")
	@PreAuthorize("hasAuthority('admin')")
	public void userList(Model model, @RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "type", required = false) String type) {
		Map<String, Object> userList = service.userList(page, search, type);
		model.addAttribute("userList1", userList);
	}

	@GetMapping("checkId/{id}")
	@ResponseBody
	public Map<String, Object> checkId(@PathVariable("id") String id) {

		return service.checkId(id);
	}

	@GetMapping("checkPhoneNum/{PhoneNum}")
	@ResponseBody
	public Map<String, Object> checkPhoneNum(@PathVariable("PhoneNum") String phoneNum, Authentication authentication) {

		return service.checkPhoneNum(phoneNum, authentication);
	}

	@GetMapping("checkNickName/{NickName}")
	@ResponseBody
	public Map<String, Object> checkNickName(@PathVariable("NickName") String nickName, Authentication authentication) {

		return service.checkNickName(nickName, authentication);
	}

	@GetMapping("info")
	@PreAuthorize("hasAuthority('admin') or (isAuthenticated() and (authentication.name eq #id))")
	public void getInfo(String id, Model model) {
		Member member = service.getUser(id);
		model.addAttribute("member", member);
	}

	@GetMapping("adminPage")
	@PreAuthorize("hasAuthority('admin')")
	public void userListAdmin(Model model, @RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "type", required = false) String type) {
		Map<String, Object> userList = service.userList(page, search, type);
		model.addAttribute("userList1", userList);
		List<Cheat> list = cheatService.cheatCheck(search, type);
		model.addAttribute("cheatList", list);

	}

	@GetMapping("modify")
	@PreAuthorize("hasAuthority('admin') or (isAuthenticated() and (authentication.name eq #id))")
	public void modifyForm(String id, Model model) {
		Member member = service.getUser(id);
		model.addAttribute("member", member);
	}

	@PostMapping("modify")
	public String modifyProcess(Member member, RedirectAttributes rttr, String oldPassword) {
		boolean ok = service.modifyAccount(member, oldPassword);
		if (ok) {
			return "redirect:/member/info?id=" + member.getId();
		} else {
			return "redirect:/member/modify?id=" + member.getId();
		}
	}

	@PostMapping("remove")
	public String idRemove(Member member, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		boolean ok = service.removeAccount(member);
//		System.out.println(member.getPassword());
		if (ok) {
			rttr.addFlashAttribute("message", "회원 탈퇴하였습니다.");

			// 로그아웃
			request.logout();

			return "redirect:/member/login";
		} else {
			rttr.addFlashAttribute("message", "회원 탈퇴 중 문제가 발생하였습니다.");
			return "redirect:/member/info?id=" + member.getId();
		}
	}
}
