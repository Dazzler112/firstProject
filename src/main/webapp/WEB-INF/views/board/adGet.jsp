<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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

	<div class="row justify-content-center">
		<div class="col-12 col-md-8 col-lg-6">
			<div class="d-flex">
				<div class="me-auto">
					<div>
						<a class="btn btn-secondary" href="/board/adList">HOME</a>
					</div>
					<div>
						<div class="mb-3">
							<label for="" class="form-label">제목</label>
							<input type="text" class="form-control" value="${adBoard.title }" readonly />
						</div>
						<div class="mb-3">
							<label for="" class="form-label">본문</label>
							<textarea class="form-control" readonly rows="10">${adBoard.body }</textarea>
						</div>
						<div class="mb-3">
							<label for="" class="form-label">작성자</label>
							<input type="text" class="form-control" value="${adBoard.writer }" readonly />
						</div>
						<div class="mb-3">
							<label for="" class="form-label">작성일시</label>
							<input type="text" readonly class="form-control" value="${adBoard.inserted }" />
						</div>

						<div>
							<a class="btn btn-secondary" href="/board/adModify/${adBoard.id }">수정</a>
							<button id="removeButton" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>