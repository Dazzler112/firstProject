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
            "price = #{price}, address = #{address} WHERE id = #{id}")
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
			statusCode,
			productId,
			title,
			inserted,
			body,
			writer,
			price,
			views,
			likes,
			(select case when max(memberID) is not null then  'Y' else 'N' end From Product a where a.writer = b.memberId) as modi,
			memberId
			FROM
			Product b
			WHERE
			statusCode = #{statusCode}
			AND title = #{title}
			AND inserted = #{inserted}
			AND body = #{body}
			AND writer = #{writer}
			AND price = #{price}
			AND views = #{views}
			AND likes = #{likes}
			AND modi = #{modi}
			AND memberId = #{memberId}
			AND productId = #{productId}
			ORDER BY inserted DESC
			""")
	List<Product> selectExList(
			@Param("statusCode") String statusCode,
			@Param("title") String title,
			@Param("inserted") LocalDateTime inserted,
			@Param("body") String body,
			@Param("writer") String writer,
			@Param("price") Integer price,
			@Param("views") Integer views,
			@Param("likes") Integer likes,
			@Param("modi") String modi,
			@Param("memberId") String memberId,
			@Param("productId") Integer productId);

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

    		WHERE id=#{id}

    		""")

    		List<Product> allProduct1(Integer id);

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
   
    @Select("""
    		SELECT 
    			*
    		FROM Product 
    		
    		
    		ORDER BY ID DESC 
    		LIMIT #{startIndex},  15
    		""")

	List<Product> selectAllPaging(Integer startIndex);
	
    

}
