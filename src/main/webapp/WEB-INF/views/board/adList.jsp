<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
		<h1>광고게시판 </h1>  
		<select name="category" >
			<option value="이사/용달">이사/용달</option>
			<option value="인테리어/간판">인테리어/간판</option>
			<option value="청소">청소</option>
			<option value="학원">학원</option>
			<option value="미용">미용</option>
			<option value="운동">운동</option>
			<option value="병원">병원</option>
			<option value="금융">금융</option>
			<option value="기타">기타</option>
		</select>				
		<div>
			<a class="btn btn-secondary" href="/board/adAdd">글쓰기</a>
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>게시판</th>
					<th>제목</th>
					<th>닉네임</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${adBoardList }" var="adBoard">
					<tr>
						<td>${adBoard.id }</td>
						<td>
							
						</td>
						<td><a href="/board/id/${adBoard.id }">${adBoard.title }</a></td>
						<td>${adBoard.writer }</td>
						<td>${adBoard.inserted }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>