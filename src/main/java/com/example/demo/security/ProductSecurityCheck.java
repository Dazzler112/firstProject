package com.example.demo.security;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

@Component
public class ProductSecurityCheck {
	
	@Autowired
	private ProductMapper productMapper;
	
	public boolean checkBoardWriter(Authentication authentication, Integer productId) {
		Product product =  productMapper.getProductList(productId);
		
		String username = authentication.getName();
		String writer = product.getWriter();
		
		return username.equals(writer);
	}
}
