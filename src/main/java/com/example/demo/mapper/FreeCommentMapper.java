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
			ORDER BY parentId ASC, id ASC
			""")
	List<FreeComment> selectAllComment(Integer boardId);

	@Insert("""
			INSERT INTO Comment(boardId, parentId,memberId,content, depth)
			VALUES(#{boardId},#{parentId},#{memberId}, #{content}, #{depth})
			""")
	@Options(useGeneratedKeys = true, keyProperty = "parentId", keyColumn = "parentId")
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
	FreeComment selectById(Integer id, Integer params);

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

	@Insert("""
			INSERT INTO Comment(boardId, content , memberId, depth, parentId)
			VALUES(#{boardId}, #{content}, #{memberId} ,#{depth} ,#{parentId})
			""")
	Integer insertReply(FreeComment comment);

	//댓글 정렬
	@Update("""
			UPDATE Comment
			SET depth = depth +1
			WHERE boardId = #{boardId} AND depth > #{newdepth}
			""")
	Integer updateCommentShape(Integer boardId, Integer newdepth);

	@Delete("""
			DELETE FROM Comment
			WHERE memberId = #{memberId}
			""")
	Integer deleteByMemberId(String memberId);

}
