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
a{
	text-decoration: none;
	color: black;
}
a:hover{
	text-decoration: underline;
}
table{
	
	width: 80%;
	text-align: center;
	margin-left: 100px;
		
}
table > thead > tr > th{
		
	padding: 10px;
	border-bottom: 1px solid #ccc;
	border-top: 2px solid green;
	
}
table > tbody > tr > td{
	
	padding: 10px;
	border-bottom: 1px solid #ccc;
	
}
h1{
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
}
.div_writer {
	position: fixed;
	bottom: 0;
	right: 0;
	margin: 0px, 30px, 30px, 0px;
}
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
}
.cat{
	width: 95px;
}
.reg{
	width: 80px;
}
.wri{
	width: 150px;
}
.tit{
	width: 700px;
}
.bt{
	width: 80px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border-radius: 10%;
	background-color: greenyellow;
	border-color: white;
	position: relative;
	right: -420px;
	font-weight: bold;
}

</style>
</head>
<body>
	<my:navBar></my:navBar>	
	<my:alert></my:alert>
	<h1>알바게시판</h1>	
	<form action="" method="get">
		<div id="category_div">
			<input type="button" class="category_button" name="boardCategory" value="구인해요"/>
			<input type="button" class="category_button" name="boardCategory" value="구직해요"/>
			<div class="bt"><a href="/ptBoard/add">글쓰기</a></div>			
		</div>
		<table>
			<thead>
				<tr>
					<th class="cat">카테고리</th>
					<th class="reg">지역</th>
					<th class="tit">제목</th>
					<th class="wri">작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ptBoardList}" var="board">
					<tr>
						<td>${board.category}</td>
						<td>${board.region}</td>
						<td><a href="/ptBoard/id/${board.id}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td>${board.inserted}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<my:freesearch></my:freesearch>
	</form>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>