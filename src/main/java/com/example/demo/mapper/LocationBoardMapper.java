package com.example.demo.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.domain.*;

@Mapper
public interface LocationBoardMapper {

	@Select("""
			SELECT 
			id,
			title,
			body,
			writer,
			region,
			inserted
			FROM
			LocationBoard
			ORDER BY id DESC
			""")
	List<LocationBoard> mainListForm();

}
