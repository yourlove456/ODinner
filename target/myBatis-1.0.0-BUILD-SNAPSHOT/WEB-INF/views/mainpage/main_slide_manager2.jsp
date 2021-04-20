<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="${path}/resources/js/jquery.bxslider.js?after"></script>
<link href="${path}/resources/css/jquery.bxslider.css?after" rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function(){
	  $('.bxslider').bxSlider({  // ul에 있는 class명을 기준으로 선언을 합니다. 즉, 이미지구성요소들을 감싸고있는 객체에 선언해 줍니다. 
		auto: true, //자동슬라이드
		mode: 'fade' //슬라이드 모드 : fade 페이드인아웃 / vertical 상하 / horizontal 좌우 
		  }); 

	  
	});
</script>

</head>
<body>
<h1>슬라이드 관리</h1>
<div class="bxslider">
<c:forEach var="file" items="${fileList}">
   <form action="up/upload/updateDir" method="post" enctype="multipart/form-data" class="form-horizontal">
      <c:set var="len" value="${fn:length(file.fileName)}"/>
      <c:set var="filetype" value="${fn:toUpperCase(fn:substring(file.fileName, len-4, len))}"/>
      <c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}"><li><div class="slide_image"><img src='<c:url value="/up/img/${file.fileId}"/>' width="500px" height="300px" align="middle"></div>
      																							    <br>   <a href='<c:url value="/up/upload/delete/${file.fileId}"/>'>삭제</a> <li></c:if>
      <c:if test="${!((filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF'))}"><a href='<c:url value="/up/pds/${file.fileId}"/>'>${file.fileName}</a><br></c:if>
 	</form>
</c:forEach>
</div>
<br><br><br><br>

    <!-- 원래 삭제 버튼  <a href='<c:url value="/up/upload/delete/${file.fileId}"/>' class="delete">삭제</a> -->

   <div class="test_1">
   <c:url var="actionURL" value='/up/upload/new' />
   <form action="${actionURL}" method="post" enctype="multipart/form-data">
      <input type="file" name="file">
      <input type="submit" value="파일 추가">
      <input type="reset" value="취 소">
   </form>
   </div>
   
</body>
</html>