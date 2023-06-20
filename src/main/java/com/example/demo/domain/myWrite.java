package com.example.demo.domain;

import java.time.*;

import lombok.*;

@Data
public class myWrite {

	private String writer;
	private String title;
	private String body;
	private LocalDate inserted;
	private String region;
	private String sort;
	private Integer id;
}
