package com.example.demo.mapper;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.security.core.Authentication;

import com.example.demo.domain.Like;
import com.example.demo.domain.Notice;
import com.example.demo.domain.Product;

@Mapper
public interface ProductMapper {

	List<Product> selectAll2(Integer id, String photoTitle, String title, Integer price, LocalDateTime inserted,
			String address);

	List<Product> selectAll3(Integer id, String photoTitle, String title, Integer price, LocalDateTime inserted,
			String address, Integer like);


	List<Product> selectAll4(Integer id, String photoTitle, String memberId, String title, Integer price,
			LocalDateTime inserted, String address, Integer like);

	List<Product> selectLikedProductsByMemberId(String memberId);


	List<Product> selectAll5(String statusCode, String writer, String title, LocalDateTime inserted, Integer views,
			Integer likes, Integer price, String content);


	List<Product> selectAll6(String title, Integer price, LocalDateTime inserted, Integer price2, Integer price3,
			Integer likes);

//    카테고리리스트 


	List<Product> selectAll7(Integer startIndex, String categoryTitle, String title, Integer price, String address,
			LocalDateTime inserted);


	@Select("SELECT * FROM Product WHERE id = #{id}")
	Product selectById(Integer id);


	@Insert("INSERT INTO Product(CategoryId, MemberID, writer, title, body, price, address, Qty) "
			+ "VALUES(#{categoryId}, #{memberId}, #{writer}, #{title}, #{body}, #{price}, #{address}, #{qty})")

	@Options(useGeneratedKeys = true, keyProperty = "id")
	Integer insertForm(Product product);

	@Insert("INSERT INTO ProductPhoto(ProductID, ProductTitle) VALUES(#{productId}, #{photoTitle})")
	Integer insertFileName(@Param("productId") Integer productId, @Param("photoTitle") String photoTitle);


	@Update("UPDATE Product SET CategoryId = #{categoryId}, title = #{title}, body = #{body}, "
			+ "price = #{price}, qty = #{qty}, address = #{address} WHERE id = #{id}")
	int updateProduct(Product product);

	@Update("UPDATE ProductPhoto SET ProductID = #{productId}, ProductTitle = #{productTitle}, ProductId = #{productId}"
			+ ", PhotoTitle = #{photoTitle})")
	int updateProductPhoto(Product product);

	@Delete("DELETE FROM ProductPhoto WHERE ProductID = #{productId} AND ProductTitle = #{photoTitle}")
	int deleteFileNameUpdate(@Param("productId") Integer productId, @Param("photoTitle") String photoTitle);

	Product getProductList(Integer id);

	@Update("""
			UPDATE ProductPhoto SET ProductTitle = #{productTitle}
			WHERE ProductId = #{id}
			""")
	void updateFileName(Integer id, String productTitle);

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

			 price,

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
	List<Product> selectExList(@Param("statusCode") String statusCode, @Param("title") String title,
			@Param("inserted") LocalDateTime inserted, @Param("body") String body, @Param("writer") String writer,
			@Param("price") Integer price, @Param("views") Integer views, @Param("likes") Integer likes,
			@Param("modi") String modi, @Param("memberId") String memberId, @Param("productId") Integer productId);

	@Select("""

			SELECT

			id,

			StatusCode,

			title,

			memberId,

			inserted,


			views,

			likes,

			price,
			
			body,
         
         categoryId,
         
         (select CategoryName from Category WHERE CategoryId = p.CategoryId) CategoryName

         FROM


         Product p

			

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
			SELECT COUNT(*) FROM Product
			""")
	Integer countAll();

	@Select("""
			SELECT *
			FROM Product
			ORDER BY ID DESC
			LIMIT #{startIndex}, 12
			""")
	List<Product> listcustomer(Integer startIndex);


	@Insert("""

			INSERT INTO Product (title, body, writer)
			VALUES (#title}, #{body}, #{writer})
			""")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	int insert(Product product);


	String getCategoryName(Integer categoryId);



}