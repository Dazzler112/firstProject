<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
   integrity="sha512-t4GWSVZO1eC8BM339Xd7Uphw5s17a86tIZIj8qRxhnKub6WoyhnrxeCIMeAqBPgdZGlCcG2PrZjMc+Wr78+5Xg=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
   crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<style>
.maincontent {
   justify-content: center;
   display: flex;
   padding-top: 70px;
   margin-left: 100px;
   margin-right: 200px;
   width: 1390px;
}

.leftphoto {
   float: left;
   width: 600px;
   margin-left: auto;
   margin-right: auto;
   display: flex;
}

.rightcontent {
   float: right;
   width: 710px;
}

.table {
   float: right;
   width: 710px;
}

.tit1 {
   width: 710px;
}

.tit2 {
   width: 710px;
}

.titletext {
   float: right;
   width: 710px;
}

.text1 {
   font-size: small;
}

.uprmovbutton {
   float: right;
}

.likeIconNumber {
   float: right;
}

.form-control {
   width:1390px;
   
}
.commentbox{
   justify-content: center;
   display: flex; 
   flex-direction:row;
   
}
.form-control1{
   width:100%;
}
. box{
   margin-left: auto;
   margin-right: auto;
   display: flex;
   width: 1390px;
   height: 100%;
   flex-wrap: wrap;
}
</style>
<body>
   <my:navBar></my:navBar>
   <div style="display: none;">
      <span id="boardIdText">${product.id }</span>
   </div>
   <div class="toast-container position-fixed top-0 end-0 p-3">
      <div id="liveToast" class="toast" role="alert" aria-live="assertive"
         aria-atomic="true">
         <div class="toast-header">
            <button type="button" class="btn-close" data-bs-dismiss="toast"
               aria-label="Close"></button>
         </div>
         <div class="toast-body">로그인 후 이용해주세요.</div>
      </div>
   </div>
   <div class="maincontent">
      <!-- 사진 들어감 -->
      <div class="leftphoto">
         <div class="mb-3">
            <img style="width: 600px; height: 450px;"
               class="img-thumbnail img-fluid"
               src="${bucketUrl }/${list[0].id }/${list[0].photoTitle}" alt="" />
         </div>
      </div>
      <!-- 게시물번호 테이블 내용 등 -->
      <div class="rightcontent">
         <div class="title">
            <c:forEach items="${list}" var="product">
               <h1>
                  <span id="productIdText"> ${product.id } </span> 번 게시물
                  <div class="likeIconNumber">
                     <span id="likeIcon"><i class="fa-regular fa-heart"></i></span>
                     <span id="likeNumber"> ${product.likeCount } </span>
                     
                  </div>
               </h1>

               

            </c:forEach>
         </div>
      <div>







            <div class="head">
               <c:forEach items="${list}" var="product">
                  <h2>${product.price }<span class="text1">원  
                  <a style="float:right;margin-left:15px;" id="chatBtn" class="btn btn-secondary" href="/SecondStop/list4">목록으로</a>   
                  <a style="float:right;" id="chatBtn" class="btn btn-success" href="/chat">채팅하기</a></span>
                  </h2>
                  
                  <input class="tit1" type="text" value="${product.title }" 
                  />
                  
                  <input class="tit2" type="text"
                     value="작성자 : ${product.memberId}  |  ${product.inserted} |  카테고리 : ${product.categoryName}  |  주소 : ${product.address}"
                     readonly />
                  
               </c:forEach>
               
               
            </div>





         </div>

         <div class="mb-2">
            <label for="contentTextarea" class="form-label"></label>
            <textarea rows="10" id="contentTextarea" class="form-control1"
               name="content">${list[0].body }</textarea>
               
               


            <div class="d-none">
               <form action="/remove" method="post" id="removeForm">
                  <input id="inputId" type="text" name="id" value="${product.id }" />
               </form>
            </div>

         </div>
         <c:forEach items="${list}" var="product">
         <div class="uprmovbutton">
                  <sec:authorize access="authentication.name eq #product.memberId">
                     <form action="/SecondStop/remove" method="post">
                        <a style="color: black; margin-left:30px; text-decoration: none;"
                           href="/SecondStop/update/${product.id}">수정</a> <input
                           type="hidden" name="id" value="${product.id}">
                        <button style="border:none; background-color:transparent;" type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button>
                     </form>
                  </sec:authorize>
               </div>
               </c:forEach>




      </div>

      
      
      
   </div>
   
   

   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src="/js/freeboard/comment.js" type="text/javascript"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
      integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src="/js/product/like.js"></script>

</body>
</html>