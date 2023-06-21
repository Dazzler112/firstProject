package com.example.demo.mapper;

import java.time.*;
import java.util.*;

import org.apache.ibatis.annotations.*;
import org.springframework.security.core.*;

import com.example.demo.domain.*;

@Mapper
public interface ProductMapper {   


    List<Product> selectAll2(String title, Integer price, LocalDateTime inserted, String address);

    List<Product> selectAll3(String title, Integer price, LocalDateTime inserted, String address, Integer likes);

    List<Product> selectAll4(String title, Integer price, String title2, LocalDateTime inserted, String address, Integer likes);

    List<Product> selectAll5(String statusCode, String writer, String title, LocalDateTime inserted, Integer views,
                             Integer likes, Integer price, String content);

    List<Product> selectAll6(String title, Integer price, LocalDateTime inserted, Integer price2, Integer price3,
                             Integer likes);
    
//    카테고리리스트 
    List<Product> selectAll7( String categoryTitle, String title, Integer price, String address, LocalDateTime inserted);

    @Select("SELECT * FROM Product WHERE id = #{id}")
    Product selectById(Integer id);

    @Insert("INSERT INTO Product(CategoryId, MemberID, writer, title, body, price, address, Qty) " +
            "VALUES(#{categoryId}, #{memberId}, #{writer}, #{title}, #{body}, #{price}, #{address}, #{qty})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    Integer insertForm(Product product);

    @Insert("INSERT INTO ProductPhoto(ProductID, ProductTitle) VALUES(#{productId}, #{photoTitle})")
    Integer insertFileName(@Param("productId") Integer productId, @Param("photoTitle") String photoTitle);

    @Update("UPDATE Product SET CategoryId = #{categoryId}, title = #{title}, body = #{body}, " +
            "price = #{price}, qty = #{qty}, address = #{address} WHERE id = #{id}")
    int updateProduct(Product product);

    @Delete("DELETE FROM ProductPhoto WHERE ProductID = #{productId} AND ProductTitle = #{photoTitle}")
    int deleteFileNameUpdate(@Param("productId") Integer productId, @Param("photoTitle") String photoTitle);

    Product getProductList(Integer id);

    void updateFileName(Integer id, String originalFilename);

    @Delete("DELETE FROM Product WHERE id = #{id}")
    int removeForm(Integer id);

    @Select("SELECT ProductTitle FROM ProductPhoto WHERE productId = #{productId}")
    List<String> selectFileByProductId(Integer productId);

    @Delete("DELETE FROM ProductPhoto WHERE productId = #{productId}")
    Integer removeFileByProductId(Integer productId);

    List<Product> getCountReply(Integer id);

    Product getProcess(Integer id, Authentication authentication);

    @Select("SELECT * FROM Notice")
    List<Notice> selectAll1(String title, LocalDateTime inserted, String body, String writer);

    @Select("""

          SELECT

          id,

          StatusCode,

          title,

          memberId,

          inserted,

          views,

          likes,

          price

          FROM

          Product

          ORDER BY id DESC

          """)

          List<Product> allProduct();

    		@Select("""
			
			SELECT
            
            ProductTitle
         
         FROM
         
            ProductPhoto
         
         WHERE ProductId=#{id}
            
         """)
   String allProductPhoto(Integer id);

   @Insert("""
         INSERT INTO ProductLike
         VALUES (#{productId}, #{memberId})
         """)
   Integer insert(Like like);

   @Delete("""
         DELETE FROM Product
         WHERE productId = #{productId}
            AND memberId = #{memberId}
         """)
   Integer delete(Like like);

//    검색을 하기위함
    @Select("""
         <script>
         <bind name="pattern" value="'%' + search + '%'" />
         SELECT COUNT(*)
         FROM Board
         
         <where>
         <if test="(type eq 'all') or (type eq 'title')">
            title LIKE #{pattern}
         </if>
         <if test="(type eq 'all') or (type eq 'body')">
            OR body LIKE #{pattern}
         </if>
         <if test="(type eq 'all') or (type eq 'writer')">
            OR writer LIKE #{pattern}
         </if>
         </where>
      
         </script>
         """) 
   Integer countRecord(String search, String type);
    
   /*
    * // 어디서 몇개를 보여줄지 정해주기
    * 
    * @Select(""" SELECT
    *
    * FROM Product
    * 
    * 
    * ORDER BY ID DESC LIMIT #{startIndex}, 2 """)
    * 
    * List<Product> listcategorypage(Integer startIndex);
    * 
    * //끝에서의 페이지 번호 정하기
    * 
    * @Select(""" SELECT COUNT(*) FROM Product ID """) Integer countAll();
    */
   
//    처음 시작페이지 에서 몇개까지 보여줄지 정하는 코드
    @Select("""

    		SELECT 
    			*
    		FROM Product 
    		
    		
    		ORDER BY ID DESC 
    		LIMIT #{startIndex},  12
    		""")

	List<Product> listcustomer(Integer startIndex);
    
    @Select("""
    		SELECT COUNT(*)FROM Product
    		""")

	Integer countAll();
    
	/*
	 * @Select(""" <script> <bind name="pattern" value="'%'+keyword+'%'"/> SELECT
	 * id, name, contanctName address FROM Product where ORDER BY id DESC </script>
	 * """) List<Product> sql1(String keyword);
	 */

    



    
	/*
	 * @Select(""" SELECT memberId, address, title FROM Product WHERE Product LIKE
	 * #{keyword} ORDER BY ID DESC """) List<Product> keyword(String keyword);
	 */

    
    
	
	

    

}