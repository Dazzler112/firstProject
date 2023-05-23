package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface BoardMapper {

	@Select("""
			SELECT
				price,
				title,
				address,
				inserted
			FROM Product
			""")
	List<Board> selectAll1();
	
	@Select("""
			SELECT
				price,
				title,
				address,
				inserted,
				likes
			FROM Product
			ORDER BY Likes DESC
			""")
	List<Board> selectAll2();
	
}
