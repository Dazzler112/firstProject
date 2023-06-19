<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	.container{
		margin-top: 100px;
	}
	.header{
		border-bottom: 1px solid black;
	}
	.title{
		border-top: 2px solid green;
		border-bottom: 1px solid #d6d4d4;
		padding: 10px;
	}
	.form-label{
		font-weight: bold;
	}
	.tit_con{
		width: 600px;
		margin-left: 80px;
	}
	.mid{
		padding: 10px;
		font-weight: bold;
	}
	.cat{
		margin-left: 50px;
	}
	.reg{
		margin-left: 180px;
	}
	.reg_con{
		margin-left: 50px;
	}
	.content{
		border-bottom: 1px solid black;
		padding: 10px;
	}
	.cont_box{
		width: 100%;
		height: 400px;
		border: 0;
	}
	.butt{
		padding: 10px;
		text-align: center;
	}
	.mb-5{
		margin-top: 20px;
	}
</style>
<body>

<div class="container">
	<form method="post" enctype="multipart/form-data">
		<h2>Community > 광고게시판</h2>
		<p>글쓰기 페이지 입니다.</p>
		<div class="header">			
			<div class="title">
				<label for="titleInput" class="form-label">제목</label>
				<input id="titleInput" type="text" name="title" placeholder="제목 입력" class="tit_con" value="${board.title }" />
			</div>
			<div class="mid">
				<span>카테고리</span>
				<select class="cat" name="category">
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
				<span class="reg">지역</span>
				<select class="reg_con" name="location">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="대전">대전</option>
					<option value="광주">광주</option>
					<option value="대구">대구</option>
					<option value="부산">부산</option>
					<option value="울산">울산</option>
					<option value="인천">인천</option>
					<option value="제주">제주</option>
					<option value="충북">충북</option>
					<option value="충남">충남</option>
					<option value="전북">전북</option>
					<option value="전북">전북</option>
					<option value="경북">경북</option>
					<option value="경남">경남</option>
				</select>
			</div>
		</div>
		<div class="content">
			<textarea class="cont_box" name="body" placeholder="내용 입력">${board.body }</textarea>
		</div>
		<div>
			<div class="mb-5">
				<label for="fileInput" class="form-label">사진 첨부</label>
				<input class="form-control" type="file" id="fileInput" name="files" accept="image/*" multiple>
			</div>
		</div>
		<div class="butt">
			<button type="submit" class="btn btn-dark">등록</button>
			<a href="/adBoard/list" class="btn btn-dark">취소</a>
		</div>

	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>