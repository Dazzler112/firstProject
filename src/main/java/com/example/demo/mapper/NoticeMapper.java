package com.example.demo.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;
import com.example.demo.domain.*;

@Mapper
public interface NoticeMapper {

	@Select("""
			SELECT *
			FROM Notice
			""")
	List<Notice> selectAll();

	@Select("""
			SELECT *
			FROM Notice
			WHERE id = #{id}
			""")
	Notice selectById(Integer id);

	@Insert("""
			INSERT INTO Notice(title, body, writer)
			VALUES(#{title}, #{body}, #{writer})
			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	Integer addNotice(Notice notice);

	@Delete("""
			DELETE FROM Notice
			WHERE id = #{id}
			""")
	Integer removeNotice(Integer id);

	@Update("""
			UPDATE Notice
			SET
			 	title = #{title},
			 	body = #{body}
			WHERE
				id = #{id}
			""")
	Integer updateNotice(Notice notice);

	@Select("""
			<script>
			<bind name="pattern" value="'%' + search + '%'" />
			SELECT COUNT(*)
			FROM Notice
			<where>
			
			<if test="type == 'all'">
				title LIKE #{pattern}	
			 OR body LIKE #{pattern}
		   	 OR writer LIKE #{pattern}
			</if>
			
			<if test="type == 'title'">
				title LIKE #{pattern}	
			</if>						
			
			<if test="type == 'body'">
			 OR body LIKE #{pattern}
			</if>
			
			<if test="type == 'writer'">
		   	 OR writer LIKE #{pattern}			
			</if>
		   	</where> 
		   	 </script>
			""")
	Integer countAll(String search, String type);

	@Select("""
			<script>
			<bind name="pattern" value="'%' + search + '%'" />
			SELECT *											
			FROM Notice
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
			ORDER BY id DESC
			LIMIT #{startIndex}, #{rowPerPage}
			</script>
			""")
	List<Notice> selectAllPaging(Integer startIndex, Integer rowPerPage, String search, String type);

}
