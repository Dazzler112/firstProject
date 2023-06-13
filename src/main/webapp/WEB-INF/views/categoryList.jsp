<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
	#content{
		width:auto;
		padding:20px;
		margin: 0auto;
		
		
	}
	.position{
		position: static;
		width: 70%;
		float:right;
		margin-right: 30px;
		
		top:0px;
		display:block;
		
		
	}
	@media screen and (max-width: 900px) {
.position {
	width: 100%;
	margin-left: 10px;
	margin-right: 10px;
	float:none;
}	
</style>
<body>
	<my:categorysidebar></my:categorysidebar> 
	<my:navBar></my:navBar>
	
	
	<%-- <div id="content">
	<div class="position">
	
		<table class="table">
			<thead>
				<tr>
					<th>가격 ~ 가격</th>
					<th>최신순</th>
					<th>낮은 가격순</th>
					<th>높은 가격순</th>
					<th>인기순</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${CategoryList}" var="product">
					<tr>
						<td>${product.price}</td>
						<td>${product.inserted}</td>
						<td>${product.price}</td>
						<td>${product.price}</td>
						<td>${product.likes}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="table">
			<thead>
				<tr>
					<th>현재 상태</th>
					<th>이름</th>
					<th>가격</th>
					<th>지역</th>
					<th>올린 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${CategoryList}" var="product">
					<tr>
						<td>${product.status}</td>
						<td>${product.title }</td>
						<td>${product.price}</td>
						<td>${product.address}</td>
						<td>${product.inserted}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table class="table">
			<thead>
				<tr>
					<th>카테고리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${CategoryList}" var="product">
					<tr>
						<td>${category2.title}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div> 
	
	
	</div> --%>
	<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>예제 1 - 나만의 목록 만들기</title>
    <style>
        /* 이곳에 CSS 소스코드가 들어가야 합니다. */
    </style>
</head>
<body>
    <!-- <nav> -->
    <c:forEach items="${CategoryList}" var="product">
    <ul class="mylist" ><img style=:width:100px;height:70px; class="navbarimage" src="/img/navbarimage.png" alt="My Image">
        <li>${product.status}</li>
        <li>목록 아이템 2</li>
        <li>목록 아이템 3</li>
        <li>목록 아이템 4</li>
        <li>목록 아이템 5</li>
    </ul>
    </c:forEach>
    <!-- </nav> -->
</body>
</html>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>

</html>
