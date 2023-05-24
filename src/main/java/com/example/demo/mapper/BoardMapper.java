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
				*
			FROM AdBoard
			WHERE id = #{id}
			""")
	Board selectById(Integer id);

	@Insert("""
			INSERT INTO AdBoard (title, body, region)
			VALUES ( #{title}, #{body}, #{region} )			
			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	int insert(AdBoard adBoard);

	

}













