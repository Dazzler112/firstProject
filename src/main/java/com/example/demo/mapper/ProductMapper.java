package com.example.demo.mapper;

import java.time.*;
import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface ProductMapper {

	List<Product> selectAll1(Integer price, String title, LocalDateTime inserted, String address);

//    List<Product> selectAll2(@Param("price") Integer price, @Param("title") String title, @Param("inserted") LocalDateTime inserted, @Param("address") String address);

//    List<Product> selectAll3(@Param("price") Integer price, @Param("title") String title, @Param("inserted") LocalDateTime inserted, @Param("address") String address, @Param("likes") Integer likes);

}
