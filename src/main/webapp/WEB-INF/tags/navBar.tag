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
<body style="margin-top : 150px;">
	<!-- 시맨틱 태그 header로 헤더 부분을 묶음 -->
	<header class="header">
		<div class="header__wrapper">
			<!-- 로고 -->
			<div class="header__start">
				 <img style=:width:100px;height:70px; class="navbarimage" src="/img/navbarimage.png" alt="My Image">
				<span class="header__title"><a class="linkcolor" href="/teamProject/list1">SecondStop</a></span>
			</div>
			<!-- 검색창 -->
			<div class="header__center">
				<form class="header__searchForm" onsubmit="return false;">
					<input class="header__input--text" type="text" />
					<button class="header__input--btn">검색</button>
				</form>
			</div>
			<!-- 프로필 -->
			<div id="dropdown" class="btn-group dropstart">
				<button type="button" class="btn " data-bs-toggle="dropdown" aria-expanded="false">
					<i class="header__profile"></i>
				</button>
				<ul class="dropdown-menu">
					<!-- Dropdown menu links -->
					<li><button class="dropdown-item" type="button">
							<a href="http://localhost:8084/member/login">로그인</a>
						</button></li>
					<li><button class="dropdown-item" type="button">
							<a href="http://localhost:8084/member/signup">회원가입</a></button></li>
					<li><button class="dropdown-item" type="button">
							<a href="http://localhost:8084/member/info">마이페이지</a></button></li>
					<li><button class="dropdown-item" type="button">
							<a href="http://localhost:8084/mainAdd">상품등록</a>
						</button></li>
					<li><button class="dropdown-item" type="button">
							<a href="http://localhost:8084/member/logout">로그아웃</a>
						</button></li>
				</ul>
			</div>
			
				<input type="checkbox" id="iconemenu"> <label for="iconemenu"> <i
               class="fa-solid fa-bars"></i></label>
				<div class="closedsidebar" >
					<h1 style="position: static; margin: 50px 0px 30px 60px; font-size: 30px;">Home</h1>
					<!--  -->
					
					<!--  -->
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
									data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
									패션</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
									data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									게임</button>
							</h2>
							<div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<ul class="ulstyle">
										<div>
											<li class="listyle"><a class="linkcolor" href="#">콘솔게임</a></li>
											<li class="listyle"><a class="linkcolor" href="#">pc게임</a></li>
											<li class="listyle"><a class="linkcolor" href="#">플레이스테이션</a></li>
											<li class="listyle"><a class="linkcolor" href="#">psp</a></li>
											<li class="listyle"><a class="linkcolor" href="#">닌텐도</a></li>
											<li class="listyle"><a class="linkcolor" href="#">wii</a></li>
											<li class="listyle"><a class="linkcolor" href="#">xbox</a></li>
											<li class="listyle"><a class="linkcolor" href="#">게임타이틀</a></li>
										</div>
									</ul>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
									data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									Accordion Item #3</button>
							</h2>
							<div id="collapseThree" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body"></div>
							</div>
						</div>
					</div>
				</div>
				</input>
			
			<a class="iconsearch" href="#"><i class="fa-solid fa-magnifying-glass"></i> </a>
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
				<li><a href="#">조회</a>
				<li><a href="/notice/noticeList">공지사항</a></li>
			</ul>
		</nav>
	</header>

</body>
