package com.example.demo.domain;

import java.time.*;

import lombok.*;

@Data
public class FreeComment {
	
	private Integer id;
	private Integer boardId;
	private String content;
	private String memberId;
	private LocalDateTime inserted;
	private Integer depth;
	private Integer parentId;
	
	private Boolean editable;
}
