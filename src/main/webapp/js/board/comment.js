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
					
					<div style="margin:5px 0px; padding:3px 7px;">
						${comment.memberId}
						: ${comment.content}
						<button id="commentDeleteBtn${comment.id}" 
						class="commentDelteButton"
						data-comment-id="${comment.id}"
						style="background-color: red; border:none; border-radius:5px; color:rgba(0,0,0,0.3); background-color:rgba(0,0,0,0);">
						<i class="fa-solid fa-trash"></i>
						</button>
							<button id="commentUpdateBtn${comment.id}"
								class="commentUpdateButton"
								data-comment-id="${comment.id}"
								style="background-color: #FFCF96; border:none; border-radius:5px; color:rgba(0,0,0,0.8); background-color:rgba(0,0,0,0);">
							<i class="fa-solid fa-repeat"></i>
							</button>
					</div>
				`);
			};
		//댓글수 반응	
		const commentCount = comments.length;
     	 $("#comment_counting-cnt").text("댓글수 " + commentCount);
			
			//삭제버튼 상호작용
			$(".commentDelteButton").click(function(){
				const commentId = $(this).attr("data-comment-id");
				$.ajax("/comment/id/" + commentId, {
					method:"delete",
					complete: function(){
						listComment();
					}
				})
			});
			//수정버튼 상호작용
			$(".commentUpdateButton").click(function(){
				const id = $(this).attr("data-comment-id");
				$.ajax("/comment/id/" + id, {
					success: function(data){
						$("#commentUpdateIdInput").val(data.id);
						$("#commentUpdateTextArea").val(data.content);
					}
				})
			});
		//수정 get후 전송
		$("#updateCommentBtn").click(function(){
		const commentId = $("#commentUpdateIdInput").val();
		const content = $("#commentUpdateTextArea").val();
		const data = {
			id:commentId,
			content : content
		}
		$.ajax("/comment/update", {
			method: "put",
			contentType:"application/json",
			data:JSON.stringify(data),
			complete: function(){
				listComment();
			}
			});
		})
			
		}
	});
}