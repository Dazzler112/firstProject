package com.example.demo.domain;

import java.time.*;

import lombok.*;

@Data
public class AdBoard {

	private Integer id;
	private String title;
	private String body;
	private String writer;
	private String region;
	private LocalDateTime inserted;
	
	
}

