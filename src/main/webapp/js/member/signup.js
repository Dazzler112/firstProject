let checkId = false;
let checkEmail = false;
let checkNickname = false;
let checkPassword = false;


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