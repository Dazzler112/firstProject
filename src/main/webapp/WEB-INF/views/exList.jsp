<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>

	<div class="container-lg">
		<table class="table">
			<thead>
				<tr>
					<th style="display: none;">게시번호</th>
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
			<tbody><%-- ${product[0].title} --%>
				<c:forEach items="${list}" var="product" >
					<tr>
						<td style="display: none;">${product.id}</td>
						<td>${product.status}</td>
						<td>${product.title}</td>
						<td><a href="${product.id}">${product.memberId}</a></td>
						<td>${product.inserted}</td>
						<td>${product.views}</td>
						<td>${product.likes}</td>
						<td>${product.price}</td>
						<c:if test="${loggedIn}">
							<c:if test="${product.memberId eq loggedInUser}">
								<td><a href="/product/productUpdate/${product.id}">수정</a></td>
								<td>
									<form action="/product/remove" method="post">
										<input type="hidden" name="id" value="${product.id}">
										<button type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button>
									</form>
								</td>
							</c:if>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="mb-3">
			<label for="contentTextarea" class="form-label"></label>
			<textarea rows="5" id="contentTextarea" class="form-control" name="content"></textarea>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
