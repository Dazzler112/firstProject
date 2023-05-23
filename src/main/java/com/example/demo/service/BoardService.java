package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class BoardService {

	@Autowired
	BoardMapper mapper;

	public List<Notice> getNotice() {
		List<Notice> noticeList = mapper.selectAll();
		return noticeList;
	}

	public Notice getNotice(Integer id) {
		Notice notice = mapper.selectById(id);
		return notice;
	}

	public boolean addNotice(Notice notice) {
		int cnt = mapper.addNotice(notice);
		return cnt == 1;
	}

	public boolean removeNotice(Integer id) {
		int cnt = mapper.removeNotice(id);
		return cnt == 1;
	}

	public boolean update(String title, String body, Integer id) {
		int cnt = mapper.updateNotice(title, body, id);
		return cnt == 1;
	}
}