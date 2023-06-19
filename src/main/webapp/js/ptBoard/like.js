const toast = new bootstrap.Toast(document.querySelector("#liveToast"));

$("#likeIcon").click(function(){
	 
	 const boardId = $("#boardIdText").text().trim();
	 const data ={boardId};
	 console.log($("#inputId"));
	 console.log(data);
	 
	$.ajax("/ptBoard/like",{
		method:"post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		success: function(data){
			if (data.like) {
				$("#likeIcon").html(`<i class="fa-solid fa-thumbs-up"></i>`);
			} else {
				$("#likeIcon").html(`<i class="fa-regular fa-thumbs-up"></i>`);
				
			}
			$("#likeNumber").text(data.count);
		},
		error: function(jqXHR){
			$(".toast-body").text(jqXHR.responseJSON.message);
			toast.show();
		},
		
		
	});
});