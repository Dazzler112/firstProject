package com.example.demo.domain;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class Product {
	private Integer id;
    private Integer price;
    private String title;
    private LocalDateTime inserted;
    private Integer views;
    private String address;
    private Integer likes;
    private String content;
    private String status;
    private String writer;
}
