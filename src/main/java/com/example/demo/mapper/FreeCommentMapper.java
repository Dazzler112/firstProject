package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface FreeCommentMapper {
	
	@Select("""
			SELECT *
			FROM Comment
			WHERE boardId = #{boardId}
			ORDER BY id DESC
			""")
	List<FreeComment> selectAllComment(Integer boardId);

	@Insert("""
			INSERT INTO Comment(boardId, content,memberId)
			VALUES(#{boardId}, #{content}, #{memberId})
			""")
	Integer insert(FreeComment comment);

	@Delete("""
			DELETE FROM Comment
			WHERE id = #{id}
			""")
	Integer deleteCommentId(Integer id);
	
	@Select("""
			SELECT * FROM
			Comment 
			WHERE id = #{id}
			""")
	FreeComment selectById(Integer id);

	@Update("""
			UPDATE Comment
			SET
				content= #{content}
			WHERE
				id = #{id}
			""")
	Integer update(FreeComment comment);
	
	@Delete("""
			DELETE FROM Comment
			WHERE boardId = #{boardId}
			""")
	Integer deleteComment(Integer boardId);

}
