package com.example.demo.service;

import java.util.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class MailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private MailMapper mailMapper;

	Random random = new Random();
	int randomNumber = random.nextInt(900000) + 100000;
	
	public void sendMail(String email) {

		ArrayList<String> toUserList = new ArrayList<>();

		toUserList.add(email);

		int toUserSize = toUserList.size();

		SimpleMailMessage simpleMessage = new SimpleMailMessage();

		simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));

//		Random random = new Random();
//		int randomNumber = random.nextInt(900000) + 100000;

		simpleMessage.setSubject("중고거래 플랫폼 인증메일입니다.");
		simpleMessage.setText("안녕하세요! Second STOP입니다! 회원 가입 인증 관련 번호를 보내드립니다.\n" + "\n" + "인증 번호\n" + "++++++++++\n"
				+ randomNumber + "\n++++++++++");

		javaMailSender.send(simpleMessage);

		mailMapper.saveRandomNum(randomNumber);
		System.out.println(randomNumber);
	}

	public List<AuthenticatedNum> checkAuthenticId() {
		List<AuthenticatedNum> checkId = mailMapper.checkAuthenticId(randomNumber);
		System.out.println(randomNumber);
		System.out.println(checkId);
		return checkId;
	}

}
