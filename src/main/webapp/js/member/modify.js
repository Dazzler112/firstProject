let checkEmail = true;
let checkNickName = true;
let checkPassword = true;

$("#inputPassword, #inputPasswordCheck").keyup(function() {
	const pw1 = $("#inputPassword").val();
	const pw2 = $("#inputPasswordCheck").val();

	if (pw1 === pw2) {
		$("#modifyButton").removeClass("disabled");
		$("#passwordSuccessText").removeClass("d-none");
		$("#passwordFailText").addClass("d-none");
		checkPassword = true;
	} else {
		$("#modifyButton").addClass("disabled");
		$("#passwordSuccessText").addClass("d-none");
		$("#passwordFailText").removeClass("d-none");
		checkPassword = false;
	}

//	enableSubmit();
});

$("#inputNickName").keyup(function(){
	checkNickName = false;
	$("#availableNickNameMessage").addClass("d-none");
	$("#notAvailableNickNameMessage").addClass("d-none");
//	enableSubmit();
})

// 별명 중복확인버튼 클릭 시
$("#checkNickNameBtn").click(function() {
	const nickName = $("#inputNickName").val();
	
	$.ajax("/member/checkNickName/" + nickName, {
		success: function(data) {
			// `{"available" : true}`
			if (data.available) {
				// 사용가능하다는 메세지 출력
				$("#availableNickNameMessage").removeClass("d-none");
				$("#notAvailableNickNameMessage").addClass("d-none");
				// 중복확인 되었다는 표시 
				checkNickName = true;
			} else {
				// 사용 불가능하다는 메세지 출력
				$("#availableNickNameMessage").addClass("d-none");
				$("#notAvailableNickNameMessage").removeClass("d-none");
				// 중복확인 안되었다는 표시
				checkNickName = false
			}
		},
//		complete: enableSubmit 
	});
});