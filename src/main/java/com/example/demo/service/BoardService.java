package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	public List<Board> listBoard(){
		List<Board> list = mapper.selectAll_Board();
		return list;
	}

	public List<AdBoard> listAdBoard() {
		List<AdBoard> list = mapper.selectAll_AdBoard();
		return list;
	}
	
	
}
