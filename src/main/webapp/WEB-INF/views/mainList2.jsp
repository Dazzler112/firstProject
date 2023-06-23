<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 메인페이지</title>
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
</style>
<body>

	<my:navBar></my:navBar>
	
	<div class="swiper mySwiper" >
		<h1 style="text-align: left;margin-left:5px;color:#55A44E; margin-bottom:40px; margin-top:20px;">요즘 뜨는상품</h1>
			<div class="swiper-wrapper">
				<div class="swiper-slide"><a href=https://earthplogging.com/><img class="mainimg" src="/img/campaign8.jpg" alt=""></a></div>
				<div class="swiper-slide"><a href=https://www.sas.org.uk/><img class="mainimg" src="/img/campaign1.jpg" alt=""></a></div>
				<div class="swiper-slide"><a href=https://www.patagonia.com/stories/dont-buy-this-jacket-black-friday-and-the-new-york-times/story-18615.html>
											<img class="mainimg" src="/img/campaign3.jpg"alt=""></a></div>
				<div class="swiper-slide"><a href=https://post.naver.com/viewer/postView.naver?volumeNo=35922195&memberNo=53135705>
											<img class="mainimg" src="/img/campaign6.jpg" alt=""></a></div>
				<div class="swiper-slide"><a href=https://www.ehyundai.com/newPortal/EV/EV000003_14_V.do?eventNo=27279&eventCd=B0349900&list_page=&search=&keyword=&eventSearch=&eventSearchDep=&imgLink=/attachfiles/event/20230608125451265.png>
											<img class="mainimg" src="/img/campaign7.jpg" alt=""></a></div>
		
			</div>
		</div>	
	<div class="secontcontent">
		<h1 style="color:#55A44E; margin-bottom:40px; margin-top:40px;  " >중요 공지사항!</h1>
		<table class="table">
			<thead>
				<tr>
					<th>제목</th>
					<th>올린 시간</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${notice}" var="notice">
					<tr>

						<td><a href="/board/id/${notice.id }"> ${notice.title} </a></td>
						<td>${notice.inserted}</td>
						<td>${notice.writer}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<div class="container-lg">
		<br> <br>
		<h2>내가 찜한 상품</h2>
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
				<c:forEach items="${likedProducts}" var="product">
					<tr>
						<td>${product.price}</td>
						<td><a href="/board/id/${product.id}">${product.title}</a></td>
						<td>${product.address}</td>
						<td>${product.inserted}</td>
						<td>${product.likes}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<h2 style="color:#55A44E; margin-bottom:40px; ">인기상품</h2>
			<div class="box">

				<div class="clear"></div>
				<c:forEach items="${productList4}" var="product"  begin="0" end="9" step="1">
					<ul class="items">
						<a href="/teamProject/exList/${product.id }">
							<img class="img-thumbnail img-fluid" src="${bucketUrl }/${product.id }/${product.photoTitle}" alt="" />
                     	</a>
						<li class="title"><a href="/board/id/${product.id }"> ${product.title}
						</a></li>
						<li class="price">${product.price}</li>
						<li>${product.inserted}</li>
						<li>${product.address}</li>
						<li><i class="fa-regular fa-heart"></i>${product.likes}</li>												
					</ul>
				</c:forEach>
				

			</div>
			<div class="clear"></div>
		</div>

		
	</div>
	<my:footer></my:footer>
	<script src="/js/navbar/search.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
