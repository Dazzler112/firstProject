<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>채팅</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	.container{
		width: 500px;
		margin: 0 auto;
		padding: 25px;
	}
	.container h1{
		text-align: left;
		padding: 5px 5px 5px 0px;
		color: #1aeb0b;
		margin-bottom: 20px;
	}
	.chating{
		background-color: #000;
		width: 500px;
		height: 500px;
		overflow: auto;
	}
	.chating .me{
		color: #f6f6f6;
		text-align: right;
	}
	.chating .others{
		color: #ffe400;
		text-align: left;
	}
	.chating .start{
		color: #aaaaaa;
		text-align: center;
	}
	.chating .exit{
		color: red;
		text-align: center;
	}
	input{
		width: 320px;
		height: 25px;
	}
	#yourMsg{
		display: none;
	}
	#listBtn{
		margin-top: 50px;
	}
</style>



<body>

	<div id="container" class="container">
		<h1>Second Stop</h1>
		<h2>채팅하기</h2>
		<input type="hidden" id="sessionId">
		<div id="chating" class="chating"></div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>닉네임</th>
					<th><input type="text" class="form-control form-control-sm" name="userName" id="userName" /></th>
					<th><button class="btn btn-sm btn-primary" onclick="chatName()" id="starBtn">채팅 참가</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input type="text" class="form-control form-control-sm" id="chatting" placeholder="메시지를 입력하세요" /></th>
					<th><button class="btn btn-sm btn-primary" onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
		
		<a id="listBtn" class="btn btn-secondary" href="/adBoard/list">목록으로</a>	
	</div>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/js/chat.js"></script>
</body>
</html>











