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

import com.example.demo.domain.Notice;
import com.example.demo.domain.Product;

@Mapper
public interface ProductMapper {

	List<Product> selectAll2(Integer price, String title, LocalDateTime inserted, String address);

	List<Product> selectAll3(Integer price, String title, LocalDateTime inserted, String address, Integer likes);

	List<Product> selectAll4(String memberId, Integer price, String title, LocalDateTime inserted, String address,
			Integer likes);

	List<Product> selectAll5(String status, String writer, String title, LocalDateTime inserted, Integer views,
			Integer likes, Integer price, String content);

	List<Product> selectAll6(String title, Integer price, LocalDateTime inserted, Integer price2, Integer price3,
			Integer likes);

	List<Product> selectAll7(String title, Integer price, String address, LocalDateTime inserted);

	@Select("SELECT * FROM Product WHERE id = #{id}")
	Product selectById(Integer id);

	@Insert("INSERT INTO Product(CategoryId, MemberID, title, body, price, address, Qty) " +
			"VALUES(#{categoryId}, #{memberId}, #{title}, #{body}, #{price}, #{address}, #{qty})")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	Integer insertForm(Product product);

	@Insert("INSERT INTO ProductPhoto(ProductId, ProductTitle) VALUES(#{productId}, #{photoTitle})")
	Integer insertFileName(@Param("productId") Integer productId, @Param("photoTitle") String photoTitle);

	@Update("UPDATE Product SET CategoryId = #{categoryId}, title = #{title}, body = #{body}, " +
			"price = #{price}, address = #{address} WHERE id = #{id}")
	int updateProduct(Product product);

	@Delete("DELETE FROM ProductPhoto WHERE ProductId = #{productId} AND ProductTitle = #{photoTitle}")
	int deleteFileNameUpdate(@Param("productId") Integer productId, @Param("photoTitle") String photoTitle);

	Product getProductList(Integer id);

	void updateFileName(Integer id, String originalFilename);

	@Delete("DELETE FROM Product WHERE id = #{id}")
	int removeForm(Integer id);

	@Select("SELECT ProductPhoto FROM ProductPhoto WHERE prouctId = #{productId}")
	List<String> selectFileByProductId(Integer ProductId);

	@Delete("DELETE FROM ProductPhoto WHERE productId = #{productId}")
	Integer removeFilebyProductId(Integer productId);

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

}
