package com.example.demo.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;
import com.example.demo.domain.*;

@Mapper
public interface CheatMapper {

	@Select("""
			SELECT * 
			FROM Cheat
			""")
	List<Cheat> selectAll();

	@Select("""
			<script>
			<bind name="pattern" value="search" />
			SELECT *
			FROM Cheat
			<where>
			
			<if test="type == 'phoneNum'">
				phoneNum LIKE #{pattern}	
			</if>						
			
			<if test="type == 'account'">
			 OR account LIKE #{pattern}
			</if>
			
			<if test="type == 'userId'">
		   	 OR userId LIKE #{pattern}			
			</if>

			<if test="type == 'email'">
		   	 OR email LIKE #{pattern}			
			</if>
			
		   	</where> 
		   	 </script>
			""")
	List<Cheat> selectByType(String search, String type);

	@Select("""
			<script>
			<bind name="pattern" value="search"/>
			SELECT COUNT(*)
			FROM Cheat
			<where>
			
			<if test="type == 'basic'">
				checkId LIKE 0	
			</if>	
			
			<if test="type == 'phoneNum'">
				phoneNum LIKE #{pattern}	
			</if>						
			
			<if test="type == 'account'">
			 OR account LIKE #{pattern}
			</if>
			
			<if test="type == 'nickName'">
		   	 OR nickName LIKE #{pattern}			
			</if>
			
			<if test="type == 'email'">
		   	 OR email LIKE #{pattern}			
			</if>
			
		   	</where> 
		   	 </script>
			""")
	Integer countAll(String search, String type);
	

}
