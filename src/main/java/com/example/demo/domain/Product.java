package com.example.demo.domain;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class Product {
    private Integer price;
    private String title;
    private LocalDateTime inserted;
    private String address;
    private Integer likes;
    private String content;
}
