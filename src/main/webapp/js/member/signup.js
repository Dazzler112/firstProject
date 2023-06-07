let checkId = false;
let checkEmail = false;
let checkNickname = false;
let checkPassword = false;
let checkPhoneNum = false;


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
//		complete: enableSubmit
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
//		complete: enableSubmit
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
//		complete: enableSubmit
	})
});