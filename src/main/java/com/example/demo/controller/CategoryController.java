package com.example.demo.controller;

import java.time.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.service.*;

import ch.qos.logback.core.joran.spi.NoAutoStart;

@Controller
@RequestMapping("SecondStop")
public class CategoryController {

   @Autowired
   private ProductService service;
   @Autowired
   private ProductMapper mapper;

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
      } else if (category.equals("hobby")) {
         title = "취미";
      } else if (category.equals("share")) {
         title = "나눔";
      }
      
      return title;
   }

   @GetMapping("list3")
   public String list3(Model model,
         
         @RequestParam(value = "title", defaultValue = "") String title,
         @RequestParam(value = "price", defaultValue = "") Integer price,
         @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
         @RequestParam(value = "likes", defaultValue = "") Integer likes,
         @RequestParam(value = "category", defaultValue = "") String category) {
      String categoryTitle = getCategoryTitle(category);

      List<Product> categoryList = service.listBoard6(categoryTitle, price, inserted, price, price, likes);

      model.addAttribute("CategoryList", categoryList);

      return "categoryList";
   }

   @GetMapping("list4")
   public String list4(Model model,   
         @RequestParam(value = "search", defaultValue = "") String search,
         @RequestParam(value= "page", defaultValue ="1") Integer page,
         @RequestParam(value = "title", defaultValue = "") String title,
         @RequestParam(value = "price", defaultValue = "") Integer price,
         @RequestParam(value = "address", defaultValue = "") String address,
         @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
         @RequestParam(value = "category", defaultValue = "") String category) {
      String categoryTitle = getCategoryTitle(category);
      
//      쿼리에서 사용하는 시작 인덱스
      Integer startIndex =(page -1) * 12;
      
//      페이지네이션 가장 왼쪽번호
      Integer leftPageNum = (page -1) / 10*10+1;
      Integer rightPageNum = leftPageNum +9;
      
//      이전페이지 번호
      Integer prevPageNum = leftPageNum -10;
      Integer nextPageNum = rightPageNum +1;
//      하나씩 이동 번호
      Integer prevPageNum1 = page -1;
      Integer nextPageNum1 =page + 1;   
//      마지막 페이지 번호
      Integer numOfRecord = mapper.countAll();
      Integer lastPageNum =(numOfRecord -1) / 15 +1;
      
//      오른쪽 페이지 번호가 마지막 페이지 번호보다 클 수 없음
      rightPageNum = Math.min(rightPageNum, lastPageNum);
      //수정 및 삭제버튼 보이게하는 코드
      /* List<Product> pagenation = mapper.listcustomer(startIndex); */
      List<Product> categoryList = service.listBoard7(startIndex, title, categoryTitle, price, address, inserted, search);
      
      model.addAttribute("CategoryList", categoryList);
      /* model.addAttribute("pagenation", pagenation); */
      model.addAttribute("rightPageNum" , rightPageNum);
      model.addAttribute("leftPageNum" , leftPageNum);
      model.addAttribute("nextPageNum" , nextPageNum);
      model.addAttribute("prevPageNum" , prevPageNum);
      model.addAttribute("lastPageNum", lastPageNum);
      model.addAttribute("currentPageNum", page);
      model.addAttribute("prevPageNum1", prevPageNum1);
      model.addAttribute("nextPageNum1", nextPageNum1);

      return "categoryList";
   }
   
   /*
    * @GetMapping("list5") public String mthod1(Model
    * model, @RequestParam(value="search" , defaultValue="") String keyword) {
    * 
    * model.addAttribute("customerList",mapper.sql1(keyword));
    * 
    * return "/teamProject/list4";
    * 
    * }
    */
      
}