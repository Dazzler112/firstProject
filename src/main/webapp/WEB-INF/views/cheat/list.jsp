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
</head>
<body>



	<div class="container-lg">
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
							<td>0${cheat.phoneNum }</td> <%-- db에서 varchar타입이지만 jsp에서 출력한 화면에는 0이 빠짐 --%>
							<td>${cheat.account }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>

			<c:if test="${cheatList == null}">
				<h3>신고된 피해 사례가 없습니다.</h3>
			</c:if>

		<a href="./check" class="btn btn-info">다시 조회하기</a>

	</div>


		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>