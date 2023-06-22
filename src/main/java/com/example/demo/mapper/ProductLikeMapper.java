package com.example.demo.mapper;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface ProductLikeMapper {

	@Insert("""
			INSERT INTO ProductLike
			VALUES (#{productId}, #{memberId})
			""")
	Integer insert(ProductLike productLike);

	@Delete("""
			DELETE FROM ProductLike
			WHERE productId = #{productId}
			   AND memberId = #{memberId}
			""")
	Integer delete(ProductLike productLike);
}
