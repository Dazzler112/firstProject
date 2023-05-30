package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class LocationBoardService {

	@Autowired
	private LocationBoardMapper locationMapper;

	public List<LocationBoard> mainList() {

		List<LocationBoard> mainList = locationMapper.mainListForm();
		return mainList;
	}
}
