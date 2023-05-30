package com.example.demo.domain;

import java.time.*;

import lombok.*;

@Data
public class Notice {

	private Integer id;
	private String title;
	private String writer;
	private String body;
	private LocalDateTime inserted;
}