<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
.clear {
	clear: both;
}


.box {
	float: left; 
	/* border: solid 1px black; */
	margin: 0px 10px 0px 250px;
	
}

#content_box h4 {
	float: left;
	padding-left: 400px;
}

#content_box p {
	float: right;
}

.items {
	margin:40px 40px 0px -30px;
	width: 300px;
	height:400;
	float: right;
	list-style-type:none;
}
.productimg{
	width:100%;
	height:200px;
	
}

.items .title{
	margin-top: 10px;
}

.items price {
	padding-top: 20px;
}

.items like {
	padding-top: 20px;
}
.items:hover img{
	transform: scale(1.1);
   box-shadow: 1px 1px 20px #ddd;
   
}
@media screen and (max-width: 1000px) {
.box{
 	clear:both;
	/*  border: solid 1px black;  */
	margin: 0;

	}

}
@media screen and (max-width: 1300px) {
.items {
margin:20px 20px 0px -30px;
	width: 400px;
	height:350;
	float: right;
	list-style-type:none;
}
.items .img{
	width: 400px;
	height:200px;
}

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

	<section id="content_box">
		<div class="categoryname">
			<h3>카테고리</h3>
			<div class="box">

				<div class="clear"></div>
				
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample1.jpg"></li>
					<li class="title">제목</li>
					<li class="price">가격</li>
					<li class="like">좋아요</li>

				</ul>
				
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample2.jpg"></li>
					<li class="title">제목</li>
					<li class="price">가격</li>
					<li class="like">좋아요</li>

				</ul>
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample3.jpg"></li>
					<li class="title">제목</li>
					<li class="price">가격</li>
					<li class="like">좋아요</li>

				</ul>
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample4.jpg"></li>
					<li class="title">썬크림 애터미</li>
					<li class="price">8000원</li>
					<li class="like">좋아요</li>

				</ul>
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample5.jpg"></li>
					<li class="title">제목</li>
					<li class="price">가격</li>
					<li class="like">좋아요</li>

				</ul>
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample6.jpg"></li>
					<li class="title">제목</li>
					<li class="price">가격</li>
					<li class="like">좋아요</li>

				</ul>
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample7.jpg"></li>
					<li class="title">제목</li>
					<li class="price">가격</li>
					<li class="like">좋아요</li>

				</ul>
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample8.jpg"></li>
					<li class="title">제목</li>
					<li class="price">가격</li>
					<li class="like">좋아요</li>

				</ul>
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample9.jpg"></li>
					<li class="title">제목</li>
					<li class="price">가격</li>
					<li class="like">좋아요</li>

				</ul>
				<ul class="items">

					<li><img class="productimg"
						src="/productimg/sample10.jpg"></li>
					<li class="title">제목</li>
					<li class="price">가격</li>
					<li class="like">좋아요</li>

				</ul>

			</div>
			<div class="clear"></div>
		</div>


	</section>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>


</html>
