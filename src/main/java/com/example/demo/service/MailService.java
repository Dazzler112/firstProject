package com.example.demo.service;

import java.util.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;


@Service
public class MailService {

	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendMail() {
		
		ArrayList<String> toUserList = new ArrayList<>();
		
		toUserList.add("jhzzang97@naver.com");
		
		int toUserSize = toUserList.size();
		
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));
		
		simpleMessage.setSubject("이메일 인증 test입니다.");
		simpleMessage.setText("이메일 인증 test입니다.");
		javaMailSender.send(simpleMessage);
	}

}
