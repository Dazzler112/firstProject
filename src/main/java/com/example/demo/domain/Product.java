package com.example.demo.domain;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class Product {

   private Integer id;
   private Integer categoryId;
   private String memberId;
   private Integer qty;
   private String body;
   private Integer price;
   private String title;
   private LocalDateTime inserted;
   private Integer views;
   private String address;
   private Integer likes;
   private String content;
   private String statusCode;
   private String writer;
   private String modi;
   private String keyword;
  private String categoryName;
   private List<String> PhotoTitle;

}