<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<style>
	.container{
		background-color: #4499dd;
		color: #ddeeff;
		width: 300px;
		min-height: 100px;
	}
	.writer{
		font-size: 0.8em;
		opacity: 0.8;
	}
	.title{
		font-size: 2em;
		font-width: 500;
	}
	a{
	text-decoration: none;
	color: #ddffff;
	}
	.recipe{
		display: inline-block;
		padding: 10px;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page = "myMealView.jsp"/>
	<c:forEach items = "${meal}" var = "mealvar" varStatus = "status">
	<c:if test = "${mealvar.mealId != meal[status.index-1].mealId}">
		<div class = container>
		<div class = "writer">${mealvar.userId }</div>
		<div class = "title">${mealvar.mealName }</div> 
	</c:if>
	<div class = "recipe">
	<a href  = ""><!-- 레시피로 링크 -->
		${mealvar.title }
	</a>
	</div>
	<c:if test = "${mealvar.mealId != meal[status.index+1].mealId}">
	</div> <br>
	</c:if>
	</c:forEach>
	
</body>
</html>