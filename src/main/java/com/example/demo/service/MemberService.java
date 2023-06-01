package com.example.demo.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class MemberService {

	@Autowired
	MemberMapper mapper;
	
	public void signup(Member member) {
		int cnt = mapper.signUpInsert(member);
		
	}

}
