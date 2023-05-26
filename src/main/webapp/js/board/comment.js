listComment();

$("#sendCommentBtn").click(function() {
	const boardId = $("#boardIdText").text().trim();
	const content = $("#commentTextArea").val();
	const data = { boardId, content };

	$.ajax("/comment/add", {
		method:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		complete: function(){
			listComment();
		}
	})
});

function listComment(){

const boardId = $("#boardIdText").text().trim();
$.ajax("/comment/list?board=" + boardId, {
	method:"get", 
	success: function(comments){
		$("#commentListContainer").empty();
		for(const comment of comments){
			$("#commentListContainer").append(`
					<div>
						${comment.memberId}
						: ${comment.content} 
					</div>
				`);
			}
		}
	});
}