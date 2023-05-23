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
				inserted,
				writer,
				likes
			FROM Product
			ORDER BY likes
			""")
	List<Board> selectAll();
	
}
