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

import com.example.demo.controller.*;
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

   public List<Product> listBoard2(Integer price, String title, LocalDateTime inserted, String address) {
      return mapper.selectAll2(title, price, inserted, address);
   }

   public List<Product> listBoard3(Integer price, String title, LocalDateTime inserted, String address,
         Integer likes) {
      return mapper.selectAll3(title, price, inserted, address, likes);
   }

   public List<Product> listBoard4(String memberId, Integer price, String title, LocalDateTime inserted,
         String address, Integer likes) {

      return mapper.selectAll4(memberId, price, title, inserted, address, likes);
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
   public List<Product> listBoard7(Integer page,  String categoryTitle, String title, Integer price, String address, LocalDateTime inserted) {
      Integer startIndex = (page - 1) * 15;
      //게시물 목록 
      mapper.selectAllPaging(startIndex);
      
      
      return mapper.selectAll7(categoryTitle,  title, price, address, inserted);
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

   @Transactional(rollbackFor = Exception.class)
   public boolean addProduct(Product product, MultipartFile[] files, String category) throws Exception {
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
   
   public List<Product> productListService(){
      List<Product> list = mapper.allProduct();
      return list;
   }
   
//   상품을 들어갔을때 상품 id하나만 나오기
   public List<Product> productListService1(Integer id) {
      List<Product> list = mapper.allProduct1(id);
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

   public Map<String, Object> like(Like like, Authentication authentication){
      Map<String, Object> result = new HashMap<>();
      
      result.put("like", false);
      
      like.setMemberId(authentication.getName());
      Integer deleteCnt = mapper.delete(like);
   
      if (deleteCnt != 1) {
         Integer insertCnt = mapper.insert(like);
         result.put("like", true);
      }
      
      Integer insertCnt = mapper.insert(like);      
      
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