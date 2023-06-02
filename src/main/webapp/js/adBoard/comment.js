const boardId = $("#boardIdText").text().trim();
$.ajax("/adComment/list?board=" + boardId,{
	method: "get",
	success: function(data){
		console.log(data);
	}
});