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
public class CategoryController {

    @Autowired
    private ProductService service;

    @GetMapping("list4")
    public String list4(Model model,
            @RequestParam(value = "title", defaultValue = "") String title,
            @RequestParam(value = "price", defaultValue = "") Integer price,
            @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
            @RequestParam(value = "likes", defaultValue = "") Integer likes,
            @RequestParam(value = "category", defaultValue = "fashion") String category
    ) {
        String categoryTitle = getCategoryTitle(category);
        
        List<Product> categoryList = service.listBoard6(categoryTitle, price, inserted, price, price, likes);
        
        model.addAttribute("CategoryList", categoryList);
        
        return "categoryList";
    }
    
    @GetMapping("list5")
    public String list5(Model model,
            @RequestParam(value = "title", defaultValue = "") String title,
            @RequestParam(value = "price", defaultValue = "") Integer price,
            @RequestParam(value = "address", defaultValue = "") String address,
            @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
            @RequestParam(value = "category", defaultValue = "hobby") String category
    ) {
        String categoryTitle = getCategoryTitle(category);
        
        List<Product> categoryList = service.listBoard7(categoryTitle, price, address, inserted);
        
        model.addAttribute("CategoryList", categoryList);
        
        return "CategoryList";
    }

    private String getCategoryTitle(String category) {
        String title = "";
        if (category.equals("fashion")) {
            title = "패션";
        } else if (category.equals("furniture")) {
            title = "가구";
        } else if (category.equals("game")) {
            title = "게임";
        } else if (category.equals("luxury")) {
            title = "명품";
        } else if (category.equals("electronics")) {
            title = "전자기기";
        }

        return title;
    }
    
    @GetMapping("list6")
    public String list6(Model model,
            @RequestParam(value = "title", defaultValue = "") String title,
            @RequestParam(value = "price", defaultValue = "") Integer price,
            @RequestParam(value = "address", defaultValue = "") String address,
            @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted
    ) {

        List<Product> CategoryList = service.listBoard7(title, price, address, inserted);
        
        model.addAttribute("CategoryList", CategoryList);
        
        return "CategoryList";
    }

}