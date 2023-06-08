package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	public boolean signup(Member member) {
		
		// 비밀번호 암호화
		String plain = member.getPassword();
		member.setPassword(passwordEncoder.encode(plain));
		
		int cnt = mapper.signUpInsert(member);
		return cnt == 1;
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

	public boolean removeAccount(Member member) {
		Member oldMember = mapper.selectById(member.getId());
		int cnt = 0;
		if(passwordEncoder.matches(member.getPassword(), oldMember.getPassword())) {
			// 암호가 같다면
			
			cnt = mapper.deleteById(member.getId());		
		}
		return cnt == 1;
	}

	public boolean modifyAccount(Member member, String oldPassword) {
		
		// 비밀번호를 바꾸기 위해 입력했다면
		if(!member.getPassword().isBlank()) {
			
			// 입력된 비밀번호를 암호화
			String plain = member.getPassword();
			member.setPassword(passwordEncoder.encode(plain));
		}
		Member oldMember = mapper.selectById(member.getId());
		int cnt = 0;
		
		if(passwordEncoder.matches(oldPassword, oldMember.getPassword())) {
			// 기존 비밀번호와 같으면
			cnt = mapper.modify(member);			
		}
		return cnt == 1;
	}

}
