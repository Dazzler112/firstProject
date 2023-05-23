package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface BoardMapper {

	@Select("""
			SELECT
				id, 
				title, 
				writer, 
				inserted
			FROM Board
			ORDER BY id DESC
			""")
	List<Board> selectAll_Board();

	@Select("""
			SELECT
				id,
				title,
				writer,
				inserted
			FROM AdBoard
			ORDER BY id DESC
			""")
	List<AdBoard> selectAll_AdBoard();

	@Select("""
			SELECT
				id,
				title,
				writer,
				inserted
			FROM PtBoard
			ORDER BY id DESC
			""")
	List<PtBoard> selectAll_PtBoard();

	@Select("""
			SELECT
				title,
				body,
				writer,
				inserted
			FROM Board
			WHERE id = #{id}
			""")
	Board selectById(Integer id);

	

}













