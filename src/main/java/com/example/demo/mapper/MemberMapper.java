package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface MemberMapper {

	@Insert("""
			INSERT INTO Member(id, password, nickName, address, name, gender, phoneNum, email)
			VALUES(#{id}, #{password}, #{nickName}, #{address}, #{name}, #{gender}, #{phoneNum}, #{email})
			""")
	Integer signUpInsert(Member member);

	@Select("""
			SELECT * 
			FROM Member
			""")
	List<Member> getAllUserList();

	@Select("""
			SELECT *
			FROM Member
			WHERE id = #{id}
			""")
	Member selectById(String id);

}
