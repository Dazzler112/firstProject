package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface AdCommentMapper {

	@Select("""
			SELECT * 
			FROM AdComment
			WHERE boardId = #{boardId}
			ORDER BY id
			""")
	List<AdComment> selectAllByBoardId(Integer boardId);

	@Insert("""
			INSERT INTO AdComment (boardId, content, memberId)
			VALUES ( #{boardId}, #{content}, #{memberId} )
			""")
	Integer insert(AdComment comment);

	@Delete("""
			DELETE FROM AdComment
			WHERE id = #{id}
			""")
	Integer deleteById(Integer id);

	@Select("""
			SELECT *
			FROM AdComment
			WHERE id = #{id}
			""")
	AdComment selectById(Integer id);

	
	@Update("""
			UPDATE AdComment
			SET
				content = #{content}
			WHERE
				id = #{id}
			""")
	Integer update(AdComment comment);

}
















