package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class CheatService {

	@Autowired
	CheatMapper mapper;

	public List<Cheat> cheatCheck(String search, String type) {
		List<Cheat> cheatCheck = mapper.selectByType(search, type);
		return cheatCheck;
	}

	public Integer cheatCount(String search, String type) {
		Integer cheatCheckCount = mapper.countAll(search, type);
		return cheatCheckCount;
	}
	
	
}
