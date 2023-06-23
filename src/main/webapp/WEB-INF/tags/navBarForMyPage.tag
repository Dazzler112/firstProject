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
				<form class="header__searchForm" onsubmit="return false;">
					<input class="header__input--text" type="text" />
					<button class="header__input--btn">검색</button>
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
					<sec:authorize access="isAnonymous()">
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
								<a href="/mainAdd">상품등록</a>
							</button>
						</li>
					</sec:authorize>
					<sec:authorize access="hasAuthority('admin')">
						<li><button class="dropdown-item" type="button">
								<a href="/member/list">회원목록</a>
							</button></li>
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


			<input type="checkbox" id="iconemenu"> <label for="iconemenu"> <i class="fa-solid fa-bars"></i></label>
			<div class="closedsidebar">
				<h1 style="position: static; margin: 50px 0px 30px 60px; font-size: 30px;">Home</h1>
				<!--  -->

				<!--  -->
				<div class="accordion" id="accordionExample">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">패션</button>

							<input type="checkbox" id="iconemenu"> <label for="iconemenu"> <i class="fa-solid fa-bars"></i></label>
							<div class="closedsidebar">
								<h1 style="position: static; margin: 50px 0px 30px 60px; font-size: 30px;">Home</h1>
								<div class="accordion" id="accordionExample">
									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">패션</button>

										</h2>
										<div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
											<div class="accordion-body"></div>
										</div>
									</div>
									<div class="accordion-item">
										<h2 class="accordion-header">

											<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">게임</button>

											<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">게임</button>

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

											<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Accordion Item #3</button>
										</h2>
										<div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">

											<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Accordion Item #3</button>
						</h2>
						<div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">

							<div class="accordion-body"></div>
						</div>
					</div>
				</div>
			</div>
			</input>

		</div>
		<div class="modal fade" id="exampleModal" tabindex="2" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">

						<input class="header__input--text" type="text"><i class="fa-solid fa-magnifying-glass"></i></input>


						<button type="button" data-bs-dismiss="modal" aria-label="Close" style="border: 0 solid black;">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					<div class="modal-body">...</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
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
				<li><a href="/member/info?id=${member.id}">내 정보</a>
				<li><a href="/member/writeByMe?id=${member.id }">내가 쓴 글</a>
				<li><a href="#">내가 올린 상품</a>
			</ul>
		</nav>
	</header>
</body>
