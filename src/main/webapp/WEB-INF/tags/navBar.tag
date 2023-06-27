<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<link href="/resources/categorymenubar.css" rel="stylesheet">
<link href="/resources/menubar.css" rel="stylesheet">
<link href="/resources/navbar.css" rel="stylesheet">
<script src="/js/navbar/navbar.js"></script>
<!-- 글골 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
</style>
<body style="margin-top: 150px;">

<%
      String link = "http://3.35.52.151:8081/SecondStop/list4";
   %>
   <!-- 시맨틱 태그 header로 헤더 부분을 묶음 -->
   <header class="header">
      <div class="header__wrapper">
         <!-- 로고 -->
         <div class="header__start">



         <sec:authorize access="isAnonymous()">
            <span class="header__title"><a class="linkcolor"
               href="/SecondStop/list1"><img  class="navbarimage" src="/img/navbarimage.png"
               alt="My Image"/></a> </span>
         </sec:authorize>      
         <sec:authorize access="isAuthenticated()">      
               <a class="linkcolor"
               href="/SecondStop/list2"><img  class="navbarimage" src="/img/navbarimage.png"
               alt="My Image"/></a> 
         </sec:authorize>



         
         </div>
         <!-- 검색창 -->
         <div class="header__center">
         <form action="./list4" class="d-flex" role="search">
            <div class="input-group">
               <input value="${param.search }" name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
               <button class="btn btn-outline-light" type="submit">
                  <i class="fa-solid fa-magnifying-glass"></i>
               </button>
            </div>
         </form>
            
            
            
            
         </div>
         
         
         
      

  

         <!-- 프로필 -->
         <div id="dropdown" class="btn-toggle btn-secondary">
            
            <button class="dropdown-toggle" onclick="toggleDropdown()">
            <i class="fa-regular fa-circle-user" style="color: #FFFFFF; margin-left: 10px;"></i>
            </button>
            
            
            

            <ul class="dropdown-menu" id="dropdownMenu">
               <!-- Dropdown menu links -->
               <sec:authorize access="isAnonymous">
                  <li><button class="dropdown-item" type="button">
                        <a class="linkcolor" href="/member/login">로그인</a>
                     </button></li>
               </sec:authorize>
               <sec:authorize access="isAnonymous()">
                  <li><button class="dropdown-item" type="button">
                        <a class="linkcolor" href="/member/signup">회원가입</a>
                     </button></li>
               </sec:authorize>
               
               <sec:authorize access="hasAuthority('admin')">
                  <li>
                     <button class="dropdown-item" type="button">
                        <a class="linkcolor" href="/member/adminPage?id=<sec:authentication property="name" />">운영자 페이지</a>
                     </button>
                  </li>
               </sec:authorize>
               <sec:authorize access="isAuthenticated() and !hasAuthority('admin')">
                  <li><button class="dropdown-item" type="button">
                        <a class="linkcolor" href="/member/info?id=<sec:authentication property="name" />">마이페이지</a>
                     </button></li>
               </sec:authorize>
               
               
               <sec:authorize access="isAuthenticated() and !hasAuthority('admin')">
                  <li><button class="dropdown-item" type="button">
                        <a class="linkcolor" href="/SecondStop/mainAdd">상품등록</a>
                     </button></li>
               </sec:authorize>
               

               <sec:authorize access="isAuthenticated()">
                  <li><button class="dropdown-item" type="button">
                        <a class="linkcolor"  href="/member/logout">로그아웃</a>
                     </button></li>
               </sec:authorize>
            </ul>
         </div>

         
               
                  
      </div>
            

      
                  
         

      
      
      <nav id="primary_nav_wrap">
         <ul>
            <sec:authorize access="isAnonymous">
         <li class="current-menu-item"><a href="/SecondStop/list1">홈</a></li>
         </sec:authorize>
         <sec:authorize access="isAuthenticated()">
         <li class="current-menu-item"><a href="/SecondStop/list2">홈</a></li>
         </sec:authorize>
            <li><a href="/SecondStop/list4">카테고리</a>
               <ul>
                  <li><a onClick="location.href='<%=link%>?search=패션'">패션</a></li>
                  <li><a onClick="location.href='<%=link%>?search=가구'">가구</a></li>
                  <li><a onClick="location.href='<%=link%>?search=게임'">게임</a></li>
                  <li><a onClick="location.href='<%=link%>?search=명품'">명품</a></li>
                  <li><a onClick="location.href='<%=link%>?search=전자기기'">전자기기</a></li>
                  <li><a onClick="location.href='<%=link%>?search=취미'">취미</a></li>
                  <li><a onClick="location.href='<%=link%>?search=무료나눔'">무료나눔</a></li>
                     
               </ul></li>
            <li><a href="#">게시판</a>
               <ul>
                  <li><a href="/freeboard/freelist">자유게시판</a></li>
                  <li><a href="/adBoard/list">광고게시판</a></li>
                  <li><a href="/ptBoard/list">알바게시판</a></li>
               </ul>
            <li><a href="/cheat/check">조회</a>
            <li><a href="/notice/noticeList">공지사항</a></li>
         </ul>
      </nav>
   </header>
</body>