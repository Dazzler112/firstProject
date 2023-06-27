
package com.example.demo.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.domain.Notice;
import com.example.demo.domain.Product;
import com.example.demo.domain.ProductLike;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.service.ProductService;

@Controller
@RequestMapping("SecondStop")
public class MainController {

   @Autowired
   private ProductService service;
   
   @Autowired
   private ProductMapper mapper;

   @GetMapping("list1")
   
   public String list1(Model model, @RequestParam(value = "id", defaultValue = "") Integer id,
         @RequestParam(value = "photoTitle", defaultValue = "") String photoTitle,
         @RequestParam(value = "title", defaultValue = "") String title,
         @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
         @RequestParam(value = "body", defaultValue = "") String body,
         @RequestParam(value = "writer", defaultValue = "") String writer,
         @RequestParam(value = "price", defaultValue = "") Integer price,
         @RequestParam(value = "address", defaultValue = "") String address,

         @RequestParam(value = "likes", defaultValue = "") Integer likes) {


      List<Notice> noticeList = service.listBoard1(title, inserted, body, writer);
      List<Product> productList1 = service.listBoard2(id, photoTitle, price, title, inserted, address);
      List<Product> productList2 = service.listBoard3(id, photoTitle, price, title, inserted, address, likes);

      model.addAttribute("notice", noticeList);
      model.addAttribute("productList1", productList1);
      model.addAttribute("productList2", productList2);

      return "mainList1";
   }

   @GetMapping("list2")

   public String list2( Model model, 
         @RequestParam(value = "id", defaultValue = "") Integer id,
         @RequestParam(value = "photoTitle", defaultValue = "") String photoTitle,
         @RequestParam(value = "title", defaultValue = "") String title,
         @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
         @RequestParam(value = "body", defaultValue = "") String body,
         @RequestParam(value = "writer", defaultValue = "") String writer,
         @RequestParam(value = "price", defaultValue = "") Integer price,
         @RequestParam(value = "address", defaultValue = "") String address,
         @RequestParam(value = "like", defaultValue = "") Integer like,
         @RequestParam(value = "memberId", defaultValue = "") String memberId,
      Authentication authentication   ) {
      
      System.out.println(authentication.getName());
      List<Product> list = service.productListService1(id);
      List<Notice> noticeList = service.listBoard1(title, inserted, body, writer);
      List<Product> productList3 = service.listBoard3(id, photoTitle, price, title, inserted, address, like);
      List<Product> productList4 = service.listBoard4(id, photoTitle, authentication.getName(), memberId, title, price, inserted, address,like);
      System.out.println(productList4);
      
      model.addAttribute("notice", noticeList);
      model.addAttribute("productList3", productList3);
      model.addAttribute("productList4", productList4);
   
      return "mainList2";

   }

   @GetMapping("/exList/{id}")

   public String product1(@PathVariable("id") Integer id, Model model,
         @RequestParam(value = "likes", defaultValue = "") Integer likes,
         @RequestParam(value = "photoTitle", defaultValue = "") String photoTitle,
         @RequestParam(value = "title", defaultValue = "") String title,
         @RequestParam(value = "price", defaultValue = "") Integer price,
         @RequestParam(value = "address", defaultValue = "") String address,
         @RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
         @RequestParam(value = "category", defaultValue = "") String category) {
      List<Product> list = service.productListService1(id);
      
      List<Product> productList3 = service.listBoard3(id, photoTitle, price, title, inserted, address, likes);
      
   
      String productPhoto = service.getProductPhoto(id);

      list.forEach(p -> p.setPhotoTitle(productPhoto));
      
      model.addAttribute("productList3", productList3);
      model.addAttribute("list", list);

      return "exList";
   }

   @GetMapping("/id/{id}")
   @PreAuthorize("isAuthenticated() and !hasAuthority('cheat')")
   
   public String product(@PathVariable("id") Integer id, Model model) {
      Product product = service.getProduct(id);
      model.addAttribute("product", product);
      return "get";
   }

