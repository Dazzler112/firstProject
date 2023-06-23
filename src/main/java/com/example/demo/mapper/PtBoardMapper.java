package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface PtBoardMapper {

	@Select("""
			SELECT * FROM
			PtBoard
			ORDER BY id DESC
			""")
	List<PtBoard> selectAll();

	@Select("""
			SELECT 
				b.id,
				b.title,
				b.body,
				b.inserted,
				b.writer,
				b.region,
				f.fileName,

				(SELECT addressSggNm 
			         FROM Member 
			         WHERE id = b.writer)  
			         addressSggNm,

				(SELECT COUNT(*)
					FROM PtBoardLike
					WHERE boardId = b.id) likeCount,
				(SELECT COUNT(*)
			     	FROM PtComment
			     	WHERE boardId = b.id) commentCount
				FROM PtBoard b LEFT JOIN PtFileName f ON b.id = f.boardId			
				WHERE b.id = #{id}
			""")
	
	
	@ResultMap("boardResultMap")
	PtBoard selectById(Integer id);

	@Update("""
			UPDATE PtBoard
			SET
				title = #{title},
				body = #{body}
			WHERE
				id = #{id}
			""")
	int update(PtBoard board);

	@Delete("""
			DELETE FROM PtBoard
			WHERE id = #{id}
			""")
	int deleteById(Integer id);

	@Insert("""

			INSERT INTO PtBoard (title, body, writer, region, category, sort)
			VALUES ( #{title}, #{body}, #{writer}, #{region}, #{category}, #{sort} )

			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	int insert(PtBoard board);

	@Insert("""
			INSERT INTO PtFileName (boardId, fileName)
			VALUES ( #{boardId}, #{fileName} )
			""")
	void insertFileName(Integer boardId, String fileName);

	@Delete("""
			DELETE FROM PtFileName
			WHERE boardId = #{boardId}
				AND fileName = #{fileName}
			""")
	void deleteFileNameByBoardIdAndFileName(Integer boardId, String fileName);

	@Select("""
			SELECT fileName FROM PtFileName
			WHERE boardId = #{boardId}
			""")
	List<String> selectFileNamesByBoardId(Integer boardId);

	@Delete("""
			DELETE FROM PtFileName
			WHERE boardId = #{boardId}
			""")
	void deleteFileNameByBoardId(Integer boardId);

	@Select("""
			<script>
			<bind name="pattern" value="'%' + search + '%'" />
			SELECT COUNT(*) 
			FROM PtBoard
			
			<where>
				<if test="(type eq 'all') or (type eq 'title')">
				   title  LIKE #{pattern}
				</if>
				<if test="(type eq 'all') or (type eq 'body')">
				OR body   LIKE #{pattern}
				</if>
				<if test="(type eq 'all') or (type eq 'writer')">
				OR writer LIKE #{pattern}
				</if>
			</where>
			
			</script>
			""")
	Integer countAll(String search, String type);

	@Select("""
			<script>
			<bind name="pattern" value="'%' + search + '%'" />
			SELECT
				b.id,
				b.title,
				b.writer,
				b.inserted,
				b.category,
				(SELECT addressSggNm
				FROM Member
				WHERE id = b.writer)
				addressSggNm,
				COUNT(f.id) fileCount,
				(SELECT addressSggNm 
			         FROM Member 
			         WHERE id = b.writer)  
			         addressSggNm,
			    (SELECT COUNT(*) 
			     FROM PtBoardLike 
			     WHERE boardId = b.id) likeCount,
			    (SELECT COUNT(*)
			     FROM PtComment
			     WHERE boardId = b.id) commentCount
			     
			FROM PtBoard b LEFT JOIN PtFileName f ON b.id = f.boardId
			WHERE (b.category = #{category} OR #{category} IS NULL)
			
				<if test="type eq 'title'">
			         AND title LIKE #{pattern}
			     </if>
			     <if test="type eq 'body'">
			         AND body LIKE #{pattern}
			     </if>
			     <if test="type eq 'writer'">
			         AND writer LIKE #{pattern}
			     </if>
			
			GROUP BY b.id
			ORDER BY b.id DESC
			LIMIT #{startIndex}, #{rowPerPage}
			</script>
			""")
	@ResultMap("pagingMap")
	List<PtBoard> selectAllPaging(Integer startIndex, Integer rowPerPage, String search, String type, String category);

	
	@Select("""
			SELECT id
			FROM PtBoard
			WHERE writer = #{writer}
			""")
	List<Integer> selectIdByWriter(String writer);

	

}













