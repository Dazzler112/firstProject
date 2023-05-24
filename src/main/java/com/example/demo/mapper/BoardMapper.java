package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface BoardMapper {

	@Select("""
			SELECT 
			id,
			title,
			writer,
			region,
			inserted
			FROM
			Board
			ORDER BY id DESC
			""")
	List<Board> listForm();

	@Select("""
			SELECT
				b.id,
				b.title,
				b.body,
				b.writer,
				b.region,
				b.inserted,
				p.photoName
			FROM Board b LEFT JOIN 
			PhotoName p ON b.id = p.boardId
			WHERE b.id = #{id}
			""")
	@ResultMap("getFile")
	Board getBoardList(Integer id);
	
	@Insert("""
			INSERT INTO Board(title,body,writer,region)
			VALUES(#{title}, #{body}, #{writer},#{region})
			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	Integer insertForm(Board board);

	@Insert("""
			INSERT INTO PhotoName(boardId, photoName)
			VALUES(#{boardId}, #{photoName})
			""")
	Integer insertFileName(Integer boardId, String photoName);

	// 게시글 삭제	
	@Delete("""
			DELETE FROM Board
			WHERE id = #{id}
			""")
	int removeForm(Integer id);

    //파일 있는 버전의 게시글 삭제전 조회
	@Select("""
			SELECT photoName FROM PhotoName
			WHERE boardId = #{boardId}
			""")
	List<String> selectFilebyBoardId(Integer boardId);
	//파일 버켓에서 삭제

	@Delete("""
			DELETE FROM PhotoName
			WHERE boardId = #{boardId}
			""")
	Integer removeFilebyBoardId(Integer boardId);
	
}
