package com.example.demo.mapper;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface BoardLikeMapper {

	@Insert("""
			INSERT INTO BoardLike
			VALUES (#{boardId}, #{memberId})
			""")
	int insert(BoardLike like);

	@Delete("""
			DELETE FROM BoardLike
			WHERE boardId = #{boardId}
			AND memberId = #{memberId}
			""")
	Integer delete(BoardLike like);
	
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
	BoardLike select(Integer boardId, String memberId);
}
