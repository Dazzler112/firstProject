listComment();

$("#sendCommentBtn").click(function() {
	const boardId = $("#boardIdText").text().trim();
	const content = $("#commentTextArea").val();
	const data = { boardId, content };

	$.ajax("/adComment/add", {
		method: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		complete: function(jqXHR) {
			listComment();
			$(".toast-body").text(jqXHR.responseJSON.message);
			toast.show();
		}
	});
})

$("#updateCommentBtn").click(function(){
	const commentId = $("#commentUpdateIdInput").val();
	const content = $("#commentUpdateTextArea").val();
	const data = {
		id : commentId,
		content : content
	}
	$.ajax("/adComment/update", {
		method: "put",
		contentType: "application/json",
		data: JSON.stringify(data),
		complete: function(){
			listComment();
		}
	})
})

function listComment() {
	const boardId = $("#boardIdText").text().trim();
	$.ajax("/adComment/list?board=" + boardId, {
		method: "get",
		success: function(comments) {
			$("#commentListContainer").empty();
			for (const adComment of comments) {
				$("#commentListContainer").append(`
				<div>
					<button
						id="commentDeleteBtn${adComment.id}"
						class="commentDleteButton"
						data-comment-id="${adComment.id}">삭제</button>
					:
					<button
						id="commentUpdateBtn${adComment.id}"
						class="commentUpdateButton"
						data-comment-id="${adComment.id}">수정</button>
					: ${adComment.content} 
					: ${adComment.memberId} 
					: ${adComment.inserted}
				</div>
			`);
			};
			$(".commentUpdateButton").click(function() {
				const id = $(this).attr("data-comment-id");
				$.ajax("/adComment/id/" + id, {
					success: function(data) {
						$("#commentUpdateIdInput").val(data.id);
						$("#commentUpdateTextArea").val(data.content);
					}
				})
			});

			$(".commentDleteButton").click(function() {
				const commentId = $(this).attr("data-comment-id");
				$.ajax("/adComment/id/" + commentId, {
					method: "delete",
					complete: function() {
						listComment();
					}
				});
			})

		}
	});
}











