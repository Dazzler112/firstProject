<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<div>
		<nav class="navbar bg-body-tertiary">
			<div class="container-fluid ms-auto">
				<a class="navbar-brand" href="#">Second Stop</a>
				<form action="./noticeList" class="d-flex" role="search">
				
				<div class="input-group">
					<select class="form-select flex-grow-0" style="width: 100px;" name="type" id="">
						<option value="all">전체</option>
						<option value="title" ${param.type eq 'title' ? 'selected' : '' } >제목</option>
						<option value="body" ${param.type eq 'body' ? 'selected' : '' }>본문</option>
						<option value="writer" ${param.type eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>
					
					<input value="${param.search }" name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
			</form>
				<div class="btn-group dropstart">
					<button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">마이페이지</button>
					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start">
						<li><a class="dropdown-item" href="#">로그인</a></li>
						<li><a class="dropdown-item" href="#">회원가입</a></li>
						<li><a class="dropdown-item" href="#">Menu item</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="container-lg">
		<h1>공지 목록</h1>

		<table class="table">
			<thead>
				<tr>
<!-- 					<th>#</th> -->
					<th>제목</th>
					<th>작성자</th>
					<th>작성일시</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList }" var="notice">
					<tr>
<%-- 						<td>${notice.id }</td> --%>
						<td><a href="/notice/noticeId/${notice.id }"> ${notice.title }</a></td>
						<td>${notice.writer }</td>
						<td>${notice.inserted }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div style="text-align: right;">
			<a href="./addNotice" class="btn btn-primary">공지사항 작성</a>
		</div>
		
		<!-- 검색 결과 화면에서만 보임 -->
		 <c:if test="${not empty param.search }">
			<div style="text-align: right;">
				<a href="./noticeList" class="btn btn-info">목록으로</a>
			</div>
		</c:if>
	</div>
	
		<div class="container-lg">
		<div class="row">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전 버튼 -->
					<c:if test="${pageInfo.currentPageNum gt 1 }">
						<c:url value="./noticeList" var="pageLink">
							<c:param name="page" value="${pageInfo.currentPageNum - 1 }" />
							<c:if test="${not empty param.search }">
								<c:param name="search" value="${param.search }" />
							</c:if>
						</c:url>
						<li class="page-item">
							<a class="page-link" href="${pageLink }">
								<i class="fa-solid fa-angle-left"></i>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${pageInfo.leftPageNum }" end="${pageInfo.rightPageNum }" var="pageNum">
						<c:url value="./noticeList" var="pageLink">
							<c:param name="page" value="${pageNum }" />
							<c:if test="${not empty param.search }">
								<c:param name="search" value="${param.search }" />
							</c:if>
							<c:if test="${not empty param.type }">
								<c:param name="type" value="${param.type }" />
							</c:if>
						</c:url>
						<li class="page-item">
							<a class="page-link ${pageNum eq pageInfo.currentPageNum ? 'active' : '' }" href="${pageLink }">${pageNum }</a>
						</li>
					</c:forEach>
					<!-- 다음 버튼 -->
					<c:if test="${pageInfo.currentPageNum lt pageInfo.lastPageNum }">
						<c:url value="./noticeList" var="pageLink">
							<c:param name="page" value="${pageInfo.currentPageNum + 1 }" />
							<c:if test="${not empty param.search }">
								<c:param name="search" value="${param.search }" />
							</c:if>
						</c:url>
						<li class="page-item">
							<a class="page-link" href="${pageLink }">
								<i class="fa-solid fa-angle-right"></i>
							</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>