<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
	integrity="sha512-t4GWSVZO1eC8BM339Xd7Uphw5s17a86tIZIj8qRxhnKub6WoyhnrxeCIMeAqBPgdZGlCcG2PrZjMc+Wr78+5Xg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

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
	

	<div class="toast-container position-fixed top-0 end-0 p-3">
		<div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="toast-header">
				<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
			<div class="toast-body">로그인 후 이용해주세요.</div>
		</div>
	</div>


		<div class="bodybox">
		
			<table class="table">
		<c:forEach items="${list}" var="product">

			<h1>
				<span id="productIdText"> ${product.id } </span> 번 게시물
			</h1>

			<div>
				<h1>
					<span id="likeIcon"> <i class="fa-regular fa-heart"> </i>
					</span> <span id="likeNumber"> ${product.likeCount } </span>
				</h1>
			</div>

		</c:forEach>
		<div>
			<h1>
				</span> <span id="likeNumber"> ${product.likes } </span>
			</h1>
		</div>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>올린 날짜</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr> 
		</thead>
		<tbody>
			<c:forEach items="${list}" var="product">
				<tr>
					<td style="display: none;">${product.id}</td>
					<td>${product.categoryName}</td>
					<td>${product.title}</td>
					<td>${product.memberId}</a></td>
					<td>${product.inserted}</td>
					<td>${product.price}</td>
					<td><a href="/teamProject/update/${product.id}">수정</a></td>

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


		<div class="mb-3">
			<label for="contentTextarea" class="form-label"></label>
			<textarea rows="5" id="contentTextarea" class="form-control" name="content">${list[0].body }</textarea>
		</div> <sec:authentication property="name" var="usedId" /> <c:if test="${userId eq product.writer }">

			<div class="d-none">
				<form action="/remove" method="post" id="removeForm">
					<input id="inputId" type="text" name="id" value="${product.id }" />
				</form>
			</div>
		</c:if>
	</tr>
	</tbody>
	</table>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
		integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="/js/product/like.js"></script>
</body>

</html>
<my:footer></my:footer>
