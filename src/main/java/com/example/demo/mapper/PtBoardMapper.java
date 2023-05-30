package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface PtBoardMapper {

	@Select("""
			SELECT
				id,
				title,
				writer,
				inserted
			FROM PtBoard
			ORDER BY id DESC
			""")
	List<PtBoard> seletAll_PtBoard();

	@Select("""
			SELECT * FROM
				PtBoard
			WHERE id = #{id}
			""")
	PtBoard selectById(Integer id);

	@Insert("""
			INSERT INTO PtBoard (title, body, region, writer)
			VALUES ( #{title}, #{body}, #{region}, #{writer} )
			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	int insert(PtBoard ptBoard);

	@Delete("""
			DELETE FROM PtBoard
			WHERE id = #{id}
			""")
	int deleteById(Integer id);

	@Update("""
			UPDATE PtBoard
			SET
				title = #{title},
				body = #{body}
			WHERE id = #{id}
			""")
	int update(PtBoard ptBoard);

}
