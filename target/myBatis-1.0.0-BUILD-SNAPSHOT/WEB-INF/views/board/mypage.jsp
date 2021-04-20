<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>마이페이지</title>
	<link href="${Path}/resources/css/bootstrap3.css" rel="stylesheet"/>
	<link href="${Path}/resources/css/list2.css?after" rel="stylesheet"/>
	 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 
<style type="text/css">
td{
	padding: 20px;
}
thead{
	border-bottom: 3px solid #dfdfdf;
}
.container{
	margin: auto;
	padding: auto;
}
div{
padding: 20px 0px;
font-size: 4rem;
font-weight: 900;
color: #6b6b6b;
margin: 50px;
}
table{
	font-size: 2rem;
}
#space{
	width: 20%;
}
span{
	padding: 20px 0px;
	font-size: 1.3rem;
	font-weight: 900;
	color: #6b6b6b;
	margin: 50px;
}
#mypage, #mypage_space{
	display: inline-block;
}
#mypage_space{
	width: 30%;
}


</style>
</head>
<body>
  
<div class="container">
	<section id="container">
	<br> 
<div id="mypage">내 정보</div><div id="mypage_space"></div><span><a href="/member/memberUpdateView" class="btn btn-info">내 정보 수정</a>&nbsp;&nbsp;<a href="/" class="btn btn-info">홈</a></span>  
<div>
<table width="900px">	
	<tr><td id="space">아이디</td><td>${member.userId}</td></tr>
	<tr><td>닉네임</td><td>${member.userName}</td></tr>
	<tr><td>전화번호</td><td>${member.userTel}</td></tr>
	<tr><td>이메일</td><td>${member.userEmail}</td></tr></table>
</div>
<br>
<div>내가 작성한 글</div>
<div id="master_bp">
	<c:forEach items="${list}" var = "list">
	<div class="master_bp">
		<figure><a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
		<img src="/resources/images/recipe_image/${list.imgFile0 }" /></a>
		<figcaption><c:out value="${list.title}"/></figcaption></figure>
	</div>
	</c:forEach>
</div>
      
      
	</section>
</div>

</body>
</html>