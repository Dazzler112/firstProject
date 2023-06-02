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
public class MainController {

    @Autowired
    private ProductService service;

    @GetMapping("list1")
    public String list1(Model model,
            @RequestParam(value = "title", defaultValue = "") String title,
            @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
            @RequestParam(value = "content", defaultValue = "") String content,
            @RequestParam(value = "price", defaultValue = "") Integer price,
            @RequestParam(value = "address", defaultValue = "") String address,
            @RequestParam(value = "likes", defaultValue = "") Integer likes
    ) {

        List<Product> noticeList = service.listBoard1(title, inserted, content);
        List<Product> productList1 = service.listBoard2(price, title, inserted, address);
        List<Product> productList2 = service.listBoard3(price, title, inserted, address, likes);
        
        model.addAttribute("notices", noticeList);
        model.addAttribute("productList1", productList1);
        model.addAttribute("productList2", productList2);
        
        return "mainList1";
    }
    
    
    @GetMapping("list2")
    public String list2(Model model,
            @RequestParam(value = "title", defaultValue = "") String title,
            @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
            @RequestParam(value = "content", defaultValue = "") String content,
            @RequestParam(value = "price", defaultValue = "") Integer price,
            @RequestParam(value = "address", defaultValue = "") String address,
            @RequestParam(value = "likes", defaultValue = "") Integer likes
    ) {

        List<Product> noticeList = service.listBoard1(title, inserted, content);
        List<Product> productList3 = service.listBoard4(price, title, inserted, address, likes);
        List<Product> productList2 = service.listBoard3(price, title, inserted, address, likes);
        
        model.addAttribute("notices", noticeList);
        model.addAttribute("productList3", productList3);
        model.addAttribute("productList2", productList2);
       
        return "mainList2";
    }
    
    @GetMapping("/id/{id}")
    public String product(@PathVariable("id") Integer id, Model model) {
    	Product product = service.getProduct(id);
    	model.addAttribute("product", product);
    	return "get";
    }
    
}
