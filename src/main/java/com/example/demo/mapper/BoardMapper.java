package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface BoardMapper {

	@Select("""
			SELECT
			id,
			StatusCode,
			title,
			memberId,
			inserted,
			views,
			likes,
			price
			FROM
			Product
			WHERE id=#{id}
			""")
	List<Product> productId(Integer id);
}
