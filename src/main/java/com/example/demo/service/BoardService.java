package com.example.demo.service;

import java.time.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;

	public List<Board> listBoard(Integer price, String title, Optional<LocalDateTime> inserted, String address) {
		// TODO Auto-generated method stub
		return mapper.selectAll1();
	}

	public List<Board> listBoard(Integer price, String title, Optional<LocalDateTime> inserted, String address,
			Integer likes) {
		// TODO Auto-generated method stub
		return mapper.selectAll2();
	}

}