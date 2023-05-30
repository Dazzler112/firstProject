<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
		<div class="row justify-content-center">
			<div class="col-10 col-md-12 col-lg-14">
				
				<div>
					<div>
					<a href="#">메인으로 이동</a>
					</div>
					<div>
					<form action="#">
						<input type="search" />
						<button></button>
					</form>
					</div>
					<div>
						<a href="#">로그인</a>
					</div>
				</div>
			
				<div>
					<a href="#">카테고리</a>
					<a href="#">동네생활</a>
					<a href="#">신고</a>
				</div>
			
				<div>
					<a href="#">동네 자유게시판</a>
					<a href="#">광고</a>
					<a href="#">알바</a>
				</div>
				
				<div>
					<form action="">
						<label for="cate-que" class="form-label"></label>
						<input type="checkbox" id="cate-que" class="form-control"/>동네질문
						<label for="cate-acci" class="form-label"></label>
						<input type="checkbox" id="cate-acci" class="form-control"/>동네사건사고
						<label for="cate-jmt" class="form-label"></label>
						<input type="checkbox" id="cate-jmt" class="form-control"/>동네맛집
						<label for="cate-al" class="form-label"></label>
						<input type="checkbox" id="cate-al" class="form-control"/>동네소식
						<label for="cate-info" class="form-label"></label>
						<input type="checkbox" id="cate-info" class="form-control"/>생활정보
						<label for="cate-hobby" class="form-label"></label>
						<input type="checkbox" id="cate-hobby" class="form-control"/>취미생활
						<label for="cate-day" class="form-label"></label>
						<input type="checkbox" id="cate-day" class="form-control"/>일상
						<label for="cate-lost" class="form-label"></label>
						<input type="checkbox" id="cate-lost" class="form-control"/>분실
						<label for="cate-please" class="form-label"></label>
						<input type="checkbox" id="cate-please" class="form-control"/>해주세요
					</form>
				</div>
			
				<div>
					<h1>지역게시판</h1>
				</div>	
					<div>
						<div>
							
						</div>
						
					</div>
				
			
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>