package com.example.demo.mapper;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface AdBoardLikeMapper {

	@Insert("""
			INSERT INTO AdBoardLike
			VALUES ( #{boardId}, #{memberId} )
			""")
	Integer insert(AdLike like);

	@Delete("""
			DELETE FROM AdBoardLike
			WHERE boardId = #{boardId}
				AND memberId = #{memberId}
			""")
	Integer delete(AdLike like);

	@Select("""
			SELECT COUNT(*) FROM AdBoardLike
			WHERE boardId = #{boardId}
			""")
	Integer countByBoardId(Integer boardId);

	@Select("""
			SELECT * 
			FROM AdBoardLike
			WHERE boardId = #{boardId}
				AND memberId = #{memberId}
			""")
	AdLike select(Integer boardId, String memberId);

	@Delete("""
			DELETE FROM AdBoardLike
			WHERE boardId = #{boardId}
			""")
	void deleteByBoardId(Integer boardId);

	@Delete("""
			DELETE FROM AdBoardLike
			WHERE memberId = #{memberId}
			""")
	void deleteByAdLikeMemberId(String memberId);
}












