package com.example.demo.controller;

import java.time.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.*;

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
    
    @PostMapping("remove")
    public String removeForm(Integer id, RedirectAttributes rttr) {
    	boolean ok = service.removeProcess(id);
    	
    	if(ok) {
    		rttr.addFlashAttribute("message", id +"번 게시물이 삭제되었습니다.");
    		return "redirect:/product/productlist";
    	} else {
    		System.out.println("실패함");
    		rttr.addFlashAttribute("message", "게시물 삭제에 실패하였습니다.");
    		return "redirect:/product/id" + id;
    	}
    }
    
    @GetMapping("/productUpdate/{id}")
    public String updateView(@PathVariable("id")Integer id, Model model) {
    	
    	model.addAttribute("product", service.getProduct(id));
    	return "product/productUpdate";
    }
    
    @PostMapping("ProductUpdate/{id}")
    public String update(Product product,
    		@RequestParam(value ="removeFiles", required = false) List<String> removeProductPhoto,
    		@RequestParam(value = "listFiles", required = false) MultipartFile[] addFile,
    		RedirectAttributes rttr) throws Exception {
    	boolean ok = service.updateProcess(product, removeProductPhoto, addFile);
    	
    	if(ok) {
    		rttr.addFlashAttribute("message", product.getId() + "번 게시물이 수정되었습니다.");
    		return "redirect:/product/id/" + product.getId();
    	} else {
    		rttr.addFlashAttribute("message", product.getId() + "게시물이 수정에 실패하였습니다.");
    		return "redirect:/product/id/" + product.getId();
    	}
    }
}
