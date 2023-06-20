const toast = new bootstrap.Toast(doucument.querySelecter("#liveToast"))

$("#likeIcon").click(function(){
	 
	 const productId = $("#productIdText").text().trim();
	 const data ={productId};
	$.ajax("/like",{
		method:"post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		success: function(data){
			if(data.like) {
				 $("#likeIcon").html(`<i class="fa-solid fa-heart"></i>`);
			}else{
				$("#likeIcon").html(`<i class="fa-regular fa-heart"></i>`);
			}
		},
		error : function(jqXHR) {
			// console.log("좋아요 실패");
			// console.log(jqXHR);
			// console.log(jqXHR.responseJSON);
			// $("body").prepend(jqXHR.responseJSON.message);
			$(".toast-body").text(jqXHR.resonseJSON.message);
			toast.show();
		},
	});
});