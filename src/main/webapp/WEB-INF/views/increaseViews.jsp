<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.example.demo.service.ProductService" %>
<%@ page import="com.example.demo.domain.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%
  // ProductService 인스턴스 생성
  ProductService productService = new ProductService();

  // 요청 파라미터에서 상품 ID 가져오기
  int productId = Integer.parseInt(request.getParameter("productId"));

  // 조회 수 증가 처리
  Product product = productService.getProduct(productId);
  product.setViews(product.getViews() + 1);

  // 조회 수 업데이트
  productService.updateProduct(product);

  // 증가된 조회 수 반환
  int updatedViews = product.getViews();
  out.print(updatedViews);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
