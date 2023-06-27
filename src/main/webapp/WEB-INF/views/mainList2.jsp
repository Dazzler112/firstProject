<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 메인페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
   rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
   crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

<link rel="stylesheet" href="/resources/mainList1.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</head>
<style>
</style>
<body>

   <my:navBar></my:navBar>

   
   <div class="swiper mySwiper" >
      <h1 style="text-align: left;margin-left:5px;color:#55A44E; margin-bottom:40px; margin-top:20px;">집에서도 할 수 있는 작은 실천!</h1>
         <div class="swiper-wrapper">
            <div class="swiper-slide"><a href=https://earthplogging.com/><img class="mainimg" src="/img/campaign8.jpg" alt=""></a></div>
            <div class="swiper-slide"><a href=https://www.sas.org.uk/><img class="mainimg" src="/img/campaign1.jpg" alt=""></a></div>
            <div class="swiper-slide"><a href=https://www.patagonia.com/stories/dont-buy-this-jacket-black-friday-and-the-new-york-times/story-18615.html>
                                 <img class="mainimg" src="/img/campaign3.jpg"alt=""></a></div>
            <div class="swiper-slide"><a href=https://post.naver.com/viewer/postView.naver?volumeNo=35922195&memberNo=53135705>
                                 <img class="mainimg" src="/img/campaign6.jpg" alt=""></a></div>
            <div class="swiper-slide"><a href=https://www.ehyundai.com/newPortal/EV/EV000003_14_V.do?eventNo=27279&eventCd=B0349900&list_page=&search=&keyword=&eventSearch=&eventSearchDep=&imgLink=/attachfiles/event/20230608125451265.png>
                                 <img class="mainimg" src="/img/campaign7.jpg" alt=""></a></div>
      

         </div>

      </div>
   
   <div class="secontcontent">
      <h1 style="color: #55A44E; margin-bottom: 40px; margin-top: 40px;">중요 공지사항!</h1>
      <table class="table">
         <thead>
            <tr>
               <th>제목</th>
               <th>올린 시간</th>
               <th>내용</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${notice}" var="notice">
               <tr>

                  <td><a href="/notice/noticeId/${notice.id }"> ${notice.title} </a></td>
                  <td>${notice.inserted}</td>
                  <td>${notice.writer}</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>

   <div class="container-lg">
      <br> <br>
      <h2>내가 찜한 상품</h2>
      <div class="box">
      
      
      
         
            
               <c:forEach items="${productList4}" var="product"  begin="0" end="3" step="1">

               <ul class="items">
                  <a href="/SecondStop/exList/${product.id }">
                     <img class="img-thumbnail img-fluid" src="${bucketUrl }/${product.id }/${product.photoTitle}" alt="" />
                        </a>
                  <li class="title">제목 : <a style="color:black;text-decoration:none;" href="/SecondStop/exList/${product.id }"> ${product.title}
                  </a></li>

                  <li class="price">가격 : ${product.price}</li>
                  <li>등록일 :  ${product.inserted}</li>
                  <li>지역 : ${product.address}</li>
                  
                  
               </ul>
            </c:forEach>
         </div>      
               
            
         

         <br>
         <h2 style="color: #55A44E; margin-bottom: 40px;">인기상품</h2>
         <div class="box">


            <div class="clear"></div>
            <c:forEach items="${productList3}" var="product"  begin="0" end="7" step="1">

               <ul class="items">
                  <a href="/SecondStop/exList/${product.id }">
                     <img class="img-thumbnail img-fluid" src="${bucketUrl }/${product.id }/${product.photoTitle}" alt="" />
                        </a>
                  <li class="title">제목 :  <a style="color:black;text-decoration:none;" href="/SecondStop/exList/${product.id }"> ${product.title}
                  </a></li>

                  <li class="price">가격 : ${product.price}</li>
                  <li>등록일 : ${product.inserted}</li>
                  <li>지역 : ${product.address}</li>
                  <li>좋아요 :  <i class="fa-regular fa-heart"></i>${product.count }</li>
                  
               </ul>
            </c:forEach>
            
            


         </div>
         <div class="clear"></div>
      </div>

   </div>

   <script src="/js/navbar/search.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>