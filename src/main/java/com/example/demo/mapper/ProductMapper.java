package com.example.demo.mapper;

import java.time.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import org.springframework.security.core.*;

import com.example.demo.domain.*;

@Mapper
public interface ProductMapper {

    

    List<Product> selectAll2(Integer price, String title, LocalDateTime inserted, String address);

    List<Product> selectAll3(Integer price, String title, LocalDateTime inserted, String address, Integer likes);

    List<Product> selectAll4(Integer price, String title, LocalDateTime inserted, String address, Integer likes);

    List<Product> selectAll5(String status, String writer, String title, LocalDateTime inserted, Integer views, Integer likes, Integer price, String content);

    List<Product> selectAll6(String title, Integer price, LocalDateTime inserted, Integer price2, Integer price3, Integer likes);

    List<Product> selectAll7(String title, Integer price, String address, LocalDateTime inserted);

    @Select("""
        SELECT *
        FROM Product
        WHERE id = #{id}
        """)
    Product selectById(Integer id);

    @Insert("""
    		INSERT INTO Product(CategoryId, title, body, price, address)
    		VALUES(#{CategoryId} ,#{title}, #{body}, #{price}, #{address})
    		""")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    Integer insertForm(Product product);
    
    @Insert("""
    		INSERT INTO ProductPhoto(ProductId, ProductTitle)
    		VALUES(#{productId}, #{photoTitle})
    		""")
    Integer insertFileName(Integer ProductId, String photoName);
    
    @Update("""
        UPDATE Product
        SET title = #{title}, inserted = #{inserted}, views = #{views}, likes = #{likes}, price = #{price}
        WHERE id = #{id}
        """)
    int updateProduct(Product product);
    
    @Delete("""
    		 DELETE FROM ProductPhoto
    		 WHERE ProductId = #{productid}
    		 AND photoName = #{photoName}
    		""")
    void deleteFileNameUpdate(Integer productId, String photoName);

	Product getProductList(Integer id);

	void updateFileName(Integer id, String originalFilename);
    
	// 게시글 삭제
	@Delete("""
			DELETE FROM Product
			WHERE id = #{id}
			""")
	int removeForm(Integer id);

	// 파일 있는 버전의 게시글 삭제전 조회
	@Select("""
			SELECT ProductPhoto FROM ProductPhoto
			WHERE prouctId = #{productId}
			""")
	List<String> selectFileByProductId(Integer ProductId);
	
	//파일 버켓에서 삭제
	@Delete("""
			DELECT FROM ProductPhoto
			WHERE productId = #{productId}
			""")
	Integer removeFilebyProductId(Integer productId);

	List<Product> getCountReply(Integer id);

	Product getProcess(Integer id, Authentication authentication);

	@Select("""
			SELECT * FROM
			Notice
			""")
	List<Notice> selectAll1(String title, LocalDateTime inserted, String body, String writer);
}
