<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


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