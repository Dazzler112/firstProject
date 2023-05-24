package com.example.demo.service;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.domain.Product;
import com.example.demo.mapper.ProductMapper;

@Service
public class ProductService {

    @Autowired
    private ProductMapper mapper;

    public List<Product> listBoard1(Integer price, String title, LocalDateTime inserted, String address) {
        return mapper.selectAll1(price, title, inserted, address);
    }

//    public List<Product> listBoard2(Integer price, String title, LocalDateTime inserted, String address) {
//        return mapper.selectAll2(price, title, inserted, address);
//    }

//    public List<Product> listBoard(Integer price, String title, LocalDateTime inserted, String address, Integer likes) {
//        return mapper.selectAll3(price, title, inserted, address, likes);
//    }

}

