package com.example.demo.service;

import java.util.*;

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

	public List<Member> userList() {
		List<Member> userList = mapper.getAllUserList();
		return userList;
	}

	public Map<String, Object> checkId(String id) {
		Member member = mapper.selectById(id);
		return Map.of("available", member == null);
	}

}
