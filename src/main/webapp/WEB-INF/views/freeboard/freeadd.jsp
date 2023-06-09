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
<style>
#category_div-div {
	margin: 15px 0px;
}
.category_title{
	
}
</style>
</head>
<body>
<my:search></my:search>
	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-10 col-md-12 col-lg-14">
				<form action="" method="post" enctype="multipart/form-data">
					<div id="category_div-div">
					<span class="category_title">카테고리</span><select name="boardCategory">
					<option value="동네질문"> 동네질문
					<option value="동네사건사고"> 동네사건사고
					<option value="동네맛집"> 동네맛집
					<option value="동네소식"> 동네소식
					<option value="생활정보"> 생활정보
					<option value="취미생활"> 취미생활
					<option value="일상"> 일상
					<option value="분실"> 분실
					<option value="해주세요"> 해주세요
					</select>
					</div>
					<div class="mb-3">
					<label for="add-title" class="form-label"></label>제목
					<input id="add-title" type="text"  class="form-control" name="title" value="${getBoard.title}"/>
					</div>
					<div class="mb-3">
					<label for="add-body" class="form-label"></label>본문
					<textarea rows="10" id="add-body" class="form-control" name="body" >${getBoard.body }</textarea>
					</div>
					<div class="mb-3">
					<label for="add-writer" class="form-label"></label>작성자
					<input id="add-writer" type="text"  class="form-control" name="writer" value="${getBoard.writer}" />
					</div>
					<div class="mb-3">
					<label for="add-region" class="form-label"></label>지역
					<input id="add-region" type="text"  class="form-control" name="region" value="${getBoard.region}" />
					</div>
					<div class="mb-3">
						<label for="add-file" class="form-label"></label>사진
						<input id="add-file" class="form-control" type="file"  name="fileList" accept="image/*" multiple/>
					</div>
					<button class="btn btn-primary">글쓰기</button>
					<a href="/freeboard/freelist" class="btn btn-danger" style="margin: 0px 0px 0px 10px;">취소</a>
				</form>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>