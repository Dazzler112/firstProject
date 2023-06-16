package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
public class NoticeService {

	@Autowired
	NoticeMapper mapper;

	public Map<String, Object> listNotice(Integer page, String search, String type) {
//		List<Notice> noticeList = mapper.selectAll();
//		return noticeList;
		// 페이지 당 행의 수
				Integer rowPerPage = 10;
				// 쿼리 LIMIT 절에 사용할 시작 인덱스
				Integer startIndex = (page - 1) * rowPerPage;
				
				// 페이지네이션이 필요한 정보
				// 전체 레코드 수
				Integer numOfRecords = mapper.countAll(search, type);

				// 맨처음 페이지
				Integer firstPageNum = 1;
				// 마지막 페이지 번호
				Integer lastPageNum = (numOfRecords - 1) / rowPerPage + 1;

				// 페이지네이션 왼쪽번호
				Integer leftPageNum = page - 5;
				// 1보다 작을 수 없음
				leftPageNum = Math.max(leftPageNum, 1);

				// 페이지네이션 오른쪽번호
				Integer rightPageNum = leftPageNum + 9;
				// 마지막페이지보다 클 수 없음
				rightPageNum = Math.min(rightPageNum, lastPageNum);

				// 현재 페이지
				Integer currentPageNum = page;

				Map<String, Object> pageInfo = new HashMap<>();
				pageInfo.put("rightPageNum", rightPageNum);
				pageInfo.put("leftPageNum", leftPageNum);
				pageInfo.put("currentPageNum", page);
				pageInfo.put("firstPageNum", firstPageNum);
				pageInfo.put("lastPageNum", lastPageNum);

				// 게시물 목록
				List<Notice> list = mapper.selectAllPaging(startIndex, rowPerPage, search, type);
				return Map.of("pageInfo", pageInfo, "noticeList", list);
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

	public boolean update(Notice notice) {
		int cnt = mapper.updateNotice(notice);
		return cnt == 1;
	}
}