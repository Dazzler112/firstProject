listComment();

$("#sendCommentBtn").click(function() {
	const boardId = $("#boardIdText").text().trim();
	const content = $("#commentTextArea").val();
	const data = { boardId, content };

	$.ajax("/ptComment/add", {
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
	$.ajax("/ptComment/update", {
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
	$.ajax("/ptComment/list?board=" + boardId, {
		method: "get",
		success: function(comments) {
			$("#commentListContainer").empty();
			for (const ptComment of comments) {
				$("#commentListContainer").append(`
				<div>
					<button
						id="commentDeleteBtn${ptComment.id}"
						class="commentDleteButton"
						data-comment-id="${ptComment.id}">삭제</button>
					:
					<button
						id="commentUpdateBtn${ptComment.id}"
						class="commentUpdateButton"
						data-comment-id="${ptComment.id}">수정</button>
					: ${ptComment.content} 
					: ${ptComment.memberId} 
					: ${ptComment.inserted}
				</div>
			`);
			};
			$(".commentUpdateButton").click(function() {
				const id = $(this).attr("data-comment-id");
				$.ajax("/ptComment/id/" + id, {
					success: function(data) {
						$("#commentUpdateIdInput").val(data.id);
						$("#commentUpdateTextArea").val(data.content);
					}
				})
			});

			$(".commentDleteButton").click(function() {
				const commentId = $(this).attr("data-comment-id");
				$.ajax("/ptComment/id/" + commentId, {
					method: "delete",
					complete: function() {
						listComment();
					}
				});
			})

		}
	});
}











