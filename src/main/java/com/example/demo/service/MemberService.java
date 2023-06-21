package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//보드 서비스
	@Autowired
	private FreeBoardService freeBoardService;
	@Autowired
	private AdBoardService adBoardService;
	@Autowired
	private PtBoardService ptBoardService;
//======================================================================

	//comment Mapper
	@Autowired
	private FreeCommentMapper freeCommentMapper;
	@Autowired
	private PtCommentMapper ptCommentMapper;
	@Autowired
	private AdCommentMapper adCommentMapper;
//======================================================================
	
	//like Mapper
	@Autowired
	private FreeBoardLikeMapper freeLikeMapper;
	@Autowired
	private PtBoardLikeMapper ptLikeMapper;
	@Autowired
	private AdBoardLikeMapper adLikeMapper;
//======================================================================

	public boolean signup(Member member) {

		// 비밀번호 암호화
		String plain = member.getPassword();
		member.setPassword(passwordEncoder.encode(plain));

		int cnt = mapper.signUpInsert(member);
		return cnt == 1;
	}

	public Map<String, Object> userList(Integer page, String search, String type) {
//		List<Member> userList = mapper.getAllUserList();
//		return userList;
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
		
		List<Member> userList = mapper.selectAllPaging(startIndex, rowPerPage, search, type);
		return Map.of("pageInfo", pageInfo, "userList", userList);
		
	}

	public Map<String, Object> checkId(String id) {
		Member member = mapper.selectById(id);
		return Map.of("available", member == null);
	}

	public Map<String, Object> checkPhoneNum(String phoneNum, Authentication authentication) {
		Member member = mapper.selectByPhoneNum(phoneNum);
		if (authentication != null) {
			Member oldMember = mapper.selectById(authentication.getName());

			return Map.of("available", member == null || oldMember.getPhoneNum().equals(phoneNum));
		} else {

			return Map.of("available", member == null);
		}
	}

	public Map<String, Object> checkNickName(String nickName, Authentication authentication) {
		Member member = mapper.selectByNickName(nickName);
		if (authentication != null) {
			Member oldMember = mapper.selectById(authentication.getName());

			return Map.of("available", member == null || oldMember.getNickName().equals(nickName));
		} else {
			return Map.of("available", member == null);
		}
	}

	public Member getUser(String id) {
		return mapper.selectById(id);
	}

	public boolean removeAccount(Member member) {
		Member oldMember = mapper.selectById(member.getId());
		int cnt = 0;
		if (passwordEncoder.matches(member.getPassword(), oldMember.getPassword())) {
			// 암호가 같다면

			// 이 회원이 작성한 게시물 row 삭제
			freeBoardService.removeByWriter(member.getId()); // 자유게시판
			ptBoardService.removeByPtWriter(member.getId()); // pt보드
			adBoardService.removeByAdWriter(member.getId()); // ad보드
			
			// 이 회원이 작성한 댓글 삭제
			freeCommentMapper.deleteByMemberId(member.getId()); // 자유게시판
			ptCommentMapper.deleteByPtMemberId(member.getId()); // pt게시판
			adCommentMapper.deleteByAdMemberId(member.getId()); // ad게시판
			
			//이 회원이 좋아요한 레코드 삭제
			freeLikeMapper.deleteByMemberId(member.getId()); // 자유게시판
			ptLikeMapper.deleteByPtLikeMemberId(member.getId()); // pt게시판
			adLikeMapper.deleteByAdLikeMemberId(member.getId()); // ad게시판
			
			// 회원 테이블 삭제

			cnt = mapper.deleteById(member.getId());
		}
		return cnt == 1;
	}

	public boolean modifyAccount(Member member, String oldPassword) {

		// 비밀번호를 바꾸기 위해 입력했다면
		if (!member.getPassword().isBlank()) {

			// 입력된 비밀번호를 암호화
			String plain = member.getPassword();
			member.setPassword(passwordEncoder.encode(plain));
		}
		Member oldMember = mapper.selectById(member.getId());		
		int cnt = 0;

		if (passwordEncoder.matches(oldPassword, oldMember.getPassword())) {
			// 기존 비밀번호와 같으면
			cnt = mapper.modify(member);
		}
		return cnt == 1;
	}

	public String findId(String name, String email) {
		
		String result = "";
		
		try {
		 result= mapper.findId(name, email);
		 
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return result ;
	}

	public List<myWrite> getUserWriting(String id) {
		List<myWrite> userWriting = mapper.getUserWriting(id);
		return userWriting;
	}


}
