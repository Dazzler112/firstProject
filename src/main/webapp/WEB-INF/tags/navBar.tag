<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse justify-content-end" id="search">
				<form class="d-flex flex-wrap" role="search">
					<div class="search">
						<input type="text" placeholder="검색어 입력"> <img
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
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
