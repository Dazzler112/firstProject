package com.example.demo.domain;

import java.time.*;

import lombok.*;

@Data
public class Board {
		private Integer price;
		private String title;
		private LocalDate inserted;
		private String address;
		private Integer likes;

}
