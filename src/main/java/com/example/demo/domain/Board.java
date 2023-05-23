package com.example.demo.domain;

import java.time.*;

import lombok.*;

@Data
public class Board {
		private Double price;
		private String title;
		private String address;
		private LocalDate inserted;
		private String writer;
		private int likes;

}
