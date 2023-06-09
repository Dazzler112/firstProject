<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<my:navBar></my:navBar>
	

    <style>
  
    /* content css */
.thumbs__wrapper {
  display: flex;
  flex-wrap: wrap; /*1차원 행렬을 여러 행으로*/
  justify-content: space-between;
  margin: 60px 0 0 160px; /*헤더와 네비 공간 띄우기*/
  padding: 20px 10px 0 10px;
}

.thumbs__item {
  width: 25%; /*한 줄에 4개씩 보이게*/
  margin: 0 0 15px 0;
  padding: 0 10px;
}

.thumbs__thumbnail {
  max-width: 100%; /*자기가 속한 영역에서 벗어나지 몺하게 최대 너비 100%*/
  height: auto;
  margin: 0 0 10px 0;
}

.thumbs__info {
  display: flex;
}

.thumbs__profile {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  background-color: rgb(158, 221, 255);
  background-image: url(../imgs/profile.png); /*이미지 불러오기*/
  background-size: 100% 100%;
}

.thumbs__text {
  width: calc(100% - 36px); /*전체 너비에서 프로필 사진 너비 만큼 뺀 값*/
  padding-left: 10px;
}

.thumbs__text--title {
  font-size: 1rem;
  margin-bottom: 0.5em;
}

.thumbs__text--owner {
  padding: 3px 0;
  font-size: 0.9rem;
  color: #2d2d2d;
  margin-bottom: 0.2em;
}

.thumbs__text--anal {
  font-size: 0.8rem;
  color: #8d8d8d;
}

@media screen and (max-width: 1000px) {
  /*한 줄에 3개씩*/
  .thumbs__item {
    width: 33%;
  }
}

@media screen and (max-width: 800px) {
  /*한 줄에 2개씩*/
  .thumbs__item {
    width: 50%;
  }
  .thumbs__wrapper {
    margin: 60px 0 0 120px; /*줄어든 네비 공간에 맞게 띄우기*/
  }
}

@media screen and (max-width: 400px) {
  /*한 줄에 1개씩*/
  .thumbs__item {
    width: 100%;
  }
  .thumbs__wrapper {
    margin: 60px 0 0 0; /*네비 부분 삭제*/
    padding: 20px 0 0 0; /*패딩 탑만 두고 삭제*/
  }
}
    
    .nav__submenu {
  display: none;
}

.nav__wrapper li:hover .nav__submenu {
  display: block;
}
    
   
    </style>
    
    
    
  
      
      <section class="thumbs">
      <div class="thumbs__wrapper">
        <!--thumbs__item 12번 반복-->
        <div class="thumbs__item">
          <img
            class="thumbs__thumbnail"
            src="/img/bbubba.jpg"
            alt="thumbnail"
            width="500px"
          />
          <div class="thumbs__info">
            <div class="thumbs__profile"></div>
            <div class="thumbs__text">
              <h3 class="thumbs__text--title">상품제목</h3>
              <p class="thumbs__text--owner">게시자</p>
              <p class="thumbs__text--anal">조회수 613회 &#183; 1시간 전</p>
            </div>
          </div>
        </div>
        <div class="thumbs__item">
          <img
            class="thumbs__thumbnail"
            src="/img/bbubba.jpg"
            alt="thumbnail"
            width="500px"
          />
          <div class="thumbs__info">
            <div class="thumbs__profile"></div>
            <div class="thumbs__text">
              <h3 class="thumbs__text--title">상품제목</h3>
              <p class="thumbs__text--owner">게시자</p>
              <p class="thumbs__text--anal">조회수 613회 &#183; 1시간 전</p>
            </div>
          </div>
        </div>
        <div class="thumbs__item">
          <img
            class="thumbs__thumbnail"
            src="/img/bbubba.jpg"
            alt="thumbnail"
            width="500px"
          />
          <div class="thumbs__info">
            <div class="thumbs__profile"></div>
            <div class="thumbs__text">
              <h3 class="thumbs__text--title">상품제목</h3>
              <p class="thumbs__text--owner">게시자</p>
              <p class="thumbs__text--anal">조회수 613회 &#183; 1시간 전</p>
            </div>
          </div>
        </div>
        
        <!--thumbs__item 12번 반복-->
      </div>
      
      
      
      
    </section>
      
    
 <nav class="nav">
  <ul class="nav__wrapper">
    <h4>카테고리</h4>
    <li>
      <div class="nav__icon">게임</div>
      <ul class="nav__submenu">
        <li>게임 항목 1</li>
        <li>게임 항목 2</li>
        <li>게임 항목 3</li>
      </ul>
    </li>
    <li>
      <div class="nav__icon">패션</div>
      <ul class="nav__submenu">
        <li>패션 항목 1</li>
        <li>패션 항목 2</li>
        <li>패션 항목 3</li>
      </ul>
    </li>
    <li>
      <div class="nav__icon">가구</div>
      <ul class="nav__submenu">
        <li>가구 항목 1</li>
        <li>가구 항목 2</li>
        <li>가구 항목 3</li>
      </ul>
    </li>
  </ul>
</nav>

      
    </div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
		integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
</body>
</html>