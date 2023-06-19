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
	
	public List<Product> listBoard(Integer id) {
		List<Product> QuickMenu = mapper.productId(id);
		return QuickMenu;
	}
	

//public Map<String, Object> listBoard(Integer page, String search, String type) {
//		
//		// 페이지당 행의 수
//				Integer rowPerPage = 10;
//
//				// 쿼리 LIMIT 절에 사용할 시작 인덱스
//				Integer startIndex = (page - 1) * rowPerPage;
//
//				// 페이지네이션이 필요한 정보
//				// 전체 레코드 수
//				Integer numOfRecords = mapper.countAll(search, type);
//				// 마지막 페이지 번호
//				Integer lastPageNumber = (numOfRecords - 1) / rowPerPage + 1;
//				// 페이지네이션 왼쪽번호
//				Integer leftPageNum = page - 5;
//				// 1보다 작을 수 없음
//				leftPageNum = Math.max(leftPageNum, 1);
//
//				// 페이지네이션 오른쪽번호
//				Integer rightPageNum = leftPageNum + 9;
//				// 마지막페이지보다 클 수 없음
//				rightPageNum = Math.min(rightPageNum, lastPageNumber);
//
//				Map<String, Object> pageInfo = new HashMap<>();
//				pageInfo.put("rightPageNum", rightPageNum);
//				pageInfo.put("leftPageNum", leftPageNum);
//				pageInfo.put("currentPageNum", page);
//				pageInfo.put("lastPageNum", lastPageNumber);
//
//				// 게시물 목록
//				List<PtBoard> list = mapper.selectAllPaging(startIndex, rowPerPage, search, type);
//
//				return Map.of("pageInfo", pageInfo,
//						"ptBoardList", list);
//	}

}
