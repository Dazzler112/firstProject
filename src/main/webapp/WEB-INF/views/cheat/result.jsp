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

html, body {
  height: 80%;
}

body {
/*   display: flex; */
  align-items: center;
  justify-content: center;
}

.container-lg>h1{
	font-size: 30px;
	color: #55A44E;
	margin-bottom: 20px;
	font-weight: bold;
}

.container-lg>h3{
	font-size: 20px;
	color: #55A44E;
	margin-bottom: 20px;
	font-weight: bold;
}

.checkBtn{
  justify-content: center;
  text-align: center;
  margin: 45px;
}

#reCheck{
	width: 900px;
	margin: 5px;
	color: white;
	background-color: #55A44E;
}

#reportButton {
	width: 900px;
	margin: 5px;
	color: white;
	background-color: #55A44E;
}

</style>
</head>
<body>

	<my:navBar></my:navBar>

	<div class="container-lg">
		<h1>Second Stop 사기 통합 조회 목록</h1>

		<h3>피해 사례 조회 결과</h3>
		<hr />

		<table class="table">
			<c:if test="${cheatList != null}">
				<thead>
					<tr>
						<th style="font-size: 15px">${param.search }<br /> 피해사례 조회 결과
						</th>
						<th></th>
					</tr>
				</thead>
			</c:if>
			<tbody>
				<c:if test="${cheatCount != 0}">
					<tr>
						<td style="font-size: 13px; font-weight: bold">Second Stop DB</td>
						<td style="font-size: 15px; color: #55A44E; font-weight: bold">${cheatCount }회 신고됨</td>
					</tr>
				</c:if>
			</tbody>
		</table>


		<c:if test="${cheatCount == 0}">
			<h3>신고된 피해 사례가 없습니다.</h3>
		</c:if>

		<div class="checkBtn">
			<div>
				<a id="reCheck" href="./check" class="btn btn-light">다시 조회하기</a>
			</div>
			<div>
				<button id="reportButton" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</button>
			</div>
		</div>

		<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">신고 안내</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">신고 신청은 jhzzang97@gmail.com으로 접수 부탁드립니다!</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

	</div>

<%-- 	<my:footer></my:footer> --%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


</body>
</html>