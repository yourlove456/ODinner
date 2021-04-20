<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>Home</title>
<link href="${Path}/resources/css/bootstrap3.css" rel="stylesheet"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">
th,tr{
	padding: 10px;
}
table {
	border: 1px solid #dfdfdf; 
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
text-align: center;

}
</style>
</head>
<body>
<section class="container">
	<div>매니저 페이지</div>
	
   <table border="1" width="1000px">
      <tr><th>구분</th>
         <th>아이디</th>
         <th>이름</th>
         <th>이메일</th>
         <th>가입일자</th></tr>

   <c:forEach var="user" items="${admin}">
      <tr><th>
      		<c:if test="${user.verify == '관리자'}"><span class="btn btn-danger">관리자</span></c:if>	
      		<c:if test="${user.verify == '매니저'}"><span class="btn btn-warning">매니저</span></c:if>	
      		<c:if test="${user.verify == '일반'}"><span class="btn btn-primary">사용자</span></c:if>	
      	 </th>
         <th>${user.userId}</th>
         <th>${user.userName}</th>
         <th>${user.userEmail}</th>
         <th>${user.regDate}</th></tr>
   </c:forEach>
  </table>
  <br><a href="/upload" class="btn btn-info">메인</a>
  </section>
</body>
</html>