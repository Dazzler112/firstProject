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

$("#updateCommentBtn").click(function() {
	const commentId = $("#commentUpdateIdInput").val();
	const content = $("#commentUpdateTextArea").val();
	const data = {
		id: commentId,
		content: content
	}
	$.ajax("/adComment/update", {
		method: "put",
		contentType: "application/json",
		data: JSON.stringify(data),
		complete: function(jqXHR) {
			listComment();
			$(".toast-body").text(jqXHR.responseJSON.message);
			toast.show();
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
				const editButtons = `					
					<button
						id="commentUpdateBtn${adComment.id}"
						class="commentUpdateButton btn btn-secondary"
						data-bs-toggle="modal" data-bs-target="#commentUpdateModal"
						data-comment-id="${adComment.id}">
							<i class="fa-regular fa-pen-to-square"></i>
					</button>
					<button 
						id="commentDeleteBtn${adComment.id}" 
						class="commentDeleteButton btn btn-danger"
						data-bs-toggle="modal"
						data-bs-target="#deleteCommentConfirmModal"
						data-comment-id="${adComment.id}">
							<i class="fa-regular fa-trash-can"></i>
					</button>
				`;

				// console.log(comment);
				$("#commentListContainer").append(`
					<li class="list-group-item d-flex justify-content-between align-items-start">
						<div class="ms-2 me-auto">
							<span class="fw-bold"> <i class="fa-solid fa-user"></i> ${adComment.memberId}</span>
							<span class="commentInserted">${adComment.inserted}</span>							
							<div style="white-space: pre-wrap;">${adComment.content}</div>
						</div>
						<div>
							
							<div class="text-end mt-2">
								${adComment.editable ? editButtons : ''}
							</div>
						</div>
						
					</li>
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
			$(".commentDeleteButton").click(function() {
				const commentId = $(this).attr("data-comment-id");
				$("#deleteCommentModalButton").attr("data-comment-id", commentId);
			});

		}
	});
}

$("#deleteCommentModalButton").click(function() {
	const commentId = $(this).attr("data-comment-id");
	$.ajax("/adComment/id/" + commentId, {
		method: "delete",
		complete: function(jqXHR) {
			listComment();
			$(".toast-body").text(jqXHR.responseJSON.message);
			toast.show();
		}
	});
});











