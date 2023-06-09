$("#likeIcon").click(function(){
	 
	 const boardId = $("#inputId").val();
	 const data ={boardId};
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
			$("#likeNumber").text(data.count);
		}
	});
});