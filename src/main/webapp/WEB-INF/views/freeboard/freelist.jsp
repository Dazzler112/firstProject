<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SecondStop</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>

a{
	text-decoration: none;
}
/* 글쓰기버튼 css */
.writer_link-color{
	
	color: rgba(0,0,0,0.5);
	font-size: 28px;
}
.board_writer-icon{
display:flex;
	justify-content:center;
	align-items:center;
	background-color: #FFDAB9;
	padding: 16px;
	border-radius:50%;
}
.div_writer {
	margin-bottom: 50px;
	margin-right : 30px;
	position: fixed;
	bottom: 0;
	right: 0;
	margin: 0px, 30px, 30px, 0px;
}
/*  */

.image_column {
	margin:0px 3.5px 0px 0px;
	padding: 1px 2.5px 1px 2.5px;
	background-color: #97B8FC;
	border-radius: 5px;
	color: rgba(0,0,0,0.5);
}
.comment_column{
	border:0.5px solid rgba(0,0,0,0.1);
	margin:0px 3.5px 0px 0px;
	padding: 1px 2.5px 1px 2.5px;
	background-color: #F5F3E7;
	border-radius: 7px;
	color: #A1959C;
}
#category_div{
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 15px 0px;
}
.category_button{
	margin: 0px 8px;
	padding: 7px;
	border-radius: 5px;
	border: none;
	font-weight: 600;
	background:#F0F0F0;
	transition: 0.3s background-color ease-in;
}
.category_button:hover {
	background-color: #DDDDDD;
}
</style>
</head>
<body>
			<my:navBar></my:navBar>

	<form id="categoryForm" action="" method="get">
	</form>
 		<div id="category_div">
			<input type="button" class="category_button" name="boardCategory" value="동네질문"/>
			<input type="button" class="category_button" name="boardCategory" value="동네사건사고"/>
			<input type="button" class="category_button" name="boardCategory" value="동네맛집"/>
			<input type="button" class="category_button" name="boardCategory" value="동네소식"/>
			<input type="button" class="category_button" name="boardCategory" value="생활정보"/>
			<input type="button" class="category_button" name="boardCategory" value="취미생활"/>
			<input type="button" class="category_button" name="boardCategory" value="일상"/>
			<input type="button" class="category_button" name="boardCategory" value="분실"/>
			<input type="button" class="category_button" name="boardCategory" value="해주세요"/>
		</div>
	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-10 col-md-12 col-lg-14">
				<h1>지역 게시판</h1>
				<table id="boardTable" class="table">
					<thead>
						<tr>
							<th style="display:none;">게시번호</th>
							<th>카테고리</th>
							<th>지역</th>
							<th>제목</th>
							<th>공감</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList}" var="board">
							<tr>
								<td style="display:none;">${board.id }</td>
								<td>${board.boardCategory }</td>
								<td>${board.region }</td>
								<td>
								<a href="/freeboard/id/${board.id}">${board.title }</a>
								
								<c:if test="${board.fileCount > 0 }">
									<span class="image_column">
									<i class="fa-regular fa-image"></i>
										${board.fileCount}
									</span>
								</c:if>
								
								<c:if test="${board.commentCount > 0 }">
									<span class="comment_column">
									<i class="fa-solid fa-comment-dots"></i>
										${board.commentCount }
									</span>
								</c:if>
								
								</td>
								<td><i style="color:#DEBFD1;opacity: 0.5; " class="fa-solid fa-heart"></i>${board.likeCount }</td>
								<td>${board.writer }</td>
								<td>${board.inserted }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		<my:freesearch></my:freesearch>
		
		
		<!-- pagenation -->
	<div class="container-lg">
		<div class="row">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
				<!-- 처음버튼 -->
				<c:if test="${pageInfo.thisPage ne 1 }">
					<c:url value="/freeboard/freelist" var="freepageLink">
							<c:param name="page" value="${pageInfo.thisPage -1 }" />
							<c:if test="${not empty param.search }">
								<c:param name="search" value="${param.search }" />
							</c:if>
							<!-- 처음버튼 눌러도 검색값 변하지 않게 하기 -->
							<c:if test="${not empty param.type }">
							<c:param name="type" value="${param.type }"/>
							</c:if>
						</c:url>
						<li class="page-item"><a class="page-link" href="${freepageLink }"> <i class="fa-solid fa-angles-left"></i>
						</a></li>
						</c:if>
				
					<!-- 이전버튼 -->
					<c:if test="${pageInfo.thisPage gt 1 }">
						<!--1보다 클때 라고 해도 됨  -->
						<!-- 이전버튼 : {pageInfo.currentPageNum -1 } -->
						<my:freepageitem freePageNum="${pageInfo.thisPage -1}">
							<i class="fa-solid fa-angle-left"></i>
						</my:freepageitem>
					</c:if>

					<c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="freePageNum">
						<my:freepageitem freePageNum="${freePageNum }">
						${freePageNum }
						</my:freepageitem>
					</c:forEach>
					
					<!-- 다음 버튼 -->
					<c:if test="${pageInfo.thisPage lt pageInfo.lastPageNumber }">
						<!-- 페이지 번호 : ${pageInfo.currentPageNum + 1 } -->
						<my:freepageitem freePageNum="${pageInfo.thisPage + 1}">
							
						<i class="fa-solid fa-angle-right"></i>
						</my:freepageitem>
					</c:if>
					<!-- 마지막 버튼 -->
					<c:if test="${pageInfo.thisPage lt pageInfo.lastPageNumber }">
					<c:url value="/freeboard/freelist" var="freepageLink">
							<c:param name="page" value="${pageInfo.lastPageNumber}" />
							<c:if test="${not empty param.search }">
								<c:param name="search" value="${param.search }" />
							</c:if>
							<c:if test="${not empty param.type }">
								<c:param name="type" value="${param.type }" />
							</c:if>
						</c:url>
						<li class="page-item"><a class="page-link" href="${freepageLink }"> <i class="fa-solid fa-angles-right"></i>
						</a></li>
						</c:if>
					

				</ul>
			</nav>
		</div>
	</div>
		
		
	
	<div class="div_writer">
		<a href="/freeboard/freeadd" class="writer_link-color">
		<div class="board_writer-icon">
		<i class="fa-solid fa-pen-to-square"></i>
		</div>
		</a>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/freeboard/category.js"></script>
</body>
</html>