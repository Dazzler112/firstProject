package com.example.demo.security;

import org.springframework.stereotype.*;

@Component
public class CustomUserDetailService {

	/*
	 * @Autowired private MemberMapper mapper;
	 * 
	 * @Override public UserDetails loadUserByUsername(String username) throws
	 * UsernameNotFoundException {
	 * 
	 * Member member = mapper.selectById(username);
	 * 
	 * if(member == null) { throw new UsernameNotFoundException(username +
	 * "회원이 없습니다."); }
	 * 
	 * // 1-1 = 1-2를 풀어 쓴것 List<SimpleGrantedAuthority> authorityList = new
	 * ArrayList<>();
	 * 
	 * for (String auth : member.getAuthority()) { authorityList.add(new
	 * SimpleGrantedAuthority(auth)); }
	 * 
	 * UserDetails user = User.builder() .username(member.getId())
	 * .password(member.getPassword()) .authorities(authorityList) .build();
	 * 
	 * return user; }
	 */
}
