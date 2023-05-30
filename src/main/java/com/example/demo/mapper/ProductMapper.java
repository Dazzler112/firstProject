package com.example.demo.mapper;

import java.time.*;
import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface ProductMapper {

	List<Product> selectAll1(String title, LocalDateTime inserted, String content);

    List<Product> selectAll2(Integer price, String title, LocalDateTime inserted, String address);

    List<Product> selectAll3(Integer price, String title, LocalDateTime inserted, String address, Integer likes);
    
	@Select("""
			SELECT *
			FROM Product
			WHERE id = #{id}
			""")
	Product selectById(Integer id);

}
