<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 전 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
</head>
<style>
	
</style>
<body>
	<my:navBar></my:navBar>

	<div id="carouselExampleIndicators" class="carousel slide">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
		  <div class="carousel-item active">
			<img src="/productimg/sample1.jpg" class="d-block w-50% h-50%" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="/productimg/sample2.jpg" class="d-block w-50% h-50%" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="/productimg/sample3.jpg" class="d-block w-50% h-50%" alt="...">
		  </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Previous</span>
		</button>
		<button  class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		  <span   class="carousel-control-next-icon" aria-hidden="true"></span>
		  <span  text_color class="visually-hidden">Next</span>
		</button>
	</div>

	<h1>게시물 목록</h1>
	<br>
	<br>
	<h2>최신 상품</h2>
	<table class="table">
		<thead>
			<tr>
				<th>가격</th>
				<th>제목</th>
				<th>주소</th>
				<th>올린 시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList1}" var="product">
				<tr>
					<td>${product.price}</td>
					<td><a href="/board/id/${product.id }"> ${product.title} </a></td>
					<td>${product.inserted}</td>
					<td>${product.address}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<h2>인기 상품</h2>
	<table class="table">
		<thead>
			<tr>
				<th>가격</th>
				<th>제목</th>
				<th>주소</th>
				<th>올린 시간</th>
				<th>좋아요 개수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList2}" var="product">
				<tr>
					<td>${product.price}</td>
					<td><a href="/board/id/${product.id }"> ${product.title} </a></td>
					<td>${product.inserted}</td>
					<td>${product.address}</td>
					<td>${product.likes}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h2>공지사항</h2>
	<table class="table">
		<thead>
			<tr>
				<th>제목</th>
				<th>올린 시간</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${notices}" var="notice">
				<tr>

					<td><a href="/board/id/${notice.id }"> ${notice.title} </a></td>
					<td>${notice.inserted}</td>
					<td>${notice.writer}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	</div>
	<my:footer></my:footer>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
</body>
</html>
