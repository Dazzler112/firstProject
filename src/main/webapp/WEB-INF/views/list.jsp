<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="/resources/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarTogglerDemo02">
				<form class="d-flex flex-wrap" role="search">
					<div class="col-lg col-sm-auto">
						<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					</div>
					<div class="col-lg-auto col-md-auto">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</div>
				</form>
			</div>
			<div class="ms-auto">
				<div class="dropdown" style="margin-left: 60px;">
					<button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown"
						data-bs-display="static" aria-expanded="false">마이페이지</button>
					<ul class="dropdown-menu dropdown-menu-end ">
						<li><a class="dropdown-item" href="#">로그인</a></li>
						<li><a class="dropdown-item" href="#">회원가입</a></li>
						<li><a class="dropdown-item" href="#">Menu item</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<hr />
	<nav id="primary_nav_wrap">
		<ul>
			<li class="current-menu-item"><a href="http://localhost:8084/list">홈</a></li>
			<li><a href="#">카테고리</a>
				<ul>
					<li><a href="#">패션 의류</a></li>
					<li><a href="#">수입 명품</a></li>
					<li><a href="#">전자기기</a></li>
					<li><a href="#">가구</a>
					<li><a href="#">게임</a>
						<ul>
							<li><a href="#">콘솔게임</a>
								<ul>
									<li><a href="#">Sub Deep 1</a></li>
									<li><a href="#">Sub Deep 2</a></li>
									<li><a href="#">Sub Deep 3</a></li>
									<li><a href="#">Sub Deep 4</a></li>
								</ul></li>
							<li><a href="#">Deep Menu 2</a></li>
						</ul></li>
					<li><a href="#">Sub Menu 5</a></li>
				</ul></li>
			<li><a href="#">게시판</a>
				
			<li><a href="#">조회</a>
				
			<li><a href="#">공지사항</a></li>
		</ul>
	</nav>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>