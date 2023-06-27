<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SecondStop</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body{
   margin: 0em 1em;
   width: 1200px; /* 콘텐츠 영역의 폭을 고정 값으로 설정 */
     margin: 0 auto; /* 가운데 정렬 */
}
a {
   text-decoration: none;
}
.list-title{
   padding: 10px 0px;
}

.list-title > h1{
   display:flex;
   justify-content: center;
   margin: 10px 0px 20px 0px;
   font-weight: 600;
}
/* 글쓰기버튼 css */
.writer_link-color {
   color: rgba(0, 0, 0, 0.5);
   font-size: 28px;
}

.board_writer-icon {
   display: flex;
   justify-content: center;
   align-items: center;
   background-color: #FFDAB9;
   padding: 16px;
   border-radius: 50%;
}

.div_writer {
   margin-bottom: 50px;
   margin-right: 30px;
   position: fixed;
   bottom: 0;
   right: 0;
   margin: 0px, 30px, 30px, 0px;
}
/* ============================= */

/* 테이블 공용*/

table>thead>tr>th {
   padding: 10px;
   border-bottom: 1px solid #ccc;
   border-top: 2px solid green;
}

table>tbody>tr>td {
   padding: 10px;
   border-bottom: 1px solid #ccc;
}

/*==============================*/

/* 사진카운팅 css */
.title-column{
   display: flex;
    align-items:center;
}
.image-icon{
   display:flex;
   justify-content:center;
    align-items:center;
   margin: 0px 7px 0px 0px;
   padding: 4px;
   background-color: #378D62;
   border-radius: 50%;
   color: white;
   opacity: 0.75;
   font-size: 14px;
}
/*===============================*/

.comment_column {
   border: 0.5px solid rgba(0, 0, 0, 0.1);
   margin: 0px 3.5px 0px 0px;
   padding: 1px 2.5px 1px 2.5px;
   background-color: #f8f9fa;
   border-radius: 7px;
   color: #A1959C;
}

#category_div {
   display: flex;
   justify-content: center;
   align-items: center;
   margin: 15px 0px;
}

.category_button {
   margin: 0px 8px;
   padding: 7px;
   border-radius: 8px;
   border: none;
   font-weight: 600;
   background: #F0F0F0;
   transition: 0.3s background-color ease-in;
}

