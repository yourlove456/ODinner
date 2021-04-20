<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/member/memberDelete" method="post">
		<div>
			<label for="userId">아이디</label>
			<input type="text" name="userId" id="userId" />
        </div>
        <div>
          <label for="userPass">비밀번호</label>
          <input type="password" name="userPass" id="userPass" />
        </div>
		<div>
			<button type = "submit">회원 탈퇴</button>
		</div>
	</form>
	      
</body>
</html>