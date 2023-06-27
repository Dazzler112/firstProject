
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
   rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
   crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

<link rel="stylesheet" href="/resources/mainList1.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</head>
<style>
.title{
   font-size: 15px;
}
#cotent_box {
   
}

.box {
   margin-left: auto;
   margin-right: auto;
   display: flex;
   width: 1390px;
   height: 100%;
   flex-wrap: wrap;

}



.items {
    padding:0px;
   margin: 40px 20px 40px 30px;
   width: 280px;
   height: 400;
   display: d-flex;
   list-style-type: none;
   
}

.productimg {
   width: 100%;
   height: 200px;
}

.items .title {
   margin-top: 10px;
}

.items price {
   padding-top: 20px;
}

.items like {
   padding-top: 20px;
}



#category_div {
   display: flex;
   justify-content: center;
   align-items: center;
   margin: 15px 0px;
}

.boxcategory {
   justify-content: space-between;
   margin-left: auto;
   margin-right: auto;
   padding-top: 10px;
   display: flex;
   width: 1300px;
}

.compos {
   justify-content: flex-start;
}

.category_button {
   margin: 0px 8px;
   padding: 7px;
   border-radius: 5px;
   border: none;
   font-weight: 600;
   background: #F0F0F0;
   transition: 0.3s background-color ease-in;
}

.category_button:hover {
   background-color: #DDDDDD;
}

</style>
<body>
   <%
      String link = "http://3.35.52.151:8081/SecondStop/list4";
   %>
   
   <my:navBar></my:navBar>
   
   <section id="content_box">
      <form id="categoryForm" action="./categoryList2" method="get"></form>
      <div class="boxcategory">
         <h1 class="compos">카테고리</h1>
         <div id="category_div">
            <input type="submit" class="category_button"  value="패션"  onClick="location.href='<%=link%>?search=패션'"/> 
            <input type="submit" class="category_button"  value="가구" onClick="location.href='<%=link%>?search=가구'"/> 
            <input type="submit" class="category_button"  value="게임" onClick="location.href='<%=link%>?search=게임'"/> 
            <input type="submit" class="category_button"  value="명품" onClick="location.href='<%=link%>?search=명품'"/> 
            <input type="submit" class="category_button"  value="전자기기" onClick="location.href='<%=link%>?search=전자기기'"/> 
            <input type="submit" class="category_button"  value="취미" onClick="location.href='<%=link%>?search=취미'"/> 
            <input type="submit" class="category_button"  value="무료나눔" onClick="location.href='<%=link%>?search=무료나눔'"/>
            <!-- http://localhost:8084/teamProject/list4?category=1025453  -->
            <!-- http://localhost:8084/teamProject/list4/category/1025453 -->
         </div>
      </div>

      
      <div class="box">
         
         <c:forEach items="${CategoryList}" var="product">
            
            
            
               
               <ul class="items">
               
                  <a href="/SecondStop/exList/${product.id }">
                     <img class="img-thumbnail img-fluid" src="${bucketUrl }/${product.id }/${product.photoTitle}" alt="" />
                        </a>
                  <li class="title"><a > No. ${product.id }</a> <a style="float:right">${product.title}</a></li>
                  <li class="price"><a style="font-size: 30px;">${product.price}원</a></li>
                  
                  <li>지역 : ${product.address} | 카테고리 : ${product.categoryName} <a style="float:right">
                  <i class="fa-regular fa-heart"></i>${product.count}</a></li>
                  
               </ul>
               
               
            
               
         
               
            
         </c:forEach>
         
      </div>
   
   </section>
   

   
<!-- 페이지네이션 -->
   <div class="container-lg">
      <div class="row">
         <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
            <c:if test="${prevPageNum gt 1 }">
            <li class="page-item">
               <c:url value="/SecondStop/list4" var="pageLink">
                  <c:param name="page" value="${prevPageNum }"></c:param>
               </c:url>
               <a class="page-link" href="${pageLink }"><i class="fa-solid fa-angles-left"></i></a>
            </li>
            </c:if>
            <c:if test="${prevPageNum1 ge 1 }">
            <li class="page-item">
               <c:url value="/SecondStop/list4" var="pageLink">
                  <c:param name="page" value="${prevPageNum1 }"></c:param>
               </c:url>
               <a class="page-link" href="${pageLink }"><i class="fa-solid fa-angle-left"></i></a>
            </li>
            </c:if>
               <c:forEach begin="${leftPageNum}" end="${rightPageNum }" var="pageNum">
                  <c:url value="/SecondStop/list4" var="pageLink">
                     <c:param name="page" value="${pageNum }"></c:param>
                  </c:url>
                  <li class="page-item"><a class="page-link ${pageNum eq currentPageNum ? 'active' : '' }"
                     href="${pageLink }">${pageNum }</a></li>

               </c:forEach>
               
               <c:if test="${nextPageNum1 le lastPageNum }">
            <li class="page-item">
               <c:url value="/SecondStop/list4" var="pageLink">
                  <c:param name="page" value="${nextPageNum1 }"></c:param>
               </c:url>
               <a class="page-link" href="${pageLink }"><i class="fa-solid fa-angle-right"></i></a>
            </li>
            </c:if>
               
            <c:if test="${nextPageNum le lastPageNum}">   
            <li class="page-item">
               <c:url value="/SecondStop/list4" var="pageLink">
                  <c:param name="page" value="${nextPageNum }"></c:param>
               </c:url>
               <a class="page-link" href="${pageLink }"><i class="fa-solid fa-angles-right"></i></a>
            </li>
            </c:if>
            
            
            </ul>
         </nav>
      </div>
   </div>
   <script src="/js/navbar/productcategory.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>