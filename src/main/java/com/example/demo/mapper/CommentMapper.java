package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface CommentMapper {
	
	@Select("""
			SELECT *
			FROM
			WHERE boardId = #{boardId}
			ORDER BY id DESC
			""")
	List<Comment> selectAllComment(Integer boardId);

}
