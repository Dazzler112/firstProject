package com.example.demo.mapper;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface PtBoardLikeMapper {

	@Insert("""
			INSERT INTO PtBoardLike
			VALUES ( #{boardId}, #{memberId} )
			""")
	Integer insert(PtLike like);

	@Delete("""
			DELETE FROM PtBoardLike
			WHERE boardId = #{boardId}
				AND memberId = #{memberId}
			""")
	Integer delete(PtLike like);

	@Select("""
			SELECT COUNT(*) FROM PtBoardLike
			WHERE boardId = #{boardId}
			""")
	Integer countByBoardId(Integer boardId);

	@Select("""
			SELECT * 
			FROM PtBoardLike
			WHERE boardId = #{boardId}
				AND memberId = #{memberId}
			""")
	PtLike select(Integer boardId, String memberId);

	@Delete("""
			DELETE FROM PtBoardLike
			WHERE boardId = #{boardId}
			""")
	void deleteByBoardId(Integer boardId);
}












