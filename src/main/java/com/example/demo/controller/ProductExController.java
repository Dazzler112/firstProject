package com.example.demo.controller;

import java.time.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;

@Controller
@RequestMapping("teamProject")
public class ProductExController {

    @Autowired
    private ProductService service;

    @GetMapping("list3")
    public String list3(Model model,
            @RequestParam(value = "title", defaultValue = "") String title,
            @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
            @RequestParam(value = "views", defaultValue = "") Integer views,
            @RequestParam(value = "likes", defaultValue = "") Integer likes,
            @RequestParam(value = "price", defaultValue = "") Integer price,
            @RequestParam(value = "content", defaultValue = "") String content
    ) {

        List<Product> productList4 = service.listBoard5(title, inserted, views, likes, price, content);

        model.addAttribute("productList4", productList4);
        
        return "exList";
    }
    
}