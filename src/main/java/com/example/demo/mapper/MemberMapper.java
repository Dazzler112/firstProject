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

}
