package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface FreeBoardMapper {

	@Select("""
			SELECT 
			b.id,
			b.title,
			b.writer,
			b.inserted,
			b.boardCategory,
			(SELECT addressSggNm 
            FROM Member 
            WHERE id = b.writer)  
            addressSggNm
			FROM
			Board b
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
				b.inserted,
				p.photoName,
				(SELECT addressSggNm 
			     FROM Member 
                 WHERE id = b.writer)  
                 addressSggNm,
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
			INSERT INTO Board(boardCategory,title,body,writer)
			VALUES(#{boardCategory} ,#{title}, #{body}, #{writer})
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
			 body = #{body}
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
			b.inserted,
			COUNT(p.id) fileCount,
			(SELECT addressSggNm FROM
			Member 
			WHERE memberId = id) addressSggNm
			(SELECT COUNT (*)
			FROM Comment
			WHERE boardId = b.id) commentCount
			FROM
			Board b LEFT JOIN PhotoName p ON b.id = p.boardId
			GROUP BY
				b.id, b.title, b.writer, b.inserted
			ORDER BY id DESC
			""")
//	@ResultMap("getListCount")
	List<FreeBoard> getCountList();

	@Select("""
			SELECT 
			b.id
			, b.title
			, b.writer
			, b.inserted
			, b.boardCategory
			, COUNT(c.id) commentCount,
			(
			SELECT addressSggNm FROM
			Member 
			WHERE memberId = id
			) 
			addressSggNm
		FROM Board b LEFT JOIN Comment c ON b.id = c.boardId
		WHERE b.id = #{id}
		GROUP BY
		b.id, b.title, b.writer, b.inserted, b.boardCategory
			""")
	@ResultMap("replyCount")
	List<FreeBoard> replyCounting(Integer id);
	
//	paging
	@Select("""
			  <script>
    <bind name="pattern" value="'%' + search + '%'" />
    SELECT b.id
           , b.title
           , b.writer
           , b.inserted
           , COUNT(p.id) fileCount
           , b.boardCategory,
           (SELECT addressSggNm 
            FROM Member 
            WHERE id = b.writer)  
            addressSggNm,
           (
            SELECT COUNT (*)
            FROM Comment
            WHERE boardId = b.id
           ) commentCount,
           (
            SELECT COUNT(*) 
            FROM BoardLike 
            WHERE boardId = b.id
           ) likeCount 
    FROM   Board b LEFT JOIN PhotoName p ON b.id = p.boardId
    WHERE  (b.boardCategory = #{boardCategory} OR #{boardCategory} IS NULL)
     <if test="search != null">
        <if test="type eq 'title'">
            AND title LIKE #{pattern}
        </if>
        <if test="type eq 'body'">
            AND body LIKE #{pattern}
        </if>
        <if test="type eq 'writer'">
            AND writer LIKE #{pattern}
        </if>
     </if>
    GROUP BY b.id
             , b.title
             , b.writer
             , b.inserted 
             , b.boardCategory
    ORDER BY id DESC LIMIT #{startIndex}, #{rowPage}
    </script>
			""")
	@ResultMap("pagingMap")
	List<FreeBoard> selectPaging( Integer startIndex, Integer rowPage, String search, String type, String boardCategory);

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
			SELECT id
			FROM Board
			WHERE writer = #{writer}
			""")
	List<Integer> selectByWriter(String writer);
	
//	@Select("""
//			SELECT 
//			b.id,
//			b.title,
//			b.writer,
//			b.region,
//			b.inserted,
//			b.boardCategory,
//			(SELECT COUNT(p.id)
//			FROM PhotoName p 
//			WHERE boardId = b.id)fileCount,
//			(SELECT COUNT(*)
//			FROM Comment
//			WHERE boardId = b.id) commentCount,
//			(SELECT COUNT(*) 
//			 FROM BoardLike
//			 WHERE boardId = b.id) likeCount
//			FROM
//			Board b
//			WHERE boardCategory = #{boardCategory}
//			ORDER BY b.id DESC
//			""")
//	@ResultMap("boardCategoryMap")
//	List<FreeBoard> categoryListForm(String boardCategory);
}
