package com.example.demo.controller;

import java.time.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.core.*;
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
			@RequestParam(value = "body", defaultValue = "") String body,
			@RequestParam(value = "writer", defaultValue = "") String writer,
			@RequestParam(value = "price", defaultValue = "") Integer price,
			@RequestParam(value = "address", defaultValue = "") String address,
			@RequestParam(value = "likes", defaultValue = "") Integer likes){
		
		

		List<Notice> noticeList = service.listBoard1(title, inserted, body, writer);
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
			@RequestParam(value = "body", defaultValue = "") String body,
			@RequestParam(value = "writer", defaultValue = "") String writer,
			@RequestParam(value = "price", defaultValue = "") Integer price,
			@RequestParam(value = "address", defaultValue = "") String address,
			@RequestParam(value = "likes", defaultValue = "") Integer likes,
			@RequestParam(value = "memberId", defaultValue = "") String memberId) {

		List<Notice> noticeList = service.listBoard1(title, inserted, body, writer);
		List<Product> productList3 = service.listBoard4(memberId, price, title, inserted, address, likes);
		List<Product> productList2 = service.listBoard3(price, title, inserted, address, likes);

		model.addAttribute("notice", noticeList);
		model.addAttribute("productList3", productList3);
		model.addAttribute("productList2", productList2);

		return "mainList2";
	}


	@GetMapping("/exList/{id}")
	public String product1(@PathVariable("id") Integer id, Model model,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "price", defaultValue = "") Integer price,
			@RequestParam(value = "address", defaultValue = "") String address,
			@RequestParam(value = "inserted", defaultValue = "") LocalDateTime inserted,
			@RequestParam(value = "category", defaultValue = "") String category)  {
		List<Product> list = service.productListService1(id);
		

		model.addAttribute("list", list);
		return "exList";
	}

	@GetMapping("/id/{id}")
	public String product(@PathVariable("id") Integer id, Model model) {
		Product product = service.getProduct(id);
		model.addAttribute("product",product);
		return "get";
	}
	@PostMapping("mainAdd")
	public String addForm(@RequestParam("files") MultipartFile[] files,
			@RequestParam("category") String category, Product product, RedirectAttributes rttr, Model model,
			Authentication authentication)
					throws Exception {
		product.setWriter(authentication.getName());
		boolean ok = service.addProduct(product, files, category);
		

		model.addAttribute("product", product);
		if (ok) {
			rttr.addFlashAttribute("message", "게시글이 생성되었습니다.");
			return "redirect:/teamProject/exList";
		} else {
			rttr.addFlashAttribute("message", product.getId() + "게시글 생성에 실패하였습니다.");
			return "redirect:mainList2";
		}
	}

	@GetMapping("/productUpdate/{id}")
	public String updateView(@PathVariable("id") Integer id, Model model) {
		
		model.addAttribute("product", service.getProduct(id));
		return "product/productUpdate";
	}
	
	@GetMapping("mainAdd")
	@PreAuthorize("isAuthenticated()")
	public String getAddView() {
		return "mainAdd";
	}
	
	

	@PostMapping("/productUpdate/{id}")
	public String update(@PathVariable("id") Integer id,
	        Product product,
	        @RequestParam(value = "removeFiles", required = false) List<String> removeProductPhoto,
	        @RequestParam(value = "listFiles", required = false) MultipartFile[] addFile,
	        RedirectAttributes rttr, Authentication authentication) throws Exception {
	    // 사용자 인증 정보 확인
	    String username = authentication.getName(); // 현재 로그인한 사용자의 이름

	    // 게시글 수정 처리
	    boolean ok = service.updateProcess(product, removeProductPhoto, addFile);

	    if (ok) {
	        rttr.addFlashAttribute("message", product.getId() + "번 게시물이 수정되었습니다.");
	        return "redirect:/product/id/" + product.getId();
	    } else {
	        rttr.addFlashAttribute("message", product.getId() + "번 게시물 수정에 실패하였습니다.");
	        return "redirect:/product/id/" + product.getId();
	    }
	}

	@PostMapping("remove")
	public String removeForm(Integer id, RedirectAttributes rttr, Authentication authentication) {
	    // 사용자 인증 정보 확인
	    String username = authentication.getName(); // 현재 로그인한 사용자의 이름

	    // 게시물 삭제 처리
	    boolean ok = service.removeProcess(id);

	    if (ok) {
	        rttr.addFlashAttribute("message", id + "번 게시물이 삭제되었습니다.");
	        return "redirect:/product/productlist";
	    } else {
	        System.out.println("실패함");
	        rttr.addFlashAttribute("message", "게시물 삭제에 실패하였습니다.");
	        return "redirect:/product/id/" + id;
	    }
	}

}