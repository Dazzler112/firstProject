package com.example.demo.service;

import java.time.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.example.demo.domain.*;
import com.example.demo.mapper.*;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.*;
import software.amazon.awssdk.services.s3.model.*;

@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;
	
	@Autowired
	private S3Client s3;
	
	@Value("${aws.s3.bucketName}")
	private String bucketName;

	public List<Product> listBoard1(String title, LocalDateTime inserted, String content) {
		return mapper.selectAll1(title, inserted, content);
	}

	public List<Product> listBoard2(Integer price, String title, LocalDateTime inserted, String address) {
		return mapper.selectAll2(price, title, inserted, address);
	}

	public List<Product> listBoard3(Integer price, String title, LocalDateTime inserted, String address,
			Integer likes) {
		return mapper.selectAll3(price, title, inserted, address, likes);
	}

	public List<Product> listBoard4(Integer price, String title, LocalDateTime inserted, String address,
			Integer likes) {

		return mapper.selectAll4(price, title, inserted, address, likes);
	}

	public List<Product> listBoard5(String status, String writer, String title, LocalDateTime inserted, Integer views,
			Integer likes, Integer price,
			String content) {

		return mapper.selectAll5(status, writer, title, inserted, views, likes, price, content);
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

	@Transactional()
	public boolean updateProcess(Product product, List<String> removeProductPhoto, MultipartFile[] addFile)
			throws Exception {

		if (removeProductPhoto != null && !removeProductPhoto.isEmpty()) {
			for (String fileName : removeProductPhoto) {
				String objectKey = "teamprj/" + product.getId() + "/" + fileName;
				DeleteObjectRequest pp = DeleteObjectRequest.builder()
						.bucket(bucketName)
						.key(objectKey)
						.build();

				s3.deleteObject(pp);

				mapper.deleteFileNameUpdate(product.getId(), fileName);
			}
		}
		
		for(MultipartFile file : addFile) {
			if(file.getSize() > 0) {
				mapper.updateFileName(product.getId(),file.getOriginalFilename());
				
				String objectKey = "teamPrj/" + product.getId() + "/" +file.getOriginalFilename();
				PutObjectRequest bb = PutObjectRequest.builder()
						.acl(ObjectCannedACL.PUBLIC_READ)
						.bucket(bucketName)
						.key(objectKey)
						.build();
				
				RequestBody pb = RequestBody.fromInputStream(file.getInputStream(), file.getSize());
				s3.putObject(bb, pb);
			}
		}
		int cnt = mapper.updateProduct(product);
		return cnt == 1;
	}

	public boolean removeProcess(Integer id) {
		
		List<String> productPhoto = mapper.selectFileByProductId(id);
		
		mapper.removeFilebyProductId(id);
		
		for(String productPhotos : productPhoto) {
			String objectKey = "teamPrj/" + id + "/" + productPhotos;
			DeleteObjectRequest pp = DeleteObjectRequest.builder()
					.bucket(bucketName)
					.key(objectKey)
					.build();
			
			s3.deleteObject(pp);
		}
		
		int cnt = mapper.removeForm(id);
		return cnt == 1;
	}
	
	@GetMapping("/id/{id}")
	public String get(@PathVariable("id") Integer id, Model model
								,Authentication authentication) {
		
		List<Product> list = mapper.getCountReply(id);
		Product product = mapper.getProcess(id, authentication);
		
		model.addAttribute("getProduct", product);
		
		return "product/productget";
	}
}
