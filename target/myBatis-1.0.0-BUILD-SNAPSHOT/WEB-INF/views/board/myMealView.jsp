<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="newMealForm" method = "post" action = "/board/newMeal">
			<input type = text name = "userId" value = "${member.userId }" hidden/>
			<label for = "mealName">식단 이름</label>
			<input type = text name = "mealName"/>
			<button type = "submit">식단 생성</button>
	</form>
	
</body>
</html>