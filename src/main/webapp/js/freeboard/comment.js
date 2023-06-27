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
            method: "get",
            contentType: "application/json",
            success: function(comments) {
               const commentListContainer = document.getElementById("commentListContainer");
               commentListContainer.innerHTML = '';
               for (const comment of comments) {
                  const editBtn = `
            <button 
                  id="commentDeleteBtn${comment.id}" 
                  class="commentDeleteButton"
                  data-comment-id="${comment.id}">
                     <i class="fa-regular fa-trash-can"></i>
                  </button>
               <button
                  id="commentUpdateBtn${comment.id}"
                  class="commentUpdateButton"
                  data-comment-id="${comment.id}">
                     <i class="fa-solid fa-repeat"></i>
                  </button>
               
         `;
         
         const reReplyBtn = `
                  <button id="commentReplyBtn${comment.id}"
                   class="commentReplyButton"
                   data-comment-id="${comment.id}">
                   <i class="fa-brands fa-replyd" style="font-size:24px; color:rgba(0,0,0,0.5);"></i>
                  </button>
         `;
         const replyStyle=`
            <div class="reply-container" style=" padding:10px 7px 10px 7px; border-bottom: 1px solid rgba(0,0,0,0.2);">
                  <div class="container-top">
                  <span class="user_name">${comment.memberId}</span>
                  <span class="inserted-column" style="font-size:14px; color:rgba(0,0,0,0.3);">${comment.inserted}</span>
                  </div>
                  <div>
                  <input type="text" class="user_text" value="${comment.content}" readonly>
                  </div>
                  
                  <div style="display:flex; justify-content: space-between; margin-bottom 10px;">
                  <span>
                  ${comment.depth < 1 ? reReplyBtn : ''}
                  </span>
                  <span>
                  ${comment.editable ? editBtn : ''}
                  <span>
                  </div>
               
               <div class="reReply-container"></div>
               
               </div>
               
               
               <div id="commentReplyFormContainer${comment.id}" style="display: none; margin:0px 0px 0px 15px;">
               <input type="hidden" id="inputIdUpdate"/>
                    <input id="commentReplyContent${comment.id}" class="commentReplyContentCL"/>
                 
               <div class="commnetReplyBtnContainer">
                    <p><p>
                 <button class="commentReplySubmitBtn" data-comment-id="${comment.id}">등록</button>
                </div>

                </div>
                
               <div id="commentUpdateFormContainer${comment.id}" style="display:none; justify-content:center; margin:0px 0px 0px 15px;">
                  <input id="commentUpdateTextArea${comment.id}" class="update_comment-text" placeholder="내용을 입력해주세요"/>
                  
                  <div class="commentUptContainer">
                  <p></p>
                  <button id="updateCommentBtn" class="update-commit" data-comment-id="${comment.id}" style="">수정</button>
                  </div>
                  
                  </div>
         `;
         const reReplyStyle = `
            <div class="reply-container" style="padding:10px 7px 10px 35px; border-bottom: 1px solid rgba(0,0,0,0.2);">
                  <div class="container-top">
                  <span class="user_name">${comment.memberId}</span>
                  <span class="inserted-column" style="font-size:14px; color:rgba(0,0,0,0.3);">${comment.inserted}</span>
                  </div>
                  <div>
                  <input type="text" class="user_text" value="${comment.content}" readonly>
                  </div>
                  
                  <div style="display:flex; justify-content: space-between; margin-bottom 10px;">
                  <span>
                  ${comment.depth < 1 ? reReplyBtn : ''}
                  </span>
                  <span>
                  ${comment.editable ? editBtn : ''}
                  <span>
                  </div>
               
               <div class="reReply-container"></div>
               
               </div>
               
               
               <div id="commentReplyFormContainer${comment.id}" style="display: none; margin:0px 0px 0px 15px;">
               <input type="hidden" id="inputIdUpdate"/>
                    <input id="commentReplyContent${comment.id}" class="commentReplyContentCL"/>
                    
                    <div class="commnetReplyBtnContainer">
                    <p><p>
                 <button class="commentReplySubmitBtn" data-comment-id="${comment.id}">등록</button>
                </div>
                
                </div>
                
               <div id="commentUpdateFormContainer${comment.id}" style="display:none; align-items: center; margin:0px 0px 0px 15px;">
                  <input id="commentUpdateTextArea${comment.id}" class="update_comment-text" placeholder="내용을 입력해주세요"/>
                  
                  
                  <div class="commentUptContainer">
                  <p></p>
                  <button id="updateCommentBtn" class="update-commit" data-comment-id="${comment.id}" style="">수정</button>
                  </div>
                  
                  </div>
         `;
                  commentListContainer.innerHTML += `
               ${comment.depth < 1 ? replyStyle : reReplyStyle}
            `;
               };
               //대댓글 리스트?
               function reReply() {
                  const boardId = $("#boardIdText").text().trim();
                  const commentId = $(this).attr("data-comment-id");
                  const content = $(`#commentReplyContent${commentId}`).val();
                  const id = $(this).attr("data-comment-id");
                  const data = { boardId, commentId, content, id };
                  console.log(data);
               $.ajax("/comment/relist?board=" + boardId,{
                  method: "post",
                  contentType: "application/json",
                  data:JSON.stringify(data),
                  success: function(comments){
               let commentListContainer = document.getElementById("commentListContainer");
               commentListContainer.innerHTML = '';
               const res = JSON.parse(comments);
                     for(let comment of res){
                        commentListContainer.innerHTML += `
                           <p>${comment.memberId}</p>
                                    <span>${comment.content}</span>
                        `;
                     }
                     change.html(commentListContainer);
                  }
               });
               }
               
               
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
                  const id = $(this).attr("data-comment-id");
                  const data = { boardId, commentId, content, id };

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