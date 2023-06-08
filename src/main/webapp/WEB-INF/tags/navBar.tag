<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<style>
.header {
	/*헤더 고정*/
	position: fixed;
	top: 10px;
	left: 20px;
	right: 20px;
	margin: auto;
	/**/
	width: 90%;
	background-color: #fff;
	z-index: 2;
}

.header__wrapper {
	/*고정된 높이*/
	height: 60px;
	/*좌우정렬 flex*/
	display: flex;
	flex-direction: row;
	/*세로축 모든 아이템 센터 정렬*/
	align-items: center;
	/*가로축 아이템 정렬: 양 끝으로 펼치기*/
	justify-content: space-between;
	padding: 0 16px;
}

.header__start {
	display: flex;
	align-items: center;
}

.header__menu {
	border: none;
	background-color: transparent;
	font-size: 1.5rem;
}

.header__logo {
	margin-left: 20px;
	width: 25px;
	height: 25px;
}

.header__title {
	font-size: 3rem;
	margin-left: 6px;
	margin-right: 30px;
}

.header__center {
	/*검색창 너비가 헤더 너비의 50%로 따라가도록 작성*/
	width: 50%;
}

.header__searchForm {
	max-width: 100%;
}

.header__input--text {
	/*버튼 크기 제외한 나머지 전체 너비 차지하도록*/
	width: calc(90% - 60px);
	/*예쁘게 꾸미기*/
	height: 40px;
	padding: 0 6px;
	border: 1px solid #8f8f8f;
	border-radius: 2px 0 0 2px;
}

.header__input--btn {
	width: 60px;
	height: 40px;
	border: 1px solid #8f8f8f;
	border-radius: 0 0px 0px 0;
}

.header__search {
	border: none;
	background-color: transparent;
	font-size: 1.5rem;
	display: none;
	margin-right: 5px;
}

.header__profile {
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	background-color: rgb(158, 221, 255);
	/* 이미지 불러오기 */
	background-image: url(../imgs/profile.png);
	background-size: 40px 40px;
}

#dropdown {
	margin-right: 30px;
}

#iconemenu {
	display: none;
	position: absolute;
}

#iconemenu+label {
	display: none;
	position: absolute;
	font-size: 24px;
	color: black;
}

.iconsearch {
	display: none;
	position: absolute;
	right: 0px;
	font-size: 24px;
	color: black;
}

.sidebar {
	width: 250px;
	height: 100%;
	background: gray;
	position: fixed;
	top: 0px;
	left: -300px;
	transition: all .35s;
}

.sidebar ul {
	
}

#iconemenu:checked+label+.sidebar {
	left: 0px;
}

#iconemenu:checked+label+.sidebar+ul {
	margin left: 0px;
}

/*450px 정도로 화면 줄어들면 로고 타이틀 없애기*/
@media screen and (max-width: 900px) {
	.header__center {
		display: none;
	}
	.header__search {
		display: block;
	}
	.header__title {
		position: absolute;
		width: 100%;
		text-align: center;
	}
	#iconemenu+label {
		display: block;
		position: absolute;
		width: 30px;
		height: 40px;
		left: 0px;
		font-size: 24px;
		z-index: 1;
		color: black;
		cursor: pointer;
	}
	#iconemenu+label:checked+label i {
		display: block;
		position: absolute;
		font-size: 24px;
		color: black;
	}
	.iconsearch {
		display: block;
		position: absolute;
		font-size: 24px;
		color: black;
	}
	#primary_nav_wrap {
		display: none;
	}
}
</style>
<body>
	<!-- 시맨틱 태그 header로 헤더 부분을 묶음 -->

	<header class="header">
		<div class="header__wrapper">
			<!-- 로고 -->
			<div class="header__start">
				<!-- <button class="header__menu">&#9776;</button> -->
				<span class="header__title">NavBar</span>
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
					<sec:authorize access="isAnonymous()">
						<li><button class="dropdown-item" type="button">
								<a href="/member/login">로그인</a>
							</button></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><button class="dropdown-item" type="button">회원가입</button></li>
					</sec:authorize>
					<li><button class="dropdown-item" type="button">마이페이지</button></li>
					<li><button class="dropdown-item" type="button">
							<a href="http://localhost:8084/mainAdd">상품등록</a>
						</button></li>
				</ul>
			</div>

			<input type="checkbox" id="iconemenu"> <label for="iconemenu"> <i class="fa-solid fa-bars"></i></label>
			<div class="sidebar">
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
					<li><a href="#">조회</a>
					<li><a href="#">공지사항</a></li>
				</ul>
			</div>
			</input>


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
				<li><a href="#">조회</a>
				<li><a href="#">공지사항</a></li>
			</ul>
		</nav>
	</header>
</body>