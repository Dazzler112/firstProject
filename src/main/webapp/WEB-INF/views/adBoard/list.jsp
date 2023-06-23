<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
}

table {
	width: 80%;
	text-align: center;
	margin-left: 100px;
}

table>thead>tr>th {
	padding: 10px;
	border-bottom: 1px solid #ccc;
	border-top: 2px solid green;
}

table>tbody>tr>td {
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

h1 {
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
}

.image_column {
	margin: 0px 3.5px 0px 0px;
	padding: 1px 2.5px 1px 2.5px;
	background-color: #97B8FC;
	border-radius: 5px;
	color: rgba(0, 0, 0, 0.5);
}

.comment_column {
	border: 0.5px solid rgba(0, 0, 0, 0.1);
	margin: 0px 3.5px 0px 0px;
	padding: 1px 2.5px 1px 2.5px;
	background-color: #F5F3E7;
	border-radius: 7px;
	color: #A1959C;
}

#category_div {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 15px 0px;
}

.category_button {
	margin: 0px 8px;
	padding: 7px;
	border-radius: 5px;
	border: none;
	font-weight: 600;
}

.cat {
	width: 125px;
}

.reg {
	width: 100px;
}

.wri {
	width: 150px;
}

.tit {
	width: 600px;
}

.text{
	text-align: left;
}
.writer_link-color {
	color: rgba(0, 0, 0, 0.5);
	font-size: 28px;
}

.board_writer-icon {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #FFDAB9;
	padding: 16px;
	border-radius: 50%;
}

.div_writer {
	margin-bottom: 50px;
	margin-right: 30px;
	position: fixed;
	bottom: 0;
	right: 0;
	margin: 0px, 30px, 30px, 0px;
}

</style>
</head>
<body>
	<my:navBar></my:navBar>
	<my:alert></my:alert>
	<h1>광고게시판</h1>
	<form id="categoryForm" method="get">
		<div id="category_div">
			<input type="button" class="category_button" name="category" value="이사/용달" />
			<input type="button" class="category_button" name="category" value="인테리어/간판" />
			<input type="button" class="category_button" name="category" value="청소" />
			<input type="button" class="category_button" name="category" value="학원" />
			<input type="button" class="category_button" name="category" value="미용" />
			<input type="button" class="category_button" name="category" value="운동" />
			<input type="button" class="category_button" name="category" value="병원" />
			<input type="button" class="category_button" name="category" value="금융" />
			<input type="button" class="category_button" name="category" value="기타" />			
		</div>

		<table>
			<thead>
				<tr>
					<th class="cat">카테고리</th>
					<th class="reg">지역</th>
					<th class="tit">제목</th>
					<th class="wri">작성자</th>
					<th>작성일</th>
					<th>찜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${adBoardList}" var="board">
					<tr>
						<td>${board.category}</td>
						<td>${board.addressSggNm}</td>
						<td class="text">
							<c:if test="${board.fileCount > 0 }">
								<span class="badge rounded-pill text-bg-info">
									<i class="fa-regular fa-images"></i>
								</span>
							</c:if>
							<a href="/adBoard/id/${board.id}">${board.title}</a>

							<c:if test="${board.commentCount > 0 }">
								<span class="badge rounded-pill text-bg-dark"> ${board.commentCount } </span>
							</c:if>
						</td>
						<td>${board.writer}</td>
						<td>${board.inserted}</td>
						<td>${board.likeCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="container-lg">
			<div class="row">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">

						<!-- 이전 버튼 -->
						<c:if test="${pageInfo.currentPageNum gt 1 }">
							<my:pageItem pageNum="${pageInfo.currentPageNum - 1 }">
								<i class="fa-solid fa-angle-left"></i>
							</my:pageItem>
						</c:if>

						<c:forEach begin="${pageInfo.leftPageNum }" end="${pageInfo.rightPageNum }" var="pageNum">
							<my:pageItem pageNum="${pageNum }">
							${pageNum }
						</my:pageItem>
						</c:forEach>

						<!-- 다음 버튼 -->
						<c:if test="${pageInfo.currentPageNum lt pageInfo.lastPageNum }">
							<%-- 페이지 번호 : ${pageInfo.currentPageNum + 1 } --%>
							<my:pageItem pageNum="${pageInfo.currentPageNum + 1 }">
								<i class="fa-solid fa-angle-right"></i>
							</my:pageItem>

						</c:if>

					</ul>
				</nav>
			</div>
		</div>

		<my:freesearch></my:freesearch>
	</form>
	<div class="div_writer">
		<a href="/adBoard/add" class="writer_link-color">
			<div class="board_writer-icon">
				<i class="fa-solid fa-pen-to-square"></i>
			</div>
		</a>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="/js/adBoard/category.js"></script>
</body>
</html>