package com.example.demo.domain;

import java.time.*;
import java.util.*;

import lombok.*;

@Data
public class AdBoard {

	private Integer id;
	private String title;
	private String body;
	private LocalDate inserted;
	private String writer;
	private String region;
	private String category;

	private List<String> fileName;

	private Boolean like;

	private Integer fileCount;
	private Integer likeCount;
	private Integer commentCount;
}
