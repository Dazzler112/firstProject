package com.example.demo.controller;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.Product;
import com.example.demo.service.ProductService;

@Controller
@RequestMapping("teamProject")
public class MainController {

    @Autowired
    private ProductService service;

    @GetMapping("list")
    public String list(Model model,
            @RequestParam(value = "title", defaultValue = "") String title,
            @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
            @RequestParam(value = "content", defaultValue = "") String content,
            @RequestParam(value = "price", defaultValue = "") Integer price,
            @RequestParam(value = "address", defaultValue = "") String address,
            @RequestParam(value = "likes", defaultValue = "") Integer likes
    ) {

//        List<Product> noticeList = service.listBoard1(title, inserted, content);
        List<Product> productList1 = service.listBoard1(price, title, inserted, address);
//        List<Product> productList2 = service.listBoard(price, title, inserted, address, likes);
        
//        model.addAttribute("notices", noticeList);
        model.addAttribute("productList1", productList1);
//        model.addAttribute("productList2", productList2);
        
        return "list";
    }
}
