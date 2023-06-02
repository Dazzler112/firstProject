<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<style>
.header {
  /*헤더 고정*/
  position: fixed;
  top: 0;
  left: 0;
  /**/
  width: 100%;
  background-color: #fff;
  box-shadow: 0 0 3px #000;
  z-index: 2;
}

.header__wrapper {
  /*고정된 높이*/
  height: 60px;
  /*좌우정렬 flex*/
  display: flex;
  flex-direction: row;
  /*세로축 모든 아이템 센터 정렬*/
  align-items: center;
  /*가로축 아이템 정렬: 양 끝으로 펼치기*/
  justify-content: space-between;
  padding: 0 16px;
}

.header__start {
  display: flex;
  align-items: center;
}
.header__menu {
  border: none;
  background-color: transparent;
  font-size: 1.5rem;
}
.header__logo {
  margin-left: 20px;
  width: 25px;
  height: 25px;
}
.header__title {
  font-size: 1.2rem;
  margin-left: 6px;
}

.header__center {
  /*검색창 너비가 헤더 너비의 50%로 따라가도록 작성*/
  width: 50%;
}
.header__searchForm {
  max-width: 100%;
}
.header__input--text {
  /*버튼 크기 제외한 나머지 전체 너비 차지하도록*/
  width: calc(100% - 60px);
  /*예쁘게 꾸미기*/
  height: 40px;
  padding: 0 6px;
  border: 1px solid #8f8f8f;
  border-right: none;
  border-radius: 2px 0 0 2px;
}
.header__input--btn {
  width: 60px;
  height: 40px;
  border: 1px solid #8f8f8f;
  border-left: none;
  border-radius: 0 2px 2px 0;
}

.header__end {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.header__search {
  border: none;
  background-color: transparent;
  font-size: 1.5rem;
  display: none;
  margin-right: 5px;
}
.header__profile {
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background-color: rgb(158, 221, 255);
  /*이미지 불러오기*/
  background-image: url(../imgs/profile.png);
  background-size: 40px 40px;
}

/*800px 정도로 화면 줄어들면 로고 타이틀 없애기*/
@media screen and (max-width: 800px) {
  .header__title {
    display: none;
  }
}

/*450px 정도로 화면 줄어들면 로고 타이틀 없애기*/
@media screen and (max-width: 400px) {
  .header__center {
    display: none;
  }
  .header__search {
    display: block;
  }
}
</style>



 <body>
    <!-- 시맨틱 태그 header로 헤더 부분을 묶음 -->
    <header class="header">
      <div class="header__wrapper">
        <!-- 로고 -->
        <div class="header__start">
          <button class="header__menu">&#9776;</button>
          <span class="header__title">NavBar</span>
        </div>

        <!-- 검색창 -->
        <div class="header__center">
          <form class="header__searchForm" onsubmit="return false;">
            <input
              class="header__input--text"
              type="text"
              
            /><button class="header__input--btn">검색</button>
          </form>
        </div>

        <!-- 프로필 -->
        <div class="header__end">
          <button class="header__search">&#128269;</button>
          <div class="header__profile"></div>
        </div>
      </div>
    </header>
    </body>
