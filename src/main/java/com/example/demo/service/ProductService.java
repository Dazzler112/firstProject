package com.example.demo.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.domain.Notice;
import com.example.demo.domain.Product;
import com.example.demo.domain.ProductLike;
import com.example.demo.mapper.ProductLikeMapper;
import com.example.demo.mapper.ProductMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;

	@Autowired
	private ProductLikeMapper likeMapper;

	@Autowired
	private S3Client s3;

	@Autowired
	private ProductMapper productMapper;

	@Autowired
	public ProductService(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	@Value("${aws.s3.bucketName}")
	private String bucketName;

	public List<Notice> listBoard1(String title, LocalDateTime inserted, String body, String writer) {
		return mapper.selectAll1(title, inserted, body, writer);
	}

	public List<Product> listBoard2(Integer id, String photoTitle, Integer price, String title, LocalDateTime inserted,
			String address) {
		return mapper.selectAll2(id, photoTitle, title, price, inserted, address);
	}

	public List<Product> listBoard3(Integer id, String photoTitle, Integer price, String title, LocalDateTime inserted,
			String address, Integer like) {
		return mapper.selectAll3(id, photoTitle, title, price, inserted, address, like);
	}

	public List<Product> listBoard4( Integer id, String photoTitle, String memberId, String title, String title2, Integer price,
			LocalDateTime inserted, String address, Integer like) {

		return mapper.selectAll4(id, photoTitle, memberId, title, price, inserted, address, like);

	}

	public List<Product> listBoard5(String statusCode, String writer, String title, LocalDateTime inserted,
			Integer views, Integer likes, Integer price, String content) {

		return mapper.selectAll5(statusCode, writer, title, inserted, views, likes, price, content);
	}

	public List<Product> listBoard6(String title, Integer price, LocalDateTime inserted, Integer price2, Integer price3,
			Integer likes) {

		return mapper.selectAll6(title, price, inserted, price, price, likes);
	}

//   카테고리 리스트로 에서 사용할 수 있는 서비스
	public List<Product> listBoard7(Integer startIndex, String categoryTitle, String title, Integer price,
			String address, LocalDateTime inserted) {
		return mapper.selectAll7(startIndex, categoryTitle, title, price, address, inserted);

	}

	public List<Product> exList(String statusCode, String title, LocalDateTime inserted, String body, String writer,
			Integer price, Integer views, Integer likes, String modi, String memberId, Integer ProrductID) {

		return mapper.selectExList(statusCode, title, inserted, body, writer, price, views, likes, modi, memberId,
				ProrductID);
	}

	public Product getProduct(Integer id) {
		return mapper.selectById(id);
	}

	

	public boolean updateProduct(Product product) {
		return mapper.updateProduct(product) > 0;
	}

//   @Transactional(rollbackFor = Exception.class)
//   public boolean addProcess(Product product, MultipartFile[] files, String category) throws Exception {
//       // TODO: Implement the logic to add a product with its photos
//       
//       // 상품을 데이터베이스에 추가하고 추가된 상품의 ID 값을 반환한다.
//       Integer ProrductID = productMapper.insertForm(product);
//       
//       // 추가된 상품의 ID 값이 null이 아닌 경우, 상품 추가 성공으로 간주한다.
//       return ProrductID != null;
//   }

	public boolean updateProduct(Product product, MultipartFile file) throws Exception {

		if (file != null && file.getSize() > 0) {

			productMapper.updateFileName(product.getId(), file.getOriginalFilename());
			String objectKey = "teamPrj/" + product.getId() + "/" + file.getOriginalFilename();

			PutObjectRequest por = PutObjectRequest.builder().bucket(bucketName).key(objectKey)
					.acl(ObjectCannedACL.PUBLIC_READ).build();

			RequestBody rb = RequestBody.fromInputStream(file.getInputStream(), file.getSize());

			s3.putObject(por, rb);
		}

		return mapper.updateProduct(product) > 0;
	}

	@Transactional(rollbackFor = Exception.class)
	public boolean addProduct(Product product, MultipartFile[] files, Integer category) throws Exception {
		product.setCategoryId(category);
		Integer ProrductID = productMapper.insertForm(product);

		System.out.println(product);
		if (ProrductID != null) {
			for (MultipartFile file : files) {
				if (file.getSize() > 0) {
					productMapper.insertFileName(product.getId(), file.getOriginalFilename());
					String objectKey = "teamPrj/" + product.getId() + "/" + file.getOriginalFilename();

					PutObjectRequest por = PutObjectRequest.builder().bucket(bucketName).key(objectKey)
							.acl(ObjectCannedACL.PUBLIC_READ).build();

					RequestBody rb = RequestBody.fromInputStream(file.getInputStream(), file.getSize());

					s3.putObject(por, rb);
				}
			}

			return true;
		}

		return false;
	}

	@Transactional()
	public boolean updateProcess(Product product, List<String> removeProductPhoto, MultipartFile[] addFile)
			throws Exception {

		if (removeProductPhoto != null && !removeProductPhoto.isEmpty()) {
			for (String fileName : removeProductPhoto) {
				String objectKey = "teamprj/" + product.getId() + "/" + fileName;
				DeleteObjectRequest pp = DeleteObjectRequest.builder().bucket(bucketName).key(objectKey).build();

				s3.deleteObject(pp);

				mapper.deleteFileNameUpdate(product.getId(), fileName);
			}
		}

		if (addFile != null) {

			for (MultipartFile file : addFile) {
				if (file.getSize() > 0) {
					mapper.updateFileName(product.getId(), file.getOriginalFilename());

					String objectKey = "teamPrj/" + product.getId() + "/" + file.getOriginalFilename();
					PutObjectRequest bb = PutObjectRequest.builder().acl(ObjectCannedACL.PUBLIC_READ).bucket(bucketName)
							.key(objectKey).build();

					RequestBody pb = RequestBody.fromInputStream(file.getInputStream(), file.getSize());
					s3.putObject(bb, pb);
				}
			}
		}
		int cnt = mapper.updateProduct(product);
		return cnt == 1;
	}

	public boolean removeProcess(Integer id) {

		List<String> productPhoto = mapper.selectFileByProductId(id);

		mapper.removeFileByProductId(id);

		for (String productPhotos : productPhoto) {
			String objectKey = "teamPrj/" + id + "/" + productPhotos;
			DeleteObjectRequest pp = DeleteObjectRequest.builder().bucket(bucketName).key(objectKey).build();

			s3.deleteObject(pp);
		}

		int cnt = mapper.removeForm(id);
		return cnt == 1;
	}

	@GetMapping("/id/{id}")
	public String get(@PathVariable("id") Integer id, Model model, Authentication authentication) {

		List<Product> list = mapper.getCountReply(id);
		Product product = mapper.getProcess(id, authentication);

		model.addAttribute("getProduct", product);

		return "product/productget";
	}

	public List<Product> productListService() {
		List<Product> list = mapper.allProduct();
		return list;
	}

//   상품을 들어갔을때 상품 id하나만 나오기
	public List<Product> productListService1(Integer id) {
		List<Product> list = mapper.allProduct1(id);
		Integer count = likeMapper.countByProductId(id);
		list.forEach(e -> e.setLikeCount(count));
		return list;
	}

	/*
	 * public List<Product> productCategory(String productCategory){ List<Product>
	 * list = mapper.productCategoryList(productCategory); return list;
	 * 
	 * }
	 */

	public String getProductPhoto(Integer id) {
		String list = mapper.allProductPhoto(id);
		return list;
	}

	public Map<String, Object> productLike(ProductLike productLike, Authentication authentication) {
		Map<String, Object> result = new HashMap<>();

		result.put("like", false);

		productLike.setMemberId(authentication.getName());
		Integer deleteCnt = likeMapper.delete(productLike);

		if (deleteCnt != 1) {
			Integer insertCnt = likeMapper.insert(productLike);
			result.put("like", true);
		}

		return result;
	}
	/*
	 * public List<String> getExlistProcess(Integer id, Authentication
	 * authentication) { // 상품 정보를 가져와서 Product 객체로 생성 List<String> photoList =
	 * mapper.selectFileByProductId(id);
	 * 
	 * return photoList; }
	 * 
	 * public Product getProductById(Integer id) { // TODO Auto-generated method
	 * stub return null; }
	 */

	// public int getTotal(Criteria cri);

	/*
	 * public List<Product> productListService(Integer id) { List<Product> list =
	 * mapper.allProduct1(id); return list; }
	 * 
	 * public List<Product> productCategory(String productCategory) { List<Product>
	 * list = mapper.productCategoryList(productCategory); return list; }
	 */

}