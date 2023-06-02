package com.example.demo.mapper;

import java.time.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.example.demo.domain.*;

@Mapper
public interface ProductMapper {

    List<Product> selectAll1(String title, LocalDateTime inserted, String content);

    List<Product> selectAll2(Integer price, String title, LocalDateTime inserted, String address);

    List<Product> selectAll3(Integer price, String title, LocalDateTime inserted, String address, Integer likes);

    List<Product> selectAll4(Integer price, String title, LocalDateTime inserted, String address, Integer likes);

    List<Product> selectAll5(String title, LocalDateTime inserted, Integer views, Integer likes, Integer price, String content);

    List<Product> selectAll6(String title, Integer price, LocalDateTime inserted, Integer price2, Integer price3, Integer likes);

    List<Product> selectAll7(String title, Integer price, String address, LocalDateTime inserted);

    @Select("""
        SELECT *
        FROM Product
        WHERE id = #{id}
        """)
    Product selectById(Integer id);

    @Update("""
        UPDATE Product
        SET title = #{title}, inserted = #{inserted}, views = #{views}, likes = #{likes}, price = #{price}
        WHERE id = #{id}
        """)
    
	int updateProduct(Product product);
}
