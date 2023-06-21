<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<link href="/resources/categorymenubar.css" rel="stylesheet">
<link href="/resources/menubar.css" rel="stylesheet">
<link href="/resources/navbar.css" rel="stylesheet">
<script src="/js/navbar/navbar.js"></script>
<!-- 글골 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
</style>
<body style="margin-top: 150px;">
	<!-- 시맨틱 태그 header로 헤더 부분을 묶음 -->
	<header class="header">
		<div class="header__wrapper">
			<!-- 로고 -->
			<div class="header__start">
				<sec:authorize access="isAnonymous()">
					<span class="header__title"><a class="linkcolor" href="/teamProject/list1">
							<img class="navbarimage" src="/img/navbarimage.png" alt="My Image" />
						</a> </span>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a class="linkcolor" href="/teamProject/list2">
						<img class="navbarimage" src="/img/navbarimage.png" alt="My Image" />
					</a>
				</sec:authorize>
			</div>
			<!-- 검색창 -->
			<div class="header__center">
				<form action="./adminPage" class="d-flex" role="search">
					<div class="input-group">
						<select class="form-select flex-grow-0" style="width: 100px;" name="type" id="">
							<option value="all">전체</option>
							<option value="id" ${param.type eq 'id' ? 'selected' : '' }>ID</option>
							<option value="nickName" ${param.type eq 'nickName' ? 'selected' : '' }>별명</option>
							<option value="name" ${param.type eq 'name' ? 'selected' : '' }>이름</option>
							<option value="phoneNum" ${param.type eq 'phoneNum' ? 'selected' : '' }>전화번호</option>
							<option value="email" ${param.type eq 'email' ? 'selected' : '' }>E-mail</option>
						</select> <input value="${param.search }" name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-light" type="submit">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
				</form>
			</div>

			<!-- 프로필 -->
			<div id="dropdown" class="btn-toggle btn-secondary">
				
				<button class="dropdown-toggle" onclick="toggleDropdown()"><i class="fa-regular fa-circle-user" style="color: #FFFFFF; margin-left: 10px;"></i></button>
				
				
				<!-- <button type="button" class="btn" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 3em;">
					<i class="fa-regular fa-circle-user" style="color: #FFFFFF; margin-left: 10px;"></i>
				</button> -->
				<ul class="dropdown-menu" id="dropdownMenu">
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
					<sec:authorize access="isAuthenticated() and !hasAuthority('admin')">
						<li>
							<button class="dropdown-item" type="button">
								<a href="/member/info?id=<sec:authentication property="name" />">마이페이지</a>
							</button>
						</li>
					</sec:authorize>
					<sec:authorize access="hasAuthority('admin')">
						<li>
							<button class="dropdown-item" type="button">
								<a href="/member/adminPage?id=<sec:authentication property="name" />">운영자 페이지</a>
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

		</div>
		<nav id="primary_nav_wrap">
			<ul>
				<sec:authorize access="isAuthenticated()">
					<li class="current-menu-item"><a href="/teamProject/list2">홈</a></li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li class="current-menu-item"><a href="/teamProject/list1">홈</a></li>
				</sec:authorize>
				<li><a href="/member/list">회원 목록</a>
				<li><a href="/cheat/list">블랙리스트</a>
			</ul>
		</nav>
	</header>
	<script>
		
	</script>
</body>
