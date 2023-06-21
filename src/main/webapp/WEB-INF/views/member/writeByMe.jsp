<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>

h1 {
	font-size: 45px;
	color: #55A44E;
	margin: 20px;
	/* 	font-weight: bold; */
}

.table-no-border {
	border: none;
}

.table-no-border thead th {
	border-top: 2px solid #55A44E; /* 제일 상단 선 색상 설정 */
}

.table-no-border th, .table-no-border td {
	border: none;
	border-top: 1px solid #dee2e6; /* 상단 선 색상 설정 */
	border-bottom: 1px solid #dee2e6; /* 하단 선 색상 설정 */
	padding-right: 40px; /* 아이디와 아이디 값 사이의 간격 조정 */
}

.table-no-border th:first-child, .table-no-border td:first-child {
	border-left: none; /* 좌측 선 제거 */
}

.table-no-border th:last-child, .table-no-border td:last-child {
	border-right: none; /* 우측 선 제거 */
}
</style>
<body>

	<my:navBarForMyPage></my:navBarForMyPage>

	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-10">
				<h1>${param.id }의 작성글</h1>
				<!-- .mb-3*4>label+input -->
				<table class="table table-no-border">
					<thead>
						<tr>
							<th>분류</th>
							<th>지역</th>
							<th>제목</th>
<!-- 							<th>본문</th> -->
							<th>올린 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userWriting.myWriteList}" var="writing">
							<tr>
								<td>${writing.sort}</td>
								<td>${writing.region}</td>
								<td><a href="/${writing.sort }/id/${writing.id}">${writing.title}</a></td>
<%-- 								<td>${writing.body}</td> --%>
								<td>${writing.inserted}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="container-lg" id="pagination1">
					<div class="row">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<!-- 	맨처음 이동 버튼 -->
								<c:if test="${userWriting.pageInfo.currentPageNum > userWriting.pageInfo.firstPageNum + 1}">
									<c:url value="./writeByMe?id=${member.id }" var="pageLink">
										<c:param name="page" value="${userWriting.pageInfo.firstPageNum }" />
									</c:url>
									<li class="page-item"><a href="${pageLink }" class="page-link">
											<i class="fa-solid fa-angles-left"></i>
										</a></li>
								</c:if>
								<!-- 이전 버튼 -->
								<c:if test="${userWriting.pageInfo.currentPageNum gt 1 }">
									<c:url value="./writeByMe?id=${member.id }" var="pageLink">
										<c:param name="page" value="${userWriting.pageInfo.currentPageNum - 1 }" />
									</c:url>
									<li class="page-item"><a class="page-link" href="${pageLink }">
											<i class="fa-solid fa-angle-left"></i>
										</a></li>
								</c:if>
								<c:forEach begin="${userWriting.pageInfo.leftPageNum }" end="${userWriting.pageInfo.rightPageNum }" var="pageNum">
									<c:url value="./writeByMe?id=${member.id }" var="pageLink">
										<c:param name="page" value="${pageNum }" />
									</c:url>
									<li class="page-item"><a class="page-link ${pageNum eq userWriting.pageInfo.currentPageNum ? 'active' : '' }" href="${pageLink}">${pageNum }</a></li>
								</c:forEach>
								<!-- 다음 버튼 -->
								<c:if test="${userWriting.pageInfo.currentPageNum lt userWriting.pageInfo.lastPageNum }">
									<c:url value="./writeByMe?id=${member.id }" var="pageLink">
										<c:param name="page" value="${userWriting.pageInfo.currentPageNum + 1 }" />
									</c:url>
									<li class="page-item"><a class="page-link" href="${pageLink }">
											<i class="fa-solid fa-angle-right"></i>
										</a></li>
								</c:if>
								<!-- 맨마지막 이동 버튼 -->
								<c:if test="${userWriting.pageInfo.currentPageNum < userWriting.pageInfo.lastPageNum - 1 }">
									<li class="page-item"><c:url value="./writeByMe?id=${member.id }" var="pageLink">
											<c:param name="page" value="${userWriting.pageInfo.lastPageNum }"></c:param>
										</c:url> <a href="${pageLink }" class="page-link">
											<i class="fa-solid fa-angles-right"></i>
										</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>


			</div>
		</div>
	</div>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>