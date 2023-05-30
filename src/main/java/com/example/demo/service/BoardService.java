package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.example.demo.controller.*;
import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	public List<Board> listBoard() {
		List<Board> QuickMenu = mapper.selectAll();
		return QuickMenu;
	}

}
