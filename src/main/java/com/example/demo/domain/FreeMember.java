package com.example.demo.domain;

import java.util.*;

import lombok.*;

@Data
public class FreeMember {

	private String id;
	private String password;
	private String nickname;
	private String address;
	private List<String> authority;
}
