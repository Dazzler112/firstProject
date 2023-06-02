package com.example.demo.service;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.controller.*;
import com.example.demo.domain.Product;
import com.example.demo.mapper.ProductMapper;

@Service
public class ProductService {

    @Autowired
    private ProductMapper mapper;

    public List<Product> listBoard1(String title, LocalDateTime inserted, String content) {
        return mapper.selectAll1(title, inserted, content);
    }

    public List<Product> listBoard2(Integer price, String title, LocalDateTime inserted, String address) {
        return mapper.selectAll2(price, title, inserted, address);
    }

    public List<Product> listBoard3(Integer price, String title, LocalDateTime inserted, String address, Integer likes) {
        return mapper.selectAll3(price, title, inserted, address, likes);
    }

	public List<Product> listBoard4(Integer price, String title, LocalDateTime inserted, String address,
			Integer likes) {

		return mapper.selectAll4(price, title, inserted, address, likes);
	}

	public List<Product> listBoard5(String title, LocalDateTime inserted, Integer views, Integer likes, Integer price,
			String content) {
		
		return mapper.selectAll5(title, inserted, views, likes, price, content);
	}

	public List<Product> listBoard6(String title, Integer price, LocalDateTime inserted, Integer price2, Integer price3,
			Integer likes) {
		
		return mapper.selectAll6(title, price, inserted, price, price, likes);
	}

	public List<Product> listBoard7(String title, Integer price, String address, LocalDateTime inserted) {
		
		return mapper.selectAll7(title, price, address, inserted);
	}

	public Product getProduct(Integer id) {
		return mapper.selectById(id);
	}

	public boolean updateProduct(Product product) {
        return mapper.updateProduct(product) > 0;
    }
	
}
