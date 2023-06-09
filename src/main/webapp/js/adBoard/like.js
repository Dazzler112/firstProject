$("#likeIcon").click(function(){
	 
	 const boardId = $("#boardIdText").text().trim();
	 const data ={boardId};
	 console.log($("#inputId"));
	 console.log(data);
	 
	$.ajax("/like",{
		method:"post",
		contentType: "application/json",
		data: JSON.stringify(data),
		
		
	});
});