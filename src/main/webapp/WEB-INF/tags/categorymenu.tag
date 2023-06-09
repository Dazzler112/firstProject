<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link href="/resources/categorymenubar.css" rel="stylesheet">
<style>
   .nav__submenu {
  display: none;
}

.nav__wrapper li:hover .nav__submenu {
  display: block;
}

</style>


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