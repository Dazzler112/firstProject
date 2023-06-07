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
			FROM Member
			WHERE id = #{id}
			""")
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
	Integer remove(String id);

	@Update("""
			<script>
			UPDATE Member
			SET
			 	<if test="password neq null and password neq ''">
			 		password = #{password},
			 	</if>
			 	
				phoneNum = #{phoneNum},
				nickName = #{nickName}
			WHERE id = #{id}
			</script>
			""")
	Integer modify(Member member);

}
