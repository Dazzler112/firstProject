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

	public List<Board> listBoard(Double price, String title, String address, Optional<LocalDateTime> inserted,
			String writer, Integer likes) {

		return mapper.selectAll();
	}

}