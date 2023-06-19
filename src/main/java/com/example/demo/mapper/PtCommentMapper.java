package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface PtCommentMapper {

	@Select("""
			SELECT * 
			FROM PtComment
			WHERE boardId = #{boardId}
			ORDER BY id
			""")
	List<PtComment> selectAllByBoardId(Integer boardId);

	@Insert("""
			INSERT INTO PtComment (boardId, content, memberId)
			VALUES ( #{boardId}, #{content}, #{memberId} )
			""")
	Integer insert(PtComment comment);

	@Delete("""
			DELETE FROM PtComment
			WHERE id = #{id}
			""")
	Integer deleteById(Integer id);

	@Select("""
			SELECT *
			FROM PtComment
			WHERE id = #{id}
			""")
	PtComment selectById(Integer id);

	
	@Update("""
			UPDATE PtComment
			SET
				content = #{content}
			WHERE
				id = #{id}
			""")
	Integer update(PtComment comment);

}
















