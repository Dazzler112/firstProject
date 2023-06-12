package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface AdBoardMapper {

	@Select("""
			SELECT * FROM
			AdBoard
			ORDER BY id DESC
			""")
	List<AdBoard> selectAll();

	@Select("""
			SELECT 
				b.id,
				b.title,
				b.body,
				b.inserted,
				b.writer,
				f.fileName
			FROM AdBoard b LEFT JOIN AdFileName f ON b.id = f.boardId
			WHERE b.id = #{id}
			""")
	@ResultMap("boardResultMap")
	AdBoard selectById(Integer id);

	@Update("""
			UPDATE AdBoard
			SET
				title = #{title},
				body = #{body},
				writer = #{writer}
			WHERE
				id = #{id}
			""")
	int update(AdBoard board);

	@Delete("""
			DELETE FROM AdBoard
			WHERE id = #{id}
			""")
	int deleteById(Integer id);

	@Insert("""
			INSERT INTO AdBoard (title, body, writer, region, category)
			VALUES ( #{title}, #{body}, #{writer}, #{region}, #{category} )
			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	int insert(AdBoard board);

	@Insert("""
			INSERT INTO AdFileName (boardId, fileName)
			VALUES ( #{boardId}, #{fileName} )
			""")
	void insertFileName(Integer boardId, String fileName);

	@Delete("""
			DELETE FROM AdFileName
			WHERE boardId = #{boardId}
				AND fileName = #{fileName}
			""")
	void deleteFileNameByBoardIdAndFileName(Integer boardId, String fileName);

	@Select("""
			SELECT fileName FROM AdFileName
			WHERE boardId = #{boardId}
			""")
	List<String> selectFileNamesByBoardId(Integer boardId);

	@Delete("""
			DELETE FROM AdFileName
			WHERE boardId = #{boardId}
			""")
	void deleteFileNameByBoardId(Integer boardId);

	@Select("""
			<script>
			<bind name="pattern" value="'%' + search + '%'" />
			SELECT COUNT(*) 
			FROM AdBoard
			
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
				COUNT(f.id) fileCount,
			    (SELECT COUNT(*) 
			     FROM BoardLike 
			     WHERE boardId = b.id) likeCount,
			    (SELECT COUNT(*)
			     FROM Comment
			     WHERE boardId = b.id) commentCount
			     
			FROM AdBoard b LEFT JOIN AdFileName f ON b.id = f.boardId
			
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
			
			GROUP BY b.id
			ORDER BY b.id DESC
			LIMIT #{startIndex}, #{rowPerPage}
			</script>
			""")
	List<AdBoard> selectAllPaging(Integer startIndex, Integer rowPerPage, String search, String type);

}