   @PostMapping("mainAdd")
   public String addForm(@RequestParam("files") MultipartFile[] files, @RequestParam("category") Integer category,
         Product product, RedirectAttributes rttr, Model model, Authentication authentication) throws Exception {
     

      product.setMemberId(authentication.getName());
      boolean ok = service.addProduct(product, files, category);

      model.addAttribute("product", product);
      if (ok) {
         rttr.addFlashAttribute("message", "게시글이 생성되었습니다.");
         return "redirect:/SecondStop/exList/" + product.getId();
      } else {
         rttr.addFlashAttribute("message", product.getId() + "게시글 생성에 실패하였습니다.");
         return "redirect:mainList2";
      }
   }

   @GetMapping("mainAdd")
   @PreAuthorize("isAuthenticated() and !hasAuthority('cheat')")

   public String getAddView() {
      return "mainAdd";
   }

   @GetMapping("/SecondStop/update/{id}")
   @PreAuthorize("isAuthenticated() and !hasAuthority('cheat')")
   
   public String updateView(@PathVariable("id") Integer id, Model model) {
      model.addAttribute("product", service.getProduct(id));
      return "SecondStop/update" + id;
   }

   @PostMapping("update/{id}")
   public String update(@PathVariable("id") Integer id, Product product, @RequestParam ("files") MultipartFile files) throws Exception {
      System.out.println(id);
      System.out.println(product);
      System.out.println(files.getOriginalFilename());
      service.updateProduct(product, files);

      return "redirect:/SecondStop/exList/" + id;
   }

   @GetMapping("update/{id}")
   @PreAuthorize("isAuthenticated() and !hasAuthority('cheat')")

   public String update(@PathVariable("id") Integer id, Product product,
         @RequestParam(value = "removeFiles", required = false) List<String> removeProductPhoto,
         @RequestParam(value = "listFiles", required = false) MultipartFile[] addFile, Model model,
         Authentication authentication) throws Exception {
      // 사용자 인증 정보 확인
      String username = authentication.getName(); // 현재 로그인한 사용자의 이름
      List<Product> list = service.productListService1(id);

      // 게시글 수정 처리
//       boolean ok = service.updateProcess(product, removeProductPhoto, addFile);
      model.addAttribute("product", service.getProduct(id));
      model.addAttribute("list", list);
      return "productUpdate";

//       boolean ok = service.updateProcess(product,removeProductPhoto,addFile);

//       if(오케이) {
//         rttr.addFlashAttribute("message" , product.getId() + "번 게시물이 수정되었습니다");
//         return"redirect:/freeboard/id/" + product.getId();
//      }else {
//         rttr.addFlashAttribute("message", product.getId() + "게시물 수정에 실패하였습니다.");
//         return"redirect:/freeboard/freeupdate/" + product.getId();
//      }
   }

   @PostMapping("remove")
   public String removeForm(Integer id, RedirectAttributes rttr, Authentication authentication) {
      // 사용자 인증 정보 확인
      String username = authentication.getName(); // 현재 로그인한 사용자의 이름

      // 게시물 삭제 처리
      boolean ok = service.removeProcess(id);

      if (ok) {
         rttr.addFlashAttribute("message", id + "번 게시물이 삭제되었습니다.");
         return "redirect:/SecondStop/list4";
      } else {
         System.out.println("실패함");
         rttr.addFlashAttribute("message", "게시물 삭제에 실패하였습니다.");
         return "redirect:/SecondStop/exList/" + id;
      }
   }

   @PostMapping("/like")
   @ResponseBody

   public ResponseEntity<Map<String, Object>> productLike(@RequestBody ProductLike productLike,
         Authentication authentication) {
      if (authentication == null) {
         return ResponseEntity.status(403).body(Map.of("message", "로그인을 해주세요."));
      } else {
         return ResponseEntity.ok().body(service.productLike(productLike, authentication));

      }
   }
}