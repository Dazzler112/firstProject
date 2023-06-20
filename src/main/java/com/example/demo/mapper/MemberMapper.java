package com.example.demo.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;
import com.example.demo.domain.*;

@Mapper
public interface MemberMapper {

	@Insert("""
			INSERT INTO Member(id, password, nickName, address, name, gender, phoneNum, email)
			VALUES(#{id}, #{password}, #{nickName}, #{address}, #{name}, #{gender}, #{phoneNum}, #{email})
			""")
	Integer signUpInsert(Member member);

	@Select("""
			SELECT *
			FROM Member
			""")
	List<Member> getAllUserList();

	@Select("""
			SELECT *
			FROM Member m LEFT JOIN MemberAuthority ma ON m.id = ma.memberId
			WHERE id = #{id}
			""")
	@ResultMap("memberMap")
	Member selectById(String id);

	@Select("""
			SELECT *
			FROM Member
			WHERE PhoneNum = #{phoneNum}
			""")
	Member selectByPhoneNum(String phoneNum);

	@Select("""
			SELECT *
			FROM Member
			WHERE NickName = #{nickName}
			""")
	Member selectByNickName(String nickName);

	@Delete("""
			DELETE FROM Member
			WHERE id = #{id}
			""")
	Integer deleteById(String id);

	@Update("""
			<script>
			UPDATE Member
			SET
			 	<if test="password neq null and password neq ''">
			 		password = #{password},
			 	</if>

			 	name = #{name},
				phoneNum = #{phoneNum},
				nickName = #{nickName},
				address = #{address}
			WHERE id = #{id}
			</script>
			""")
	Integer modify(Member member);

	@Select("""
			<script>
			<bind name="pattern" value="'%' + search + '%'" />
			SELECT COUNT(*)
			FROM Member
			<where>

			<if test="type == 'all'">
				id LIKE #{pattern}
			 OR nickName LIKE #{pattern}
			  	 OR name LIKE #{pattern}
			  	 OR phoneNum LIKE #{pattern}
			  	 OR email LIKE #{pattern}
			</if>

			<if test="type == 'id'">
				id LIKE #{pattern}
			</if>

			<if test="type == 'nickName'">
			 OR nickName LIKE #{pattern}
			</if>

			<if test="type == 'name'">
			  	 OR name LIKE #{pattern}
			</if>

			<if test="type == 'phoneNum'">
			  	 OR phoneNum LIKE #{pattern}
			</if>

			<if test="type == 'email'">
			  	 OR email LIKE #{pattern}
			</if>

			  	</where>
			  	 </script>
			""")
	Integer countAll(String search, String type);

	@Select("""
			<script>
			<bind name="pattern" value="'%' + search + '%'" />
			SELECT
				id,
				password,
				nickName,
				address,
				name,
				gender,
				phoneNum,
				email
			FROM Member
			<where>
				<if test="(type eq 'all') or (type eq 'id')">
				   id  LIKE #{pattern}
				</if>
				<if test="(type eq 'all') or (type eq 'nickName')">
				OR nickName   LIKE #{pattern}
				</if>
				<if test="(type eq 'all') or (type eq 'name')">
				OR name LIKE #{pattern}
				</if>
				<if test="(type eq 'all') or (type eq 'phoneNum')">
				OR phoneNum LIKE #{pattern}
				</if>
				<if test="(type eq 'all') or (type eq 'email')">
				OR email LIKE #{pattern}
				</if>
			</where>
			ORDER BY id DESC
			LIMIT #{startIndex}, #{rowPerPage}
			</script>
			""")
	List<Member> selectAllPaging(Integer startIndex, Integer rowPerPage, String search, String type);

	@Select("""
			SELECT
				id
			FROM Member
			WHERE name = #{name}
			and email = #{email}
			""")
	String findId(String name, String email);

	@Select("""
			SELECT id
			FROM Member
			WHERE name = #{name} and email = #{email}
			""")
	String checkUser(String name, String email);

	@Update("""
			UPDATE Member
			SET password = #{encodePw}
			WHERE name = #{name} and email=#{email};
			""")
	Integer updatePw(String name, String email, String encodePw);

	@Select("""
			SELECT sort, region, title, body, id, inserted FROM Board WHERE writer = #{id}
			UNION
			SELECT sort, region, title, body, id, inserted FROM AdBoard WHERE writer = #{id}
			UNION
			SELECT sort, region, title, body, id, inserted FROM PtBoard WHERE writer = #{id};
			""")
	List<myWrite> getUserWriting(String id);

}
