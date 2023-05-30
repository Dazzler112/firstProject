package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface AdBoardMapper {

	@Select("""
			SELECT
				id, 
				title, 
				writer, 
				inserted
			FROM Board
			ORDER BY id DESC
			""")
	List<AdBoard> selectAll_Board();

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
	AdBoard selectById(Integer id);

	@Insert("""
			INSERT INTO AdBoard (title, body, region)
			VALUES ( #{title}, #{body}, #{region} )			
			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	int insert(AdBoard adBoard);
	
	@Update("""
			UPDATE AdBoard
			SET
				title = #{title},
				body = #{body}
			WHERE id = #{id}
			""")
	int update(AdBoard adBoard);

	@Delete("""
			DELETE FROM AdBoard
			WHERE id = #{id}
			""")
	int deleteById(Integer id);

	

}












