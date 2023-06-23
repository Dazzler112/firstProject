package com.example.demo.service;

import java.util.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.*;
import org.springframework.mail.javamail.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

import jakarta.servlet.http.*;

@Service
public class MailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private MailMapper mailMapper;
	
	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
//	Random random = new Random();
//	int randomNumber = random.nextInt(900000) + 100000;

	public void sendMail(String email, HttpSession session) {

		ArrayList<String> toUserList = new ArrayList<>();

		toUserList.add(email);

		int toUserSize = toUserList.size();

		SimpleMailMessage simpleMessage = new SimpleMailMessage();

		simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));

		Random random = new Random();
		int randomNumber = random.nextInt(900000) + 100000;

		simpleMessage.setSubject("[Secont Stop] 회원 인증메일입니다.");
		simpleMessage.setText("안녕하세요! Second Stop입니다!\n" + "본인 확인 인증 번호를 보내드립니다.\n" + "\n" + "인증 번호 : " + randomNumber +"\n"
				+ "\n 타인에게 노출 시 계정 도용의 위험이 있습니다.");

		javaMailSender.send(simpleMessage);

		session.setAttribute("authenticatedNum", randomNumber);

	}

	public boolean compareNum(Integer enteredCode, HttpSession session) {

		Object num = session.getAttribute("authenticatedNum");
		if (enteredCode.equals(num)) {

			return true;
		} else {

			return false;
		}
	}



	public boolean createPw(String name, String email, HttpSession session) {
		ArrayList<String> toUserList = new ArrayList<>();

		String ok = memberMapper.checkUser(name, email);
		
		int cnt = 0;
			toUserList.add(email);

			int toUserSize = toUserList.size();

			SimpleMailMessage simpleMessage = new SimpleMailMessage();

			simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));

			Random random = new Random();
			int randomNumber = random.nextInt(900000) + 100000;
			String plain = String.valueOf(randomNumber);
			
			String encodePw = passwordEncoder.encode(plain);
			
			cnt = memberMapper.updatePw(name, email, encodePw);

			session.setAttribute("authenticatedNum", encodePw);
			
			simpleMessage.setSubject("중고거래 플랫폼 인증메일입니다.");
			simpleMessage.setText("안녕하세요! Second Stop입니다! 임시 비밀번호를 보내드립니다.\n" + "\n" + "임시 비밀번호\n" + "++++++++++\n"
					+ randomNumber + "\n++++++++++");

			javaMailSender.send(simpleMessage);
		return cnt == 1;
	}

}
