<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SecondStop</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body{
	margin: 0em 1em;
	width: 1100px; /* 콘텐츠 영역의 폭을 고정 값으로 설정 */
  	margin: 0 auto; /* 가운데 정렬 */
}
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
	background-color: rgba(0,0,0,0.5);
	color:white;
	}
.comment_column-div{
	border:0.8px solid rgba(0,0,0,0.2);
	margin:0px 3.5px 0px 20px;
	padding: 1px 3px 1px 3px;
	background-color: #F191B9;
	border-radius: 7px;
	color: white;
	font-size: 23px;
}	
.comment_container-div {
	margin: 10px 0px ;
	padding-bottom: 20px;
	border-bottom: 1px solid rgba(0,0,0,0.2);
}
/* 모달 */
#deleteConfirmModal{
	position: fixed;
	z-index: 9999;
	left: 0;
	top:0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0,0,0,0.37);
	display: none;
}
.modal_content{
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 2px solid #888;
	border-radius: 5px;
	width: 40%;
	font-weight: 600;
}
.modal-f-header{
	display:flex;
	justify-content: center;
	margin: 5px 0px 20px 0px;
	padding-bottom: 20px;
	border-bottom: 1px solid rgba(0,0,0,0.2);
	
}
.modal-title-f{
	font-weight: 600;
	font-size: 27px;
}
.modal-text-f{
	margin-bottom:10px;
}
#close-modal-s{
	border: none;
	padding: 8px 13px;
	background-color: rgba(0,0,0,0.4);
	border-radius: 10px;
	color: white;
	font-weight: 600;
	margin-right: 10px;
}
#delete-modal{
	border: none;
	padding: 8px 13px;
	background-color: red;
	border-radius: 10px;
	color: white;
	font-weight: 600;
	margin-right: 10px;
}
/* 댓글삭제 모달 */
#deleteCommentModal{
	position: fixed;
	z-index: 9999;
	left: 0;
	top:0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0,0,0,0.37);
	display: none;
	
}
</style>
</head>
<body>
	<my:navBar></my:navBar>
	<div style="padding: 0em 6em;">
	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="col-14 col-md-16 col-lg-18">
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
					<button  id="delete_modal-btn" class="btn btn-danger" type="submit" >삭제</button>
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
		<!-- ajax 토글식으로 변경 
			<div id="updateCommentContainer">
			<input type="hidden" id="commentUpdateIdInput"/>
			<textarea id="commentUpdateTextArea" class="update_comment-text" placeholder="내용을 입력해주세요"></textarea>
			<button id="updateCommentBtn" class="update-commit">수정</button>
		</div> -->
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
	
	</div>
	<!-- 모달 -->
	<!-- 게시글 삭제시  -->
	<div style="" class="delete_modal-f" id="deleteConfirmModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal_content">
			<div class="modal-f-header">
			<h1 class="modal-title-f" id="exampleModalLabel">게시글 삭제</h1>
			</div>
			<div class="modal-text-f">
				<span>정말로 게시글을 삭제하시겠습니까?</span>
			</div>
			<div class="modal-f-footer">
			<button type="button" id="close-modal-s" >닫기</button>
			<button type="submit" id="delete-modal" form="removeForm">삭제</button>
			</div>
		</div>
	</div>
	<!-- 댓글 삭제시 -->
	<div style="" class="delete_modal-f" id="deleteCommentModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal_content">
			<div class="modal-f-header">
			<h1 class="modal-title-f" id="exampleModalLabel">댓글 삭제</h1>
			</div>
			<div class="modal-text-f">
				<span>정말로 댓글을 삭제하시겠습니까?</span>
			</div>
			<div class="modal-f-footer">
			<button type="button" id="close_comment-modal-s" >닫기</button>
			<button type="submit" id="delete_comment-modal" form="removeForm">삭제</button>
			</div>
		</div>
	</div>
	</c:if>
	</sec:authorize>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="/js/freeboard/like.js"></script>
	<script src="/js/freeboard/comment.js"></script>
	<script>
	//게시글삭제
	$(function() {
		  // 삭제 버튼 클릭 시 모달 열기
		  $("#delete_modal-btn").click(function() {
		    $("#deleteConfirmModal").fadeIn();
		  });

		  // 닫기 버튼 클릭 시 모달 닫기
		  $("#close-modal, #close-modal-s").click(function() {
		    $("#deleteConfirmModal").fadeOut();
		  });
		});
	// 댓글삭제
	</script>
<!-- 	<script src="/js/freeboard/comment.js">
	$(function() {
		  // 삭제 버튼 클릭 시 모달 열기
		  $(".commentDeleteButton").click(function() {
		    $("#deleteCommentModal").fadeIn();
		  });

		  // 닫기 버튼 클릭 시 모달 닫기
		  $("#close_comment-modal, #close_comment-modal-s").click(function() {
		    $("#deleteCommentModal").fadeOut();
		  });
		});
	</script> -->
</body>
</html>