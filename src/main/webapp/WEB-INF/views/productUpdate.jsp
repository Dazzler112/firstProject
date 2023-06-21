<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SecondStop</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
</style>
</head>
<body>
    <div class="container-lg" style="padding: 0em 6em;">
        <div class="row justify-content-center">
            <div class="col-10 col-md-12 col-lg-14">
                <c:forEach items="${list}" var="product">
                    <h1>${product.id}번 게시물</h1>
                </c:forEach>
                <form action="" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${product.id}" /> <br>
                    <div id="category_div-div">
                        <span class="category_title">카테고리</span>
                        <select name="categoryId">
                            <option value="1">패션</option>
                            <option value="2">가구</option>
                            <option value="3">게임</option>
                            <option value="4">명품</option>
                            <option value="5">전자기기</option>
                        </select>
                    </div>
                    <br>
                    <div class="mb-3">
                        <div class="mb-3">
                            <label for="titleInput" class="form-label">제목</label>
                            <input id="titleInput" class="form-control" type="text" name="title" value="${product.title}" />
                        </div>

                        <!-- 파일 출력 -->
                        <div class="mb-3">
                            <div class="mb-3">
                                <img class="img-thumbnail img-fluid" src="${bucketUrl}/${product.id}/${product.photoTitle}" alt="" />
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="bodyTextarea" class="form-label">내용</label>
                        <textarea rows="5" id="bodyTextarea" class="form-control" name="body">${product.body}</textarea>
                    </div>

                    <div class="mb-3">
                        <label for="priceTextarea" class="form-label">가격</label>
                        <textarea rows="1" id="priceTextarea" class="form-control" name="price">${product.price}</textarea>
                    </div>

                    <div class="mb-3">
                        <label for="addressTextarea" class="form-label">주소</label>
                        <textarea rows="1" id="addressTextarea" class="form-control" name="address">${product.address}</textarea>
                    </div>

                    <div class="mb-3">
                        <label for="qtyTextarea" class="form-label">수량</label>
                        <textarea rows="1" id="qtyTextarea" class="form-control" name="qty">${product.qty}</textarea>
                    </div>

                    <div class="mb-3">
                        <label for="fileInput" class="form-label">상품 사진</label>
                        <input class="form-control" type="file" id="fileInput" name="files" accept="image/*" multiple>
                        <div class="form-text">총 10MB, 하나의 파일은 1MB를 초과할 수 없습니다.</div>
                    </div>

                    <div class="mb-3">
                        <div class="mb-3">
                            <input class="btn btn-secondary" type="submit" value="수정" />
                            <a class="btn btn-danger" href="/id/${product.id}">취소</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-j60EY0P+2vEiCTBPvz9ImkA+Xouf5BJ/0QIYjLVJ0PevusgIMrDkVahDzLcDcMFn"
        crossorigin="anonymous"></script>
</body>
</html>
