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


	<div class="container">
		<div class="d-flex justify-content-center">
			<div class="col-sm-8">
				<h3>사기 조회</h3>
				<hr />

				<!-- 				권한이 있는 사람만 볼 수 있는 리스트 : 운영자 아이디에 권한 부여 후 다시 생성 -->
				<!-- 				<form action="/cheat/list" class="d-flex" role="search"> -->
				<!-- 					<div class="input-group"> -->
				<!-- 						<select class="form-select flex-grow-0" style="width: 140px;" name="type" id=""> -->
				<%-- 							<option value="phoneNum" ${param.type eq 'phoneNum' ? 'selected' : '' }>휴대폰 번호</option> --%>
				<%-- 							<option value="account" ${param.type eq 'account' ? 'selected' : '' }>계좌번호</option> --%>
				<%-- 							<option value="userId" ${param.type eq 'userId' ? 'selected' : '' }>닉네임</option> --%>
				<%-- 							<option value="email" ${param.type eq 'email' ? 'selected' : '' }>이메일</option> --%>
				<!-- 						</select>  -->
				<%-- 						<input value="${param.search }" name="search" class="form-control" type="search" placeholder="Search" aria-label="Search"> --%>
				<!-- 						<button class="btn btn-outline-success" type="submit"> -->
				<!-- 							<i class="fa-solid fa-magnifying-glass"></i> -->
				<!-- 						</button> -->
				<!-- 					</div> -->
				<!-- 				</form> -->

				<form action="/cheat/result" class="d-flex" role="search" id="searchForm">
					<div class="input-group">
						<select class="form-select flex-grow-0" style="width: 140px;" name="type" id="searchType">						
							<option value="basic">선택</option>
							<option value="phoneNum">휴대폰 번호</option>
							<option value="account">계좌번호</option>
							<option value="nickName">닉네임</option>
							<option value="email">이메일</option>
						</select> <input value="" name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">

						<button class="btn btn-outline-success" type="submit">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
		<div class="d-flex justify-content-center mt-3">
			<a href="https://ecrm.police.go.kr/sci/pcc_V3_send" class="btn btn-danger">경찰청 사이버 수사국 바로가기</a>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
		// 옵션 선택 시 이벤트 핸들러
		document.getElementById('searchType').addEventListener(
				'change',
				function() {
					var searchForm = document.getElementById('searchForm');
					var searchType = this.value;
					var searchInput = searchForm
							.querySelector('input[name="search"]');

					// 선택된 옵션에 따라 placeholder를 설정
					switch (searchType) {
					case 'phoneNum':
						searchInput.placeholder = '하이픈(-)없이 숫자만 입력';
						break;
					case 'account':
						searchInput.placeholder = '하이픈(-)없이 숫자만 입력';
						break;
					case 'nickName':
						searchInput.placeholder = '영문, 숫자, 빼기, 밑줄, 마침표만 입력';
						break;
					case 'email':
						searchInput.placeholder = '영문, 숫자, 특수문자만 입력';
						break;
					default:
						searchInput.placeholder = 'Search';
					}

					// 선택된 옵션 값을 쿼리 문자열에 추가
					var queryString = 'type=' + encodeURIComponent(searchType);
					searchForm.action = '/cheat/result?' + queryString;
					
					// 검색창 비우기
				    searchInput.value = '';
				});
	</script>
</body>
</html>