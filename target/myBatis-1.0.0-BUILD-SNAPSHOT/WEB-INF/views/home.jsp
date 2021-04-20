<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!-- 이미지 불러오기 -->
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- 이미지 불러오기 2 -->
<!-- 제이쿼리 불러오기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<html>
<head>
<title>Home</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${Path}/resources/css/bootstrap3.css?after" rel="stylesheet"/>
<link href="${Path}/resources/css/default.css?after" rel="stylesheet"/>
<link href="${Path}/resources/css/fonts.css?after" rel="stylesheet"/>
<link href="${Path}/resources/css/mainhome.css?after" rel="stylesheet"/>
<link href="${Path}/resources/css/list2.css?after" rel="stylesheet"/>

</head>
<body>
	<!-- nav 부분 -->
	<div>
    <%@include file="board/nav.jsp" %>
    </div>
    <!--------------------------------------------------  -->

   	  <!-- 슬라이드 --><br><br><br><br>
    <%@include file="mainpage/main_slide_manager.jsp" %>
	<br><br><br><br><br>

<div id="featured" class="container">
	<c:forEach items="${list}" var = "list">
	<div class="boxA">
		<div class="box">
		
		<a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}" class="image image-full">
		<img src="/resources/images/recipe_image/${list.imgFile0 }" /></a>
			<span><c:out value="${list.title}"/></span>
		</div>
		<c:out value="${list.writer}"/>
	</div>
	</c:forEach>	
</div>


	<h1>추천 레시피</h1>
<div id="master_bp">
	<c:forEach items="${list}" var = "list">
	<div class="master_bp">
		<figure><a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
		<img src="/resources/images/recipe_image/${list.imgFile0 }" /></a>
		<figcaption><c:out value="${list.title}"/></figcaption>
		<figcaption><c:out value="${list.writer}"/></figcaption><br><br><br></figure>
	</div>
	</c:forEach>
</div>            
<!-- --------------- -->
    
 
    <!--------------------------------------------------  -->
    <%@include file="board/footer.jsp" %>
    
</body>
</html>