.category_button:hover {
   background-color: #DDDDDD;
}
</style>
</head>
<body>
   <my:navBar></my:navBar>
   <div style="padding: 0em 4em;">
            <div class="list-title">
            <h1>자유 게시판</h1>
            </div>
   <form id="categoryForm" action="" method="get"></form>
   <div id="category_div">
      <input type="button" class="category_button" name="boardCategory" value="동네질문" />
      <input type="button" class="category_button" name="boardCategory" value="동네사건사고" /> 
      <input type="button" class="category_button" name="boardCategory" value="동네맛집" /> 
      <input type="button" class="category_button" name="boardCategory" value="동네소식" /> 
      <input type="button" class="category_button" name="boardCategory" value="생활정보" /> 
      <input type="button" class="category_button" name="boardCategory" value="취미생활" /> 
      <input type="button" class="category_button" name="boardCategory" value="일상" /> 
      <input type="button" class="category_button" name="boardCategory" value="분실" /> 
      <input type="button" class="category_button" name="boardCategory" value="해주세요" />
   </div>
   <div class="container-lg">
      <div class="row justify-content-center">
         <div class="col-10 col-md-12 col-lg-14">
            <table id="boardTable" class="table">
               <thead>
                  <tr>
                     <th style="display: none;">게시번호</th>
                     <th style="width: 10%;">카테고리</th>
                     <th style="width: 20%;">지역</th>
                     <th style="width: 40%;">제목</th>
                     <th style="width: 5%;">공감</th>
                     <th style="width: 10%;">작성자</th>
                     <th style="width: 15%;">작성일</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach items="${boardList}" var="board">
                     <tr>
                        <td style="display: none;">${board.id }</td>
                        <td style="width: 10%;"> ${board.boardCategory }</td>
                        <td style="width: 20%;">${board.addressSggNm }</td>
                        <td style="width: 40%">
                        <%-- <c:if test="${board.fileCount > 0 }">
                        <div class="title-column">
                           <div class="image_column">
                              <span class="image-icon"> 
                              <i class="fa-regular fa-image"></i>
                              </span>
                           </div>
                        </c:if>  --%>
                        <div style="display: flex;">
                        <c:choose>
                          <c:when test="${board.fileCount > 0 }">
                            <div class="title-column">
                             <div class="image_column">
                               <span class="image-icon"> 
                                  <i class="fa-regular fa-image"></i>
                               </span>
                             </div>
                            </div>
                          </c:when>
                          <c:when test="${board.fileCount eq 0 }">
                          <div class="title-column">
                              <span style="opacity: 0.4; margin-right: 7px;">
                              <i class="fa-solid fa-comment-dots" style="font-size: 20px;"></i>
                            </span>
                          </div>
                          </c:when>
                         </c:choose>
                           
                        <a href="/freeboard/id/${board.id}" style="margin-right: 8px;">${board.title }</a> 
                           <c:if test="${board.commentCount > 0 }">
                              <span class="comment_column"> 
                               <i class="fa-solid fa-comment-dots"></i> ${board.commentCount }
                              </span>
                           </c:if> 
                           </div>
                           </div>
                           </td>
                        <td style="width: 5%;"><i style="color: #DEBFD1; opacity: 0.5;" class="fa-solid fa-heart"></i>${board.likeCount }</td>
                        <td style="width: 10%;">${board.writer }</td>
                        <td style="width: 15%;">${board.inserted }</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div>
   </div>


   <!-- pagenation -->
   <div class="container-lg" style="margin-top: 20px;">
      <div class="row">
         <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
               <!-- 처음버튼 -->
               <c:if test="${pageInfo.thisPage ne 1 }">
                  <c:url value="/freeboard/freelist" var="freepageLink">
                     <c:param name="page" value="${pageInfo.thisPage -1 }" />
                     <c:if test="${not empty param.search }">
                        <c:param name="search" value="${param.search }" />
                     </c:if>
                     <!-- 처음버튼 눌러도 검색값 변하지 않게 하기 -->
                     <c:if test="${not empty param.type }">
                        <c:param name="type" value="${param.type }" />
                     </c:if>
                     <c:if test="${not empty param.boardCategory }">
                        <c:param name="boardCategory" value="${param.boardCategory }" />
                     </c:if>
                  </c:url>
                  <li class="page-item"><a class="page-link" href="${freepageLink }"> <i class="fa-solid fa-angles-left"></i>
                  </a></li>
               </c:if>

               <!-- 이전버튼 -->
               <c:if test="${pageInfo.thisPage gt 1 }">
                  <!--1보다 클때 라고 해도 됨  -->
                  <!-- 이전버튼 : {pageInfo.currentPageNum -1 } -->
                  <my:freepageitem freePageNum="${pageInfo.thisPage -1}">
                     <i class="fa-solid fa-angle-left"></i>
                  </my:freepageitem>
               </c:if>

               <c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="freePageNum">
                  <my:freepageitem freePageNum="${freePageNum }">
                  ${freePageNum }
                  </my:freepageitem>
               </c:forEach>

               <!-- 다음 버튼 -->
               <c:if test="${pageInfo.thisPage lt pageInfo.lastPageNumber }">
                  <!-- 페이지 번호 : ${pageInfo.currentPageNum + 1 } -->
                  <my:freepageitem freePageNum="${pageInfo.thisPage + 1}">

                     <i class="fa-solid fa-angle-right"></i>
                  </my:freepageitem>
               </c:if>
               <!-- 마지막 버튼 -->
               <c:if test="${pageInfo.thisPage lt pageInfo.lastPageNumber }">
                  <c:url value="/freeboard/freelist" var="freepageLink">
                     <c:param name="page" value="${pageInfo.lastPageNumber}" />
                     <c:if test="${not empty param.search }">
                        <c:param name="search" value="${param.search }" />
                     </c:if>
                     <c:if test="${not empty param.type }">
                        <c:param name="type" value="${param.type }" />
                     </c:if>
                     <c:if test="${not empty param.boardCategory }">
                        <c:param name="boardCategory" value="${param.boardCategory }" />
                     </c:if>
                  </c:url>
                  <li class="page-item"><a class="page-link" href="${freepageLink }"> <i class="fa-solid fa-angles-right"></i>
                  </a></li>
               </c:if>


            </ul>
         </nav>
      </div>
   </div>

   <my:freesearch></my:freesearch>


   <div class="div_writer">
      <a href="/freeboard/freeadd" class="writer_link-color">
         <div class="board_writer-icon">
            <i class="fa-solid fa-pen-to-square"></i>
         </div>
      </a>
   </div>
   
   </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src="/js/freeboard/category.js"></script>
</body>
</html>