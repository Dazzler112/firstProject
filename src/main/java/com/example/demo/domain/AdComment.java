package com.example.demo.domain;

import java.time.*;

import lombok.*;

@Data
public class AdComment {
	
	private Integer id;
	private Integer boardId;
	private String content;
	private String memberId;
	private LocalDate inserted;
	
	private boolean editable;
}
