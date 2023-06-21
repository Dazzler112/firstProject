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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

<link rel="stylesheet" href="/resources/mainList1.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</head>
<style>
#cotent_box {
	
}

.box {
	margin-left: auto;
	margin-right: auto;
	display: flex;
	width: 1390px;
	height: 100%;
	flex-wrap: wrap;
}

.items img {
	padding: 40px 40px 0px -30px;
	width: 100%;
	height: 233px;
	border-radius: 1%;
	list-style-type: none;
}

.items {
	margin: 40px 20px 40px 20px;
	width: 300px;
	height: 400;
	display: d-flex;
	list-style-type: none;
}

.productimg {
	width: 100%;
	height: 200px;
}

.items .title {
	margin-top: 10px;
}

.items price {
	padding-top: 20px;
}

.items like {
	padding-top: 20px;
}

.items:hover img {
	transition: 0.3s;
	scale: 1.1;
	box-shadow: 1px 1px 20px #ddd;
}

#category_div {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 15px 0px;
}

.boxcategory {
	justify-content: space-between;
	margin-left: auto;
	margin-right: auto;
	padding-top: 10px;
	display: flex;
	width: 1300px;
}

.compos {
	justify-content: flex-start;
}

.category_button {
	margin: 0px 8px;
	padding: 7px;
	border-radius: 5px;
	border: none;
	font-weight: 600;
	background: #F0F0F0;
	transition: 0.3s background-color ease-in;
}

.category_button:hover {
	background-color: #DDDDDD;
}
}
</style>
<body>
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
		<form id="categoryForm" action="" method="get"></form>
		<div class="boxcategory">
			<h1 class="compos">카테고리</h1>
			<div id="category_div">
				<input type="button" class="category_button" name="productCategory"
					value="패션" /> <input type="button" class="category_button"
					name="productCategory" value="가구" /> <input type="button"
					class="category_button" name="productCategory" value="게임" /> <input
					type="button" class="category_button" name="productCategory"
					value="명품" /> <input type="button" class="category_button"
					name="productCategory" value="전자기기" /> <input type="button"
					class="category_button" name="productCategory" value="취미" /> <input
					type="button" class="category_button" name="productCategory"
					value="무료나눔" />
				<!-- http://localhost:8084/teamProject/list4?category=1025453  -->
				<!-- http://localhost:8084/teamProject/list4/category/1025453 -->
			</div>
		</div>

		<%-- /${product.id } --%>
		<div class="box">
			<div class="clear"></div>
			<c:forEach items="${CategoryList}" var="product">
				<ul class="items">
					<a href="/teamProject/exList/${product.id }"> <img
						class="productimg" src="/productimg/sample1.jpg">
					</a>
					<li class="title">${product.id}</li>
					<li class="title">${product.title}</li>
					<li class="price">${product.price}</li>
					<li class="price">${product.address}</li>
					
					<li>${product.memberId}</li>
				</ul>
			</c:forEach>
		</div>
		<div class="clear"></div>
	</section>

	<my:categorylistsearch></my:categorylistsearch>
<!-- 페이지네이션 -->
	<div class="container-lg">
		<div class="row">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
				<c:if test="${prevPageNum gt 1 }">
				<li class="page-item">
					<c:url value="/teamProject/list4" var="pageLink">
						<c:param name="page" value="${prevPageNum }"></c:param>
					</c:url>
					<a class="page-link" href="${pageLink }"><i class="fa-solid fa-angles-left"></i></a>
				</li>
				</c:if>
				<c:if test="${prevPageNum1 ge 1 }">
				<li class="page-item">
					<c:url value="/teamProject/list4" var="pageLink">
						<c:param name="page" value="${prevPageNum1 }"></c:param>
					</c:url>
					<a class="page-link" href="${pageLink }"><i class="fa-solid fa-angle-left"></i></a>
				</li>
				</c:if>
					<c:forEach begin="${leftPageNum}" end="${rightPageNum }" var="pageNum">
						<c:url value="/teamProject/list4" var="pageLink">
							<c:param name="page" value="${pageNum }"></c:param>
						</c:url>
						<li class="page-item"><a class="page-link ${pageNum eq currentPageNum ? 'active' : '' }"
							href="${pageLink }">${pageNum }</a></li>

					</c:forEach>
					
					<c:if test="${nextPageNum1 le lastPageNum }">
				<li class="page-item">
					<c:url value="/teamProject/list4" var="pageLink">
						<c:param name="page" value="${nextPageNum1 }"></c:param>
					</c:url>
					<a class="page-link" href="${pageLink }"><i class="fa-solid fa-angle-right"></i></a>
				</li>
				</c:if>
					
				<c:if test="${nextPageNum le lastPageNum}">	
				<li class="page-item">
					<c:url value="/teamProject/list4" var="pageLink">
						<c:param name="page" value="${nextPageNum }"></c:param>
					</c:url>
					<a class="page-link" href="${pageLink }"><i class="fa-solid fa-angles-right"></i></a>
				</li>
				</c:if>
				
				
				</ul>
			</nav>
		</div>
	</div>
	<script src="/js/navbar/productcategory.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
