<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
.maincontent{
	padding-top:100px;
	display: flex;
	justify-content: space-between;
	padding-left: 200px; 
	padding-right: 200px;
	padding-bottom: 100px;
}
.content{
	width :70%;
	
}
.bodybox{
	float:right;
	width:800px;
	height:500px;
	
}
.titlenumber{
display:flex;
	justify-content: space-between;
	margin-bottom: 15px;
}
.price{
	display: flex;
	align-items: baseline;
	margin-bottom: 15px;
	
	justify-content: space-between;
	
	
}
.box1{
	display:flex;
	align-items: baseline;
}
/*             */
</style>

<body>

	
	<my:navBar></my:navBar>

	
	<div class="maincontent">
	
		
			<div class="photobody" >
				<img style="width:800px;height:800px;" class="img-thumbnail img-fluid"
					src="${bucketUrl }/${list[0].id }/${list[0].photoTitle}" alt="" />
			</div>
	

		<div class="bodybox">
		
			<table class="table">
		<c:forEach items="${list}" var="product">
			<div  class="titlenumber">
			<h2>${product.title} 푸찌 입니다</h2>
			<h1>
				 <i class="fa-solid fa-heart"></i>
				 ${product.likes } 
			</h1>
			</div>
			<div class="price">
			<div class="box1">
			<h1>${product.price}</h1>
			<span style="margin-left:10px;">원</span>
			</div>
			<div>
			<h2><i style="margin-right:10px;" class="fa-solid fa-user"></i>${product.memberId}</h2>
			</div>
			</div>
			
			
			
		</c:forEach>
		
		<thead>
			<tr>
				<th>현재 상태</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>올린 시간</th>
				<th>조회</th>
				<th>찜</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%-- ${product[0].title} --%>
			<c:forEach items="${list}" var="product">
				<tr>
					
					<td>${product.statusCode}</td>
					<td>${product.title}</td>
					<td>${product.memberId}</td>
					<td>${product.inserted}</td>
					<td>${product.views}</td>
					<td>${product.likes}</td>
					<td>${product.price}</td>
					<td><a href="/teamProject/update/${product.id}">${product.modi }수정</a></td>
					<td>
						<form action="/teamProject/remove" method="post">
							<input type="hidden" name="id" value="${product.id}">
							<button type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			<div class="mb-3">
							<label for="bodyTextarea" class="form-label">내용</label>
							<textarea rows="5" id="bodyTextarea" class="form-control" name="body">${product.body}</textarea>
						</div>
		</div>
		
	</div>
	
	

	
	
	<%-- <td><a href="/teamProject/update/${product.id}">수정</a></td>
	<td>
		<form action="/teamProject/remove" method="post">
			<input type="hidden" name="id" value="${product.id}">
			<button type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button>
		</form>
	</td> --%>
	



	





	




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="/js/product/like.js"></script>
</body>

</html>
<my:footer></my:footer>
