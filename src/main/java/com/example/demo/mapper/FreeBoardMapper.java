package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface FreeBoardMapper {

	@Select("""
			SELECT 
			id,
			title,
			writer,
			region,
			inserted,
			boardCategory,
			FROM
			Board
			ORDER BY id DESC
			""")
	List<FreeBoard> listForm();

	@Select("""
			SELECT
				b.boardCategory,
				b.id,
				b.title,
				b.body,
				b.writer,
				b.region,
				b.inserted,
				p.photoName,
				(SELECT COUNT (*)
				FROM Comment
				WHERE boardId = b.id) commentCount,
				(SELECT COUNT(*) 
			     FROM BoardLike 
			     WHERE boardId = b.id) likeCount
			FROM Board b LEFT JOIN 
			PhotoName p ON b.id = p.boardId
			WHERE b.id = #{id}
			""")
	@ResultMap("getFile")
	FreeBoard getBoardList(Integer id);
	
	@Insert("""
			INSERT INTO Board(boardCategory,title,body,writer,region)
			VALUES(#{boardCategory} ,#{title}, #{body}, #{writer},#{region})
			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	Integer insertForm(FreeBoard board);

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

	//일반 업데이트
	@Update("""
			UPDATE Board
			SET
			 boardCategory = #{boardCategory},
			 title = #{title},
			 body = #{body},
			 region = #{region}
			WHERE id = #{id}
			""")
	int updateBoard(FreeBoard board);
	
	//수정 - 파일삭제
	@Delete("""
			DELETE FROM PhotoName
			WHERE boardId = #{boardId}
			AND photoName = #{photoName}
			""")
	void deleteFileNameUpdate(Integer boardId, String photoName);
	
	@Insert("""
			INSERT INTO PhotoName(boardId, photoName)
			VALUES(#{boardId}, #{photoName})
			""")
	Integer updatetFileName(Integer boardId, String photoName);

	@Select("""
			SELECT 
			b.boardCategory,
			b.id,
			b.title,
			b.writer,
			b.region,
			b.inserted,
			COUNT(p.id) fileCount,
			(SELECT COUNT (*)
			FROM Comment
			WHERE boardId = b.id) commentCount
			FROM
			Board b LEFT JOIN PhotoName p ON b.id = p.boardId
			GROUP BY
				b.id, b.title, b.writer, b.region, b.inserted
			ORDER BY id DESC
			""")
//	@ResultMap("getListCount")
	List<FreeBoard> getCountList();

	@Select("""
			SELECT 
			b.id,
			b.title,
			b.writer,
			b.region,
			b.inserted,
			COUNT(c.id) commentCount
			FROM Board b LEFT JOIN Comment c ON b.id = c.boardId
			WHERE b.id = #{id}
			GROUP BY
			b.id, b.title, b.writer, b.region, b.inserted
			""")
	@ResultMap("replyCount")
	List<FreeBoard> replyCounting(Integer id);
	
//	paging
	@Select("""
			<script>
			<bind name="pattern" value="'%' + search + '%'"/>
			SELECT 
			b.id,
			b.title,
			b.writer,
			b.region,
			b.inserted,
			b.boardCategory,
			COUNT(p.id) fileCount,
			(SELECT COUNT (*)
			FROM Comment
			WHERE boardId = b.id) commentCount,
			(SELECT COUNT(*) 
			     FROM BoardLike 
			     WHERE boardId = b.id) likeCount
			FROM
			Board b LEFT JOIN PhotoName p ON b.id = p.boardId
			<where>
			<if test ="(type eq 'all') or (type eq 'title')">
				title LIKE #{pattern}
			</if>
			<if test="(type eq 'all') or (type eq 'body')">
				OR body LIKE #{pattern}
			</if>
			<if test="(type eq 'all') or (type eq 'writer')">
				OR writer LIKE #{pattern}
			</if>
			</where>
			GROUP BY
				b.id, b.title, b.writer, b.region, b.inserted ,b.boardCategory
			ORDER BY id DESC
			</script>
			""")
	List<FreeBoard> selectPaging( String search, String type);

	//검색 구조 기본설정
	@Select("""
			<script>
			<bind name="pattern" value="'%' + search + '%'" />
			SELECT COUNT(*)
			FROM Board
			
			<where>
			<if test="(type eq 'all') or (type eq 'title')">
				title LIKE #{pattern}
			</if>
			<if test="(type eq 'all') or (type eq 'body')">
				OR body LIKE #{pattern}
			</if>
			<if test="(type eq 'all') or (type eq 'writer')">
				OR writer LIKE #{pattern}
			</if>
			</where>
		
			</script>
			""") 
	Integer countRecord(String search, String type);
	
	@Select("""
			SELECT 
			id,
			title,
			writer,
			region,
			inserted,
			boardCategory
			FROM
			Board
			WHERE boardCategory = #{boardCategory}
			""")
	List<FreeBoard> categoryListForm(String boardCategory);

	
}
