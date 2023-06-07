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

	public Map<String, Object> checkPhoneNum(String phoneNum) {
		Member member = mapper.selectByPhoneNum(phoneNum);
		return Map.of("available", member == null);
	}

	public Map<String, Object> checkNickName(String nickName) {
		Member member = mapper.selectByNickName(nickName);
		return Map.of("available", member == null);
	}

	public Member getUser(String id) {
		return mapper.selectById(id);
	}

	public boolean removeId(Member member) {
		int cnt = mapper.remove(member.getId());
		System.out.println(cnt);
		return cnt == 1;
	}

}
