package com.example.demo.mapper;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface FreeBoardLikeMapper {

	@Insert("""
			INSERT INTO BoardLike
			VALUES (#{boardId}, #{memberId})
			""")
	int insert(FreeBoardLike like);

	@Delete("""
			DELETE FROM BoardLike
			WHERE boardId = #{boardId}
			AND memberId = #{memberId}
			""")
	Integer delete(FreeBoardLike like);
	
	//좋아요 카운팅
	@Select("""
			SELECT COUNT(*) FROM
			BoardLike WHERE boardId = #{boardId}
			""")
	Integer countBoardId(Integer boardId);
	
	//눌렀으면 검은색 유지
	@Select("""
			SELECT * 
			FROM BoardLike
			WHERE boardId = #{boardId}
			AND memberId = #{memberId}
			""")
	FreeBoardLike select(Integer boardId, String memberId);
}
