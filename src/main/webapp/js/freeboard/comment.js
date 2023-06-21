//===================================================================
let select = true
//===================================================================


listComment();

$("#sendCommentBtn").click(function() {
	const boardId = $("#boardIdText").text().trim();
	const content = $("#commentTextArea").val();
	const data = { boardId, content };

	$.ajax("/comment/add", {
		method: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		complete: function() {
			listComment();

			$("#commentTextArea").val("");
		}
	})
});


$("#commentListContainer").on("click", ".update-commit", function() {
	const commentId = $(this).attr("data-comment-id");
	const commentUpdateFormContainer = $(`#commentUpdateFormContainer${commentId}`);
	const commentUpdateTextArea = $(`#commentUpdateTextArea${commentId}`);
	const content = commentUpdateTextArea.val();
	const data = {
		id: commentId,
		content: content
	};

	$.ajax("/comment/update", {
		method: "put",
		contentType: "application/json",
		data: JSON.stringify(data),
		complete: function() {
			listComment();
			commentUpdateFormContainer.hide(); // 수정 폼 숨기기
			commentUpdateTextArea.val(""); // 수정된 내용 초기화
		}
	});
});




//수정 get후 전송
/*   $("#commentUpdateBtn").click(function() {
		const commentId = $("#inputIdUpdate").val();
		const content = $("#commentUpdateTextArea").val();
		const data = {
			id: commentId,
			content: content
		};

		$.ajax("/comment/update", {
			method: "put",
			contentType: "application/json",
			data: JSON.stringify(data),
			complete: function() {
				listComment();
			}
		});
	});*/


function listComment() {

	const boardId = $("#boardIdText").text().trim();
	const depth = $("#depthText").val();
	const data = { boardId, depth };
			$.ajax("/comment/list?board=" + boardId, {
		method: "post",
				success: function(comments) {
					$("#commentListContainer").empty();
					for (const comment of comments) {
						const editBtn = `
				<button 
						id="commentDeleteBtn${comment.id}" 
						class="commentDeleteButton"
						style="background-color: red; border:none; border-radius:5px; color:rgba(0,0,0,0.3); background-color:rgba(0,0,0,0);"
						data-comment-id="${comment.id}">
							<i class="fa-regular fa-trash-can"></i>
						</button>
					<button
						id="commentUpdateBtn${comment.id}"
						class="commentUpdateButton"
						style="background-color: #FFCF96; border:none; border-radius:5px; color:rgba(0,0,0,0.8); background-color:rgba(0,0,0,0);"
						data-comment-id="${comment.id}">
							<i class="fa-solid fa-repeat"></i>
						</button>
					
			`;

						$("#commentListContainer").append(`
					<li style="margin:5px 0px; padding:3px 7px;">
					<div>
						<div class="user_name">${comment.memberId}</div>
						<div class="user_text">${comment.content}</div>
						<div style="font-size:14px; color:rgba(0,0,0,0.3);">${comment.inserted}</div>
					</div>
						<div>
						${comment.editable ? editBtn : ''}
						<button id="commentReplyBtn${comment.id}"
						 class="commentReplyButton"
						 data-comment-id="${comment.id}"
						 style="background-color: #FFCF96; border:none; border-radius:5px; color:rgba(0,0,0,0.8); background-color:rgba(0,0,0,0);">
						 <i class="fa-solid fa-reply">!대댓글!</i>
						</button>
						</div>
						
					</li>
					<div id="commentReplyFormContainer${comment.id}" style="display: none; margin:0px 0px 0px 15px;">
					<input type="hidden" id="inputIdUpdate"/>
       			 	<textarea id="commentReplyContent${comment.id}" rows="3" cols="50"></textarea>
        			<button class="commentReplySubmitBtn" data-comment-id="${comment.id}">댓글 등록</button>
    				</div>
    				
    			  <div id="commentUpdateFormContainer${comment.id}" style="display:none; align-items: center; margin:0px 0px 0px 15px;">
                  <textarea id="commentUpdateTextArea${comment.id}" class="update_comment-text" placeholder="내용을 입력해주세요"></textarea>
                  <button id="updateCommentBtn" class="update-commit" data-comment-id="${comment.id}" style="">수정</button>
                  </div>
				`);
					};

					//대댓글 클릭 상호작용	
					$(".commentReplyButton").click(function() {
						const commentId = $(this).data("comment-id");
						$(`#commentReplyFormContainer${commentId}`).toggle();
					});

					//대댓글 클릭시 대댓글 작성
					$(".commentReplySubmitBtn").click(function() {
						const boardId = $("#boardIdText").text().trim();
						const commentId = $(this).attr("data-comment-id");
						const content = $(`#commentReplyContent${commentId}`).val();
						const data = { boardId, commentId, content };

						$.ajax("/comment/addReply", {
							method: "post",
							contentType: "application/json",
							data: JSON.stringify(data),
							complete: function() {
								listComment();
							}
						});
					});


					//댓글수 반응	
					const commentCount = comments.length;
					$("#comment_counting-cnt").text("댓글수 " + commentCount);

					//삭제버튼 상호작용
					$(".commentDeleteButton").click(function() {
						const commentId = $(this).attr("data-comment-id");
						$.ajax("/comment/id/" + commentId, {
							method: "delete",
							complete: function() {
								listComment();
							}
						})
					});



					// 다른 수정 폼은 숨기기
					/*$(".commentUpdateButton").not(this).each(function() {
						const otherCommentId = $(this).attr("data-comment-id");
						if (otherCommentId !== commentId) {
							$(`#commentUpdateFormContainer${otherCommentId}`).hide();
						}
					});
*/

				}
			});
		
}
// 수정 버튼 상호작용 (수정 부분 추가)
$("#commentListContainer").on("click", ".commentUpdateButton", function() {
	const commentId = $(this).attr("data-comment-id");
	const commentUpdateFormContainer = $(`#commentUpdateFormContainer${commentId}`);
	const commentUpdateTextArea = $(`#commentUpdateTextArea${commentId}`);

	if (commentUpdateFormContainer.is(":visible")) {
		commentUpdateFormContainer.hide();
	} else {
		commentUpdateFormContainer.show();

		// Ajax로 이전 댓글 내용을 가져와서 textarea에 표시
		$.ajax("/comment/id/" + commentId, {
			success: function(data) {
				commentUpdateTextArea.val(data.content);
				// 수정 폼을 가운데 정렬하기
				commentUpdateFormContainer.css({
					"display": "flex",
					"justify-content": "center"
				});
			}
		});
	}
});


//==================================================================
//삭제 수정 버튼
$('#button-list').click(() => {
	const hideDiv = document.querySelector('#button-hide');
	
	if (select == true) {
		hideDiv.style.display = 'block';
		select = false;
	} else {
		hideDiv.style.display = 'none';
		select = true;
	}
});