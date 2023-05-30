<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="/resources/menubar.css" rel="stylesheet">
</head>
<body>
	<my:navbar></my:navbar>
	<my:menubar></my:menubar>
	<h1>dkfhekjf</h1>
	<style>
.category {
	margin-bottom: 10px;
}

.category-toggle {
	cursor: pointer;
	font-weight: bold;
}

.category-content {
	display: none;
	margin-left: 20px;
}
</style>
	<script>
		function toggleCategory(categoryId) {
			var category = document.getElementById(categoryId);
			var content = category.querySelector('.category-content');
			if (content.style.display === 'none') {
				content.style.display = 'block';
			} else {
				content.style.display = 'none';
			}
		}
	</script>
</head>
<body>
	<div class="category" id="category1">
		<div class="category-toggle" onclick="toggleCategory('category1')">1. 카테고리</div>
		<div class="category-content">
			<div class="category" id="category2">
				<div class="category-toggle" onclick="toggleCategory('category2')">패션 의류</div>
				<div class="category-content">
					<ul>
						<li><a href="#">남성 의류</a></li>
						<li><a href="#">여성 의류</a></li>
					</ul>
				</div>
			</div>
			<div class="category" id="category3">
				<div class="category-toggle" onclick="toggleCategory('category3')">모바일 테블릿</div>
				<div class="category-content">
					<ul>
						<li><a href="#">스마트폰</a></li>
						<li><a href="#">스마트워치</a></li>
						<li><a href="#">케이스</a></li>
						<li><a href="#">보조배터리/충전기/케이블</a></li>
					</ul>
				</div>
			</div>
			<div class="category" id="category4">
				<div class="category-toggle" onclick="toggleCategory('category4')">게임</div>
				<div class="category-content">
					<ul>
						<li><a href="#">pc게임</a></li>
						<li><a href="#">플레이스테이션</a></li>
						<li><a href="#">닌텐도</a></li>
						<li><a href="#">기타게임</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="category" id="category5">
		<div class="category-toggle" onclick="toggleCategory('category5')">세부설정</div>
		<div class="category-content">
			
				<input type="radio" name="chk_info" value="CSS" >10만원 ~ 20만원
				<br />
				<br />
				<input type="radio" name="chk_info" value="CSS" >20만원 ~ 30만원
				<br />
				<br />
				<input type="radio" name="chk_info" value="CSS" >30만원 ~ 40만원
				
		</div>
	</div>
	<!-- 나머지 카테고리들도 위와 같은 구조로 추가 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>