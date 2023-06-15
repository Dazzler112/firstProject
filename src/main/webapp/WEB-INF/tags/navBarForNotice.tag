<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<link href="/resources/categorymenubar.css" rel="stylesheet">
<link href="/resources/menubar.css" rel="stylesheet">
<link href="/resources/navbar.css" rel="stylesheet">
<script type="text/javascript" src="링크주소"></script>
<style>
</style>
<body style="margin-top: 150px;">
	<!-- 시맨틱 태그 header로 헤더 부분을 묶음 -->
	<header class="header">
		<div class="header__wrapper">
			<!-- 로고 -->
			<div class="header__start">
				<img style="width: 100px; height: 70px;" class="navbarimage" src="/img/navbarimage.png" alt="My Image"> <span class="header__title"><a class="linkcolor" href="/teamProject/list1">SecondStop</a></span>
			</div>
			<!-- 검색창 -->
			<div class="header__center">
				<form action="./noticeList" class="d-flex" role="search">
					<div class="input-group">
						<select class="form-select flex-grow-0" style="width: 100px;" name="type" id="">
							<option value="all">전체</option>
							<option value="title" ${param.type eq 'title' ? 'selected' : '' }>제목</option>
							<option value="body" ${param.type eq 'body' ? 'selected' : '' }>본문</option>
							<option value="writer" ${param.type eq 'writer' ? 'selected' : '' }>작성자</option>
						</select> <input value="${param.search }" name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-light" type="submit">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
				</form>
			</div>

			<!-- 프로필 -->
			<div id="dropdown" class="btn-group dropstart">
				<button type="button" class="btn" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 3em;">
				    <i class="fa-regular fa-circle-user" style="color: #FFFFFF; margin-left: 10px;"></i>
				</button>
				<ul class="dropdown-menu">
					<!-- Dropdown menu links -->
					<sec:authorize access="isAnonymous">
						<li>
							<button class="dropdown-item" type="button">
								<a href="/member/login">로그인</a>
							</button>
					</li>
					<li>
						<button class="dropdown-item" type="button">
							<a href="/member/signup">회원가입</a>
						</button>
					</sec:authorize>
					</li>
					<sec:authorize access="isAuthenticated()">
					<li>
						<button class="dropdown-item" type="button">
							<a href="/member/info?id=<sec:authentication property="name" />">마이페이지</a>
						</button>
					</li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<li>
						<button class="dropdown-item" type="button">
							<a href="/mainAdd">상품등록</a>
						</button>
					</li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li>
							<button class="dropdown-item" type="button">
								<a href="/member/logout">로그아웃</a>
							</button>
						</li>
					</sec:authorize>
				</ul>
			</div>

			<a class="iconsearch" href="#">
				<i class="fa-solid fa-magnifying-glass"></i>
			</a>
		</div>
		<nav id="primary_nav_wrap">
			<ul>
				<li class="current-menu-item"><a href="http://localhost:8084/list">홈</a></li>
				<li><a href="http://localhost:8084/category">카테고리</a>
					<ul>
						<li><a href="#">패션 의류</a></li>
						<li><a href="#">수입 명품</a></li>
						<li><a href="#">전자기기</a></li>
						<li><a href="#">가구</a>
						<li><a href="#">게임</a>
							<ul>
								<li><a href="http://localhost:8084/category">콘솔게임</a>
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
					<ul>
						<li><a href="/freeboard/freelist">자유게시판</a></li>
						<li></li>
						<li></li>
					</ul>
				<li><a href="/cheat/check">조회</a>
				<li><a href="/notice/noticeList">공지사항</a></li>
			</ul>
		</nav>
	</header>
	<script>
		
	</script>
</body>
