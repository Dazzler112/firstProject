<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
<style>
.comment_input{
	margin:10px 0px;
	width:900px;
	height: 100px;
	border-radius: 10px;
	border: 1px solid rgba(0,0,0,0.1);
	padding: 0px 12px;
}
.comment-line{
	margin:10px 30px 5px 30px;  
	}
.comment-commit{
	border: none;
	border-radius: 8px;
	height: 100px;
	font-weight: 600;
	background-color: #83D4F7;
}
#updateCommentContainer{
	display: flex;
	justify-content: center;
	align-items: center;
}
.update_comment-text{
	margin:10px 0px;
	width:900px;
	height: 100px;
	border-radius: 10px;
	border: 1px solid rgba(0,0,0,0.1);
	padding: 0px 12px;
}
.update-commit {
	border: none;
	border-radius: 8px;
	height: 100px;
	font-weight: 600;
	background-color: rgba(0,0,0,0.4);
	color:white;
	}
.comment_column-div{
	border:0.5px solid rgba(0,0,0,0.1);
	margin:0px 3.5px 0px 20px;
	padding: 1px 3px 1px 3px;
	background-color: #F5F3E7;
	border-radius: 7px;
	color: #A1959C;
	font-size: 23px;
}	
.comment_container-div {
	margin: 10px 0px ;
	padding-bottom: 20px;
	border-bottom: 1px solid rgba(0,0,0,0.2);
}
</style>
</head>
<body>
	
	<div class="container-lg">
	<a href="/freeboard/freelist">홈</a>
	</div>
	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-10 col-md-12 col-lg-14">
				<div style="display:none;">
					<span id="boardIdText">${getBoard.id }</span>
				</div>
				<div style="display: flex; justify-content: space-between; align-items: center;">
					<div class="mb-3" style="display: flex; align-items: center;">
						<label for="category-text" class="form-label"></label>카테고리
						<input id="category-text" type="text"  class="form-control" name="boardCategory" value="${getBoard.boardCategory}" style="width: 330px; margin: 0px 0px px 5px; text-align:center; " readonly/>
					</div>

					<div>
						<h1 style="font-size: 26px; font-weight: 550;">
							공감하기 <span id="likeIcon"> <c:if test="${getBoard.liked }">
									<i class="fa-solid fa-heart"></i>
								</c:if> 
								<c:if test="${not getBoard.liked }">
									<i class="fa-regular fa-heart"></i>
								</c:if>
							</span> 
							<span id="likeNumber">${getBoard.likeCount }</span>
						</h1>
					</div>

				</div>
				<div class="mb-3" style="display: flex; justify-content: space-between;">
					<label for="get-writer" class="form-label"></label>작성자 
					<input id="get-writer" type="text" class="form-control" name="writer" value="${getBoard.writer}" readonly /> 
					<label for="get-inserted" class="form-label"></label>작성일 
					<input id="get-inserted" type="text" class="form-control" name="inserted" value="${getBoard.inserted}" readonly />
				</div>
				<div class="mb-3">
					<label for="get-title" class="form-label"></label>제목 
					<input id="get-title" type="text" class="form-control" name="title" value="${getBoard.title}" readonly />
				</div>

				<!-- 파일 출력 -->
				<div class="mb-3">
					<c:forEach items="${getBoard.photoName }" var="photo">
						<div>
							<img class="img-fluid img-thumbnail" src="${bucketUrl}/${getBoard.id}/${photo}" />
						</div>
					</c:forEach>
				</div>

				<div class="mb-3">
					<label for="get-body" class="form-label"></label>본문
					<textarea rows="10" id="get-body" class="form-control" name="body" readonly>${getBoard.body }</textarea>
				</div>

				<div class="mb-3">
					<label for="get-region" class="form-label"></label>지역 <input id="get-region" type="text" class="form-control" name="region" value="${getBoard.region}" readonly />
				</div>

				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="name" var="userId"/>
					<c:if test="${userId eq getBoard.writer }">
				<div class="mb-3">
					<a class="btn btn-secondary" href="/freeboard/freeupdate/${getBoard.id}">수정</a>
					<button class="btn btn-danger" form="removeForm" type="submit">삭제</button>
				</div>
				</c:if>
				</sec:authorize>
			</div>
		</div>
	</div>

	<hr />
	<div class="form-control"  id="commentContainer">
	<sec:authorize access="isAuthenticated()">
		<div id="addCommentContainer" style="display: flex; justify-content: center;align-items: center;">
			<textarea rows="" id="commentTextArea" class="comment_input"></textarea>
			<button id="sendCommentBtn" class="comment-commit">올리기</button>
		</div>
		<div id="updateCommentContainer">
			<input type="hidden" id="commentUpdateIdInput"/>
			<textarea id="commentUpdateTextArea" class="update_comment-text" placeholder="내용을 입력해주세요"></textarea>
			<button id="updateCommentBtn" class="update-commit">수정</button>
		</div>
		</sec:authorize>
		<hr />
			<c:if test="${commentCnt.get(0).commentCount > 0}">
			<div class="comment_container-div">
			<span class="comment_column-div">
			<i class="fa-solid fa-comment"></i>
    		 <span id="comment_counting-cnt">
        	  댓글수					
     	      ${commentCnt.get(0).commentCount}
    		 </span>
    		 </span>
    		 </div>
			</c:if>
		<ul id="commentListContainer" class="comment-line">
			<div id="comment_reply">댓글1</div>
		</ul>
	</div>

<sec:authorize access="isAuthenticated()">
		<sec:authentication property="name" var="userId" />
		<c:if test="${userId eq getBoard.writer }">

	<div style="display: none; ">
		<form action="/freeboard/remove" method="post" id="removeForm">
			<input id="inputId" type="text" name="id" value="${getBoard.id }" />
		</form>
	</div>
	
	</c:if>
	</sec:authorize>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="/js/freeboard/like.js"></script>
	<script src="/js/freeboard/comment.js"></script>
</body>
</html>