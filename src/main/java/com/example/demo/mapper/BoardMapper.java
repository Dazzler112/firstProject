package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface BoardMapper {

	@Select("""
			SELECT *
			FROM Notice
			""")
	List<Notice> selectAll();

	@Select("""
			SELECT *
			FROM Notice
			WHERE id = #{id}
			""")
	Notice selectById(Integer id);

	@Insert("""
			INSERT INTO Notice(title, body, writer)
			VALUES(#{title}, #{body}, #{writer})
			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	Integer addNotice(Notice notice);

	@Delete("""
			DELETE FROM Notice
			WHERE id = #{id}
			""")
	Integer removeNotice(Integer id);

	@Update("""
			UPDATE Board
			SET
			 	title = #{title},
			 	body = #{body}
			WHERE
				id = #{id}
			""")
	Integer updateNotice(String title, String body, Integer id);

}
