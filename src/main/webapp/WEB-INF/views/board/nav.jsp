<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<style type="text/css">
   li {list-style: none; display:inline; padding: 6px;}
</style>

<!-- nav css 적용  -->
<link href="${Path}/resources/css/nav_top.css" rel="stylesheet"/>
<script src="https://kit.fontawesome.com/21634ccedd.js" crossorigin="anonymous"></script>
<!--  -->

<nav class="navbar">
    
    <div class="navbar_logo">
    <a href="/">
   <i class="fas fa-book-reader fa-1x">ODN</i>
    </a>
    </div>
    
    <ul class="navbar_menu">
    <li><a href="/">홈</a></li>
    <li><a href="/board/noticeList">공지사항</a></li>
    <li><a href="/board/list">레시피</a></li>
    <li><a href="/board/search">재료 이미지 검색</a></li>
    
   </ul>
   
   <div class="navbar_log">
    <c:if test="${member == null}"><a href="/loginView"><i class="far fa-user fa-3x"></i></a></c:if>

   <li>
    <c:if test="${member != null }">${member.userName}님 안녕하세요 </c:if>
   </li>
   <c:if test="${member != null}">
   		<c:if test="${member.userTel == 'KAKAO'}"><a href="/logout">로그아웃</a></c:if>
   		<c:if test="${member.userTel != 'KAKAO'}"><a href="/member/logout">로그아웃</a></c:if>
   </c:if>      
    <li><c:if test="${member != null }"><a href="/board/mypage">마이페이지</a></c:if></li>
   <li><c:if test="${member.verify == 2}"><a href="/member/admin">관리자</a></c:if>
    <c:if test="${member.verify == 1}"><a href="/member/manager">매니저</a></c:if></li>

  
      </div>
    </nav>
    
    <!--------------------------------------------------  -->