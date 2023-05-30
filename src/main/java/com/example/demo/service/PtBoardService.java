package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class PtBoardService {

	@Autowired
	private PtBoardMapper mapper;

	public List<PtBoard> listPtBoard() {
		List<PtBoard> list = mapper.seletAll_PtBoard();
		return list;
	}

	public PtBoard getPtBoard(Integer id) {
		return mapper.selectById(id);
	}

	public boolean addBoard(PtBoard ptBoard) {
		int cnt = mapper.insert(ptBoard);
		return cnt == 1;
	}

	public boolean ptRemove(Integer id) {
		int cnt = mapper.deleteById(id);
		return cnt == 1;
	}

	public boolean ptModify(PtBoard ptBoard) {
		int cnt = mapper.update(ptBoard);
		return cnt == 1;
	}
}
