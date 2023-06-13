package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface MailMapper {

	@Insert("""
			INSERT INTO AuthenticNum (AuthenticationNum)
			VALUES (#{randomNumber})
			""")
	Integer saveRandomNum(int randomNumber);

	@Select("""
			SELECT *
			FROM AuthenticNum
			WHERE AuthenticationNum = #{randomNumber}
			""")
	List<AuthenticatedNum> checkAuthenticId(int randomNumber);

	
}
