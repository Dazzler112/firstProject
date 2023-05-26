package com.example.demo.domain;

import java.time.*;
import java.util.*;

import lombok.*;

@Data
public class FreeBoard {

	private Integer id;
	private String title;
	private String body;
	private String writer;
	private String region;
	private LocalDateTime inserted;
	
	private List<String> photoName;
	
	private Boolean liked;
	private Integer likeCount;
}
