<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.button-group {
	position: fixed;
	right: 20px;
	bottom: 20px;
	display: flex;
	flex-direction: row;
}

.button-group a {
	margin-left: 10px;
}
</style>
</head>
<body>

	<div class="container-lg">
		<h1>Second Stop 사기 통합 조회 목록</h1>

		<h3>피해 사례 조회 결과</h3>
		<hr />

		<table class="table">
			<c:if test="${cheatList != null}">
				<thead>
					<tr>
						<th>${param.search }<br /> 피해사례 조회 결과
						</th>
						<th></th>
					</tr>
				</thead>
			</c:if>
			<tbody>
				<c:if test="${cheatCount != 0}">
					<tr>
						<td>Second Stop DB</td>
						<td>${cheatCount }회 신고됨</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		<c:if test="${cheatCount == 0}">
			<h3>신고된 피해 사례가 없습니다.</h3>
		</c:if>

		<div class="button-group">
			<a href="./check" class="btn btn-info">다시 조회하기</a>
			<!-- <a href="./" class="btn btn-danger">신고하기</a> -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">신고하기</button>

			<div class="modal" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">신고 신청 안내</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>신고 신청은 jhzzang97@gmail.com으로 접수 부탁드립니다.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
						</div>
					</div>
				</div>
			</div>
			
		</div>				
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


</body>
</html>