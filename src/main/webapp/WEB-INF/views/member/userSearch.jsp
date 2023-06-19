<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
#modal.modal-overlay {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
  display: none;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: rgba(255, 255, 255, 1); 
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
  backdrop-filter: blur(1.5px);
  -webkit-backdrop-filter: blur(1.5px);
  border-radius: 10px;
  border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
  background: rgb(85, 164, 78); 
  backdrop-filter: blur(13.5px);
  -webkit-backdrop-filter: blur(13.5px);
  border-radius: 10px;
  border: 1px solid rgba(255, 255, 255, 1);
  width: 400px;
  height: 300px;
  position: relative;
  top: -50px;
  padding: 10px;
}


#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#inputVerificationCode .form-control {
	width: 10%;
}

#findId {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #55A44E;
}

h3 {
	margin: 30px;
	font-weight: bold;
}

#inputName {
	margin-top: 20px;
}
</style>
</head>

<body>

	<my:navBar></my:navBar>

	<!--파일 불러오기-->
	<%@ include file="./modal.jsp"%>

	<div class="w3-content w3-container w3-margin-top" id="findId">
		<div class="w3-container w3-card-4">

			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기</h3>
			</div>
			<div id="inputName">
				<div>
					<label>이름</label>
				</div>
				<div>
					<input class="form-control" type="text" id="name" name="name" placeholder="이름을 입력해주세요!" required>
				</div>


				<div class="mb-3">
					<div class="input-group">
						<div>
							<label>Email</label> <input class="form-control" type="email" id="inputEmail" name="email" placeholder="이메일을 입력해주세요!" required>
							<button class="btn btn-outline-success" type="button" id="checkEmailBtn">인증하기</button>
						</div>
					</div>
				</div>

				<!-- 인증번호 입력 칸 -->
				<div class="d-none" id="inputVerificationCode">
					<p class="input-group">
						<input type="text" class="form-control" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력하세요" />
						<button class="btn btn-outline-success" type="button" id="verifyEmailBtn" style="display: none;">확인</button>
					</p>
				</div>

				<!-- 인증 완료 메시지 -->
				<div class="d-none form-text text-primary" id="verificationSuccessText">
					<i class="fa-solid fa-check"></i>이메일 인증이 완료되었습니다.
				</div>

				<div class="w3-center">
					<button type="button" id='find_id' onclick="findId_click()" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round btn btn-success">find</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round btn btn-secondary">Cancel</button>
				</div>
			</div>

		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	
	// 이메일 인증 버튼 클릭 이벤트 처리
	$("#checkEmailBtn").click(function() {
		// 인증하기 버튼을 클릭하면 인증번호 입력 칸과 확인 버튼을 나타내고, 인증하기 버튼은 숨김
		$("#inputVerificationCode").removeClass("d-none");
		$("#verifyEmailBtn").show();
		$("#checkEmailBtn").hide();

		var email = $("#inputEmail").val();
		if (email) {
			// 이메일 전송 요청
			$.ajax({
				url: "/member/mail",
				method: "POST",
				data: {
					email: email
				},
				success: function(response) {
					// 이메일 전송 성공 시 처리
					$("#inputEmail").prop("disabled", true);
					$("#verifyEmailBtn").hide();
					$("#inputVerificationCode").removeClass("d-none");
					$("#verifyCodeBtn").show();
				},
				error: function() {
					// 에러 처리 로직 추가
				}
			});
		}
	});

	// 확인 버튼 클릭 시 동작
	$("#verifyEmailBtn").click(function() {
		// 인증 확인 버튼을 클릭하면 인증번호 입력 칸과 확인 버튼을 숨기고, 인증 완료 메시지를 나타냄
		//    $("#inputVerificationCode").hide();
		//    $("#verifyEmailBtn").hide();

		$("#verificationSuccessText").show();
	});


	// 확인 버튼 클릭 이벤트 처리
	$("#verifyEmailBtn").click(function() {
		var enteredCode = $("#verificationCode").val();
		if (enteredCode) {
			// 이메일 전송 요청
			$.ajax({
				url: "/member/mailCheck",
				method: "POST",
				data: {
					enteredCode: enteredCode
				},
				success: function(response) {
					var authentication = response.authentication;


					if (authentication) {
						// 인증번호 일치 시 회원 가입 진행
						checkEmail = true;
						enableSubmit();

						alert("인증이 완료되었습니다. 회원 가입을 진행합니다.");
					} else {
						alert("인증번호가 일치하지 않습니다. 다시 확인해 주세요.");
					}
				}

			});
		}
	});


	function findId_click(){
		var name=$('#name').val()
		var email=$('#inputEmail').val()
		
		$.ajax({
			url:"./findId",
			type:"POST",
			data:{"name":name, "email":email} ,
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");
					$('#name').val('');
					$('#email').val('');
				} else {
					$('#id_value').text(data);
					$('#name').val('');
					$('#email').val('');
					
				}
			},
			 error:function(){
	                alert("에러입니다");
	            }
		});
	};

const modal = document.getElementById("modal")
const btnModal = document.getElementById("find_id")

btnModal.addEventListener("click", e => {
    modal.style.display = "flex"
})

    
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})

modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
    }
})



</script>
</body>
</html>