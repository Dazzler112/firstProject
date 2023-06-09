let checkId = false;
let checkPassword = false;
let checkName = false;
let checkGender = false;
let checkEmail = false;
let checkPhoneNum = false;
let checkNickname = false;

function enableSubmit() {
	if (checkId && checkPassword && checkName && checkGender && checkEmail && checkPhoneNum && checkNickname) {
		$("#signupSubmit").removeAttr("disabled");
	} else {
		$("#signupSubmit").attr("disabled", "");
	}
}

// id 중복확인 버튼이 클릭되면
$("#checkIdBtn").click(function() {
	const userid = $("#inputId").val();
	// 입력한 ID와 ajax 요청 보내서
	$.ajax("/member/checkId/" + userid, {
		success: function(data) {

			if (data.available) {
				// 사용 가능하다는 메세지 출력
				$("#availableIdMessage").removeClass("d-none");
				$("#notAvailableIdMessage").addClass("d-none");
				checkId = true;
			} else {
				// 사용 가능하지 않다는 메세지 출력
				$("#availableIdMessage").addClass("d-none");
				$("#notAvailableIdMessage").removeClass("d-none");
				checkId = false;
			}
		},
		complete: enableSubmit
	})
});

// 패스워드 입력칸의 값과 패스워드 확인칸 값
$("#inputPassword, #inputPasswordCheck").keyup(function(){
	const pw1 = $("#inputPassword").val();
	const pw2 = $("#inputPasswordCheck").val();
	
//  pw1과 pw2의 값이 같다면
	if(pw1 == pw2){
		$("#passwordSuccessText").removeClass("d-none");
		$("#passwordFailText").addClass("d-none");
		checkPassword = true;
	}
	else{
		$("#passwordSuccessText").addClass("d-none");
		$("#passwordFailText").removeClass("d-none");
		checkPassword = false;
	}
	complete: enableSubmit
})

$("#checkNameBtn").click(function(){
	checkName = true;
	enableSubmit(); 
})

$("#inputGenderM").change(function(){
	checkGender = true;
	enableSubmit(); 
})

$("#inputGenderW").change(function(){
	checkGender = true;
	enableSubmit(); 
})

$("#inputGenderX").change(function(){
	checkGender = true;
	enableSubmit(); 
})

$("#checkEmailBtn").click(function(){
	checkEmail = true;
	enableSubmit(); 
})

// 핸드폰 번호 중복확인 버튼이 클릭되면
$("#checkPhoneNumBtn").click(function() {
	const userphoneNum = $("#inputPhoneNum").val();
	// 입력한 ID와 ajax 요청 보내서
	$.ajax("/member/checkPhoneNum/" + userphoneNum, {
		success: function(data) {

			if (data.available) {
				// 사용 가능하다는 메세지 출력
				$("#availablePhoneNumMessage").removeClass("d-none");
				$("#notAvailablePhoneNumMessage").addClass("d-none");
				checkPhoneNum = true;
			} else {
				// 사용 가능하지 않다는 메세지 출력
				$("#availablePhoneNumMessage").addClass("d-none");
				$("#notAvailablePhoneNumMessage").removeClass("d-none");
				checkPhoneNum = false;
			}
		},
		complete: enableSubmit
	})
});

// 별명 중복확인 버튼이 클릭되면
$("#checkNicknameBtn").click(function() {
	const usernickName = $("#inputNickName").val();
	// 입력한 ID와 ajax 요청 보내서
	$.ajax("/member/checkNickName/" + usernickName, {
		success: function(data) {

			if (data.available) {
				// 사용 가능하다는 메세지 출력
				$("#availableNicknameMessage").removeClass("d-none");
				$("#notAvailableNicknameMessage").addClass("d-none");
				checkNickname = true;
			} else {
				// 사용 가능하지 않다는 메세지 출력
				$("#availableNicknameMessage").addClass("d-none");
				$("#notAvailableNicknameMessage").removeClass("d-none");
				checkNickname = false;
			}
		},
		complete: enableSubmit
	})
});

$("#inputId").keyup(function(){
	checkId = false;
	$("#availableIdMessage").addClass("d-none");
	$("#notAvailableIdMessage").addClass("d-none");
	enableSubmit(); 
})

$("#inputPassword").keyup(function(){
	checkPassword = false;
	$("#passwordSuccessText").addClass("d-none");
	$("#passwordFailText").addClass("d-none");
	enableSubmit(); 
})

$("#inputName").keyup(function(){
	checkName = false;
	enableSubmit(); 
})

// email 인풋에 키보드 입력 발생시
$("#inputEmail").keyup(function() {
	// 이메일 중복확인 다시
	checkEmail = false;
	// submit 버튼 비활성화
	enableSubmit();
})

// 핸드폰 번호 input에 키보드 입력 발생시
$("#inputPhoneNum").keyup(function() {
	// 별명 중복확인 다시
	checkPhoneNum = false;
	$("#availableNicknameMessage").addClass("d-none");
	$("#notAvailableNicknameMessage").addClass("d-none");
	// submit 버튼 비활성화
	enableSubmit();
})

// nickName input에 키보드 입력 발생시
$("#inputNickName").keyup(function() {
	// 별명 중복확인 다시
	checkNickname = false;
	$("#availablePhoneNumMessage").addClass("d-none");
	$("#notAvailablePhoneNumMessage").addClass("d-none");
	// submit 버튼 비활성화
	enableSubmit();
})


