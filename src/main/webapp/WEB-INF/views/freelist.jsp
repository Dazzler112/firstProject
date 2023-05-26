<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.div_writer {
	position: fixed;
	bottom: 0;
	right: 0;
	margin: 0px, 30px, 30px, 0px;
}
</style>
</head>
<body>

	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-10 col-md-12 col-lg-14">
			<form action="">
				<label for="" class="form-label"></label>
				<input type="checkbox",name="" value="" class="" />동네질문
				<label for="" class="form-label"></label>
				<input type="checkbox",name="" value="" class="" />동네사건사고
				<label for="" class="form-label"></label>
				<input type="checkbox",name="" value="" class="" />동네맛집
				<label for="" class="form-label"></label>
				<input type="checkbox",name="" value="" class="" />동네소식
				<label for="" class="form-label"></label>
				<input type="checkbox",name="" value="" class="" />생활정보
				<label for="" class="form-label"></label>
				<input type="checkbox",name="" value="" class="" />취미생활
				<label for="" class="form-label"></label>
				<input type="checkbox",name="" value="" class="" />일상
				<label for="" class="form-label"></label>
				<input type="checkbox",name="" value="" class="" />분실
				<label for="" class="form-label"></label>
				<input type="checkbox",name="" value="" class="" />해주세요
			</form>
			</div>
		</div>
	</div>

	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-10 col-md-12 col-lg-14">
				<h1>자유 게시판</h1>
				<table class="table">
					<thead>
						<tr>
							<th>게시번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>지역</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList}" var="board">
							<tr>
								<td>${board.id }</td>
								<td><a href="/id/${board.id}">${board.title }</a></td>
								<td>${board.writer }</td>
								<td>${board.region }</td>
								<td>${board.inserted }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="div_writer">
		<a href="/freeadd" class="btn btn-primary">글쓰기</a>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>