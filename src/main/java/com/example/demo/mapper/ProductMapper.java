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

    List<Product> selectAll2(String title, Integer price, LocalDateTime inserted, String address);

    List<Product> selectAll3(String title, Integer price, LocalDateTime inserted, String address, Integer likes);

    List<Product> selectAll4(String title, Integer price, String title2, LocalDateTime inserted, String address, Integer likes);

    List<Product> selectAll5(String statusCode, String writer, String title, LocalDateTime inserted, Integer views,
                             Integer likes, Integer price, String content);

    List<Product> selectAll6(String title, Integer price, LocalDateTime inserted, Integer price2, Integer price3,
                             Integer likes);

    List<Product> selectAll7(String title, Integer price, String address, LocalDateTime inserted);

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
            statusCode,
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
           @Param("productId") Integer productId
       );

}
