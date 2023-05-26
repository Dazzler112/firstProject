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

}
