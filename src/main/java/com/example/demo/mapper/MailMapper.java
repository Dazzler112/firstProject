package com.example.demo.mapper;

import org.apache.ibatis.annotations.*;

@Mapper
public interface MailMapper {

	@Insert("""
			INSERT INTO AuthenticNum
			VALUES (#{randomNumber})
			""")
	Integer saveRandomNum(int randomNumber);

	
}
