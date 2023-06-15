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
</head>
<style>

	#boardIdText{
		font-size: small;
	}
	#text{
		font-size: small;
	}
	.form-control{
		font-weight: bold;
	}
	.head{
		margin-bottom: 20px;
		margin-top: -25px;
	}
	.body{
		margin-top: -35px;
	}
	#good{
		margin-left: 200px;
	}
	.input-group{
		margin-top: 10px;
	}
	.commentInserted{
		color: #999;
		font-size: 12px;
		margin-left: 10px;
	}
	
</style>
<body>

	<my:navBar></my:navBar>

	<my:alert></my:alert>
	<!-- toast -->
	<div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">
		<div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="d-flex">
				<div class="toast-body"></div>
				<button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
	</div>


	<div class="container-lg">
		<div class="row justify-content-left">
			<div class="col-12 col-md-8 col-lg-6">
				<a class="btn btn-secondary" href="/adBoard/list">목록으로</a>
				<div class="me-auto">
					<h2>
						Community > 광고게시판
						<span id="text">No.</span>
						<span id="boardIdText">${board.id}</span>	
					</h2>
				</div>
				
				<div>
					<div>
						<label for="" class="form-label"></label>
						<input type="text" class="form-control" value="${board.title }" readonly />
					</div>
					<div class="head">
						<label for="" class="form-label"></label>
						<input type="text" class="form-control" value="작성자 : ${board.writer }  |  ${board.inserted}   |  찜 : ${board.likeCount}" readonly />
					</div>

					<!-- 그림 파일 출력 -->
					<div class="pic">
						<c:forEach items="${board.fileName }" var="fileName">
							<div class="mb-3">
								<img class="img-thumbnail img-fluid" src="${bucketUrl }/${board.id }/${fileName}" alt="" />
							</div>
						</c:forEach>
					</div>

					<div class="body">
						<label for="" class="form-label"></label>
						<textarea class="form-control" readonly rows="10">${board.body }</textarea>
					</div>
					<div>
						<h1>
							<span id="likeIcon">
								<c:if test="${board.liked }">
									<i class="fa-solid fa-thumbs-up"></i>
								</c:if>
	
								<c:if test="${not board.liked }">
									<span id="good"><i class="fa-regular fa-thumbs-up"></i></span>
								</c:if>
							</span>
							<span id="likeNumber">  </span>
						</h1>
					</div>			

					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="name" var="userId" />
						<c:if test="${userId eq board.writer }">
							<div>
								<a class="btn btn-secondary" href="/adBoard/modify/${board.id }">수정</a>
								<button id="removeButton" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">삭제</button>
							</div>
						</c:if>
					</sec:authorize>
				</div>

				<hr />

				<div id="commentContainer">
					<span>
						댓글 ${board.commentCount}개
					</span>
					<sec:authorize access="isAuthenticated()">
						<div class="mb-3" id="addCommentContainer">


							<div class="input-group">
								<div class="form-floating">
									<textarea style="height: 97px" placeholder="댓글을 남겨주세요" class="form-control" id="commentTextArea"></textarea>
									<label for="floatingTextarea">댓글을 남겨주세요</label>
								</div>
								<button class="btn btn-outline-primary" id="sendCommentBtn">
									<i class="fa-regular fa-paper-plane"></i>
								</button>
							</div>
						</div>
					</sec:authorize>



					<ul class="list-group" id="commentListContainer">


					</ul>
				</div>

			</div>
		</div>
	</div>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="name" var="userId" />
		<c:if test="${userId eq board.writer }">
			<div class="d-none">
				<form action="/adBoard/remove" method="post" id="removeForm">
					<input id="inputId" type="text" name="id" value="${board.id }" />
				</form>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">삭제 하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-danger" form="removeForm">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		<!-- 댓글 삭제 Modal -->
		<div class="modal fade" id="deleteCommentConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5">댓글 삭제 확인</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">삭제 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button id="deleteCommentModalButton" data-bs-dismiss="modal" type="submit" class="btn btn-danger">삭제</button>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 댓글 수정 모달 --%>
		<div class="modal fade" id="commentUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5">댓글 수정</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div id="updateCommentContainer">
							<input type="hidden" id="commentUpdateIdInput" />
							<textarea class="form-control" id="commentUpdateTextArea"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="updateCommentBtn" data-bs-dismiss="modal">수정</button>
					</div>
				</div>
			</div>
		</div>		
		
	</sec:authorize>
	
	<my:footer></my:footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="/js/adBoard/like.js"></script>
	<script src="/js/adBoard/comment.js"></script>
</body>
</html>