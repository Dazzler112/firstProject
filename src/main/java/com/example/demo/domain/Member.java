package com.example.demo.domain;

import java.util.*;

import lombok.*;

@Data
public class Member {

	private String id;
	private String password;
	private String nickName;
	private String address;
	private String name;
	private String gender;
	private String phoneNum;
	private String email;
	private List<String> authority;
	
}
