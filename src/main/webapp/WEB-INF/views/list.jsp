<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="container-lg">
  <%--      <h1>게시물 목록</h1>
        <h2>Notices</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>올린 시간</th>
                    <th>내용</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${notices}" var="notice">
                    <tr>
                        <td>${notice.title}</td>
                        <td>${notice.inserted}</td>
                        <td>${notice.content}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table> --%> 

        <h2>Product List 1</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>가격</th>
                    <th>제목</th>
                    <th>주소</th>
                    <th>올린 시간</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productList1}" var="product">
                    <tr>
                        <td>${product.price}</td>
                        <td>${product.title}</td>
                        <td>${product.inserted}</td>
                        <td>${product.address}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

<%--    <h2>Product List 2</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>가격</th>
                    <th>제목</th>
                    <th>주소</th>
                    <th>올린 시간</th>
                    <th>좋아요 개수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productList2}" var="product">
                    <tr>
                        <td>${product.price}</td>
                        <td>${product.title}</td>
                        <td>${product.inserted}</td>
                        <td>${product.address}</td>
                        <td>${product.likes}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table> --%>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
