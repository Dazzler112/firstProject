package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class AdBoardService {

	@Autowired
	private AdBoardMapper mapper;
	
	public List<AdBoard> listBoard(){
		List<AdBoard> list = mapper.selectAll_Board();
		return list;
	}

	public List<AdBoard> listAdBoard() {
		List<AdBoard> list = mapper.selectAll_AdBoard();
		return list;
	}

	public List<PtBoard> listPtBoard() {
		List<PtBoard> list = mapper.selectAll_PtBoard();
		return list;
	}


	public AdBoard getAdBoard(Integer id) {

		return mapper.selectById(id);
	}

	public boolean addBoard(AdBoard adBoard) {
		int cnt = mapper.insert(adBoard);
		return cnt == 1;
	}
	
	public boolean adRemove(Integer id) {
		int cnt = mapper.deleteById(id);
		return cnt == 1;
	}

	public boolean adModify(AdBoard adBoard) {
		int cnt = mapper.update(adBoard);
		return cnt == 1;
	}
	
	
}