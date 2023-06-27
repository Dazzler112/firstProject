<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
   width: 1000px; /* 콘텐츠 영역의 폭을 고정 값으로 설정 */
     margin: 0 auto; /* 가운데 정렬 */
}
#category_div-div {
   margin: 15px 0px;
}

.add-writer-botton{
   font-weight: 600;
   background-color: #B0B3BE;
   border: none;
   border-radius: 6px;
   padding: 8px;
   color: white;
}
.cancle-writer-botton{
   font-weight: 600;
   background-color: red;
   border: none;
   border-radius: 6px;
   padding: 8px;
   color: white;
   text-decoration: none;
}
</style>
</head>
<body>
   <my:navBar></my:navBar>
   <my:alert></my:alert>
   <div class="container-lg" style="padding: 0em 4em;">
      <div class="row justify-content-center">
         <div class="col-10 col-md-12 col-lg-14">
            <form action="" method="post" enctype="multipart/form-data">
               <div id="category_div-div" >
               <span class="category_title" style="font-weight: 600;">카테고리</span><select name="boardCategory">
               <option value="동네질문"> 동네질문
               <option value="동네사건사고"> 동네사건사고
               <option value="동네맛집"> 동네맛집
               <option value="동네소식"> 동네소식
               <option value="생활정보"> 생활정보
               <option value="취미생활"> 취미생활
               <option value="일상"> 일상
               <option value="분실"> 분실
               <option value="해주세요"> 해주세요
               </select>
               </div>
               <div class="mb-3">
               <label for="add-title" class="form-label"></label><span style="font-weight: 600;">제목</span>
               <input id="add-title" type="text"  class="form-control" name="title" value="${getBoard.title}"/>
               </div>
               <div class="mb-3">
               <label for="add-body" class="form-label"></label><span style="font-weight: 600;">본문</span>
               <textarea rows="10" id="add-body" class="form-control" name="body" >${getBoard.body }</textarea>
               </div>
               <div class="mb-3">
                  <label for="add-file" class="form-label"></label><span style="font-weight: 600;">사진</span>
                  <input id="add-file" class="form-control" type="file"  name="fileList" accept="image/*" multiple/>
               </div>
               <div class="mb-3" style="display: none;">
               <input id="add-sort" type="text"  class="form-control" name="sort" value="freeboard" readonly/>
               </div>      
               <button class="add-writer-botton">글쓰기</button>
               <a href="/freeboard/freelist" class="cancle-writer-botton" style="margin: 0px 0px 0px 10px;">취소</a>
            </form>
         </div>
      </div>
   </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>