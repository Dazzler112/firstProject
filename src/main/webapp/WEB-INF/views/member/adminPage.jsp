<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>운영자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
container-lg {
	max-width: 800px;
	margin: 0 auto;
	position: relative;
}

#checkTable{
	margin-bottom: 100px;
}

</style>
<body>

	<my:navBarForAdminPage></my:navBarForAdminPage>

	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-12">
				<h1>운영자 페이지</h1>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>PASSWORD</th>
							<th>별명</th>
							<th>이메일</th>
							<th>이름</th>
							<th>성별</th>
							<th>핸드폰 번호</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList1.userList }" var="user">
							<tr>
								<td><a href="/member/info?id=${user.id }"> ${user.id } </a></td>
								<td>${user.password }</td>
								<td>${user.nickName }</td>
								<td>${user.email }</td>
								<td>${user.name }</td>
								<td>${user.gender }</td>
								<td>${user.phoneNum }</td>
								<td>${user.address }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 검색 결과 화면에서만 보임 -->
				<c:if test="${not empty param.search }">
					<div style="text-align: right;">
						<a href="./adminPage" class="btn btn-info">목록으로</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<div class="container-lg" id="pagination1">
		<div class="row">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전 버튼 -->
					<c:if test="${userList1.pageInfo.currentPageNum gt 1 }">
						<c:url value="./adminPage" var="pageLink">
							<c:param name="page" value="${userList1.pageInfo.currentPageNum - 1 }" />
							<c:if test="${not empty param.search }">
								<c:param name="search" value="${param.search }" />
							</c:if>
						</c:url>
						<li class="page-item"><a class="page-link" href="${pageLink }">
								<i class="fa-solid fa-angle-left"></i>
							</a></li>
					</c:if>
					<c:forEach begin="${userList1.pageInfo.leftPageNum }" end="${userList1.pageInfo.rightPageNum }" var="pageNum">
						<c:url value="./adminPage" var="pageLink">
							<c:param name="page" value="${pageNum }" />
							<c:if test="${not empty param.search }">
								<c:param name="search" value="${param.search }" />
							</c:if>
							<c:if test="${not empty param.type }">
								<c:param name="type" value="${param.type }" />
							</c:if>
						</c:url>
						<li class="page-item"><a class="page-link ${pageNum eq userList1.pageInfo.currentPageNum ? 'active' : '' }" href="${pageLink }">${pageNum }</a></li>
					</c:forEach>
					<!-- 다음 버튼 -->
					<c:if test="${userList1.pageInfo.currentPageNum lt userList1.pageInfo.lastPageNum }">
						<c:url value="./adminPage" var="pageLink">
							<c:param name="page" value="${userList1.pageInfo.currentPageNum + 1 }" />
							<c:if test="${not empty param.search }">
								<c:param name="search" value="${param.search }" />
							</c:if>
						</c:url>
						<li class="page-item"><a class="page-link" href="${pageLink }">
								<i class="fa-solid fa-angle-right"></i>
							</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>

	<div class="container-lg" id="checkTable">
		<h1>조회 목록</h1>

		<!-- 권한이 있는 사람만 볼 수 있는 리스트 : 운영자 아이디에 권한 부여 후 다시 생성-->
		<table class="table">
			<c:if test="${cheatList != null}">
				<thead>
					<tr>
						<!-- <th>#</th> -->
						<th>닉네임</th>
						<th>전화번호</th>
						<th>계좌번호</th>
					</tr>
				</thead>
			</c:if>
			<tbody>

				<c:if test="${cheatList != null}">
					<c:forEach items="${cheatList}" var="cheat">
						<tr>
							<td>${cheat.nickName }</td>
							<td>0${cheat.phoneNum }</td>
							<td>${cheat.account }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>