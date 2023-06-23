package com.example.demo.mapper;

import java.util.*;

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

	@Select("""
			SELECT COUNT(*) FROM ProductLike
			WHERE productId = #{productId}
			""")
	Integer countByProductId(Integer id);

	@Select("""
	        SELECT p.* FROM Product p
	        INNER JOIN ProductLike pl ON p.id = pl.productId
	        WHERE pl.memberId = #{memberId}
	        """)
	List<Product> selectLikedProductsByMemberId(String memberId);
	
	@Select("""
	        SELECT * FROM Product
	        """)
	List<Product> selectAllProducts();
}
