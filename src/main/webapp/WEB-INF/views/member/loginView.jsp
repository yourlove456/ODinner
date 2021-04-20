<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>Home</title>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #a0d812;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #8ebf12;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #a0d812;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  /* background: #76b852;  초록 배경
  background: -webkit-linear-gradient(right, #76b852, #8DC26F);
  background: -moz-linear-gradient(right, #76b852, #8DC26F);
  background: -o-linear-gradient(right, #76b852, #8DC26F);
  background: linear-gradient(to left, #76b852, #8DC26F); */
  
/*   background: #13cfcf;  파랑 배경 
  background: -webkit-linear-gradient(right, #ffffff, #13cfcf);
  background: -moz-linear-gradient(right, #ffffff, #13cfcf);
  background: -o-linear-gradient(right, #ffffff, #13cfcf);
  background: linear-gradient(to left, #ffffff, #13cfcf); */
  
  background: #a0d812; /* 핑크 배경 */
  background: -webkit-linear-gradient(right, #ffffff, #a0d812);
  background: -moz-linear-gradient(right, #ffffff, #a0d812);
  background: -o-linear-gradient(right, #ffffff, #a0d812);
  background: linear-gradient(to left, #ffffff, #a0d812);
  
  
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}

span{
color : red;
}


.kakaoimg {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 270px;
	height: 48.8px;
	background-color: #FFFA00;
	color: #423800;
}

.kakaoimg:hover,.kakaoimg:active,.kakaoimg:focus {
  	background: #FFE400;
}

.aa {
	font-weight: 600;
	font-size: 14px;
	text-align: center;
}

i {
	padding-right: 10px;
	align-self: center;
}

</style>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/21634ccedd.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#registerBtn").on("click", function(){
			location.href = "/member/register";
			});
		$(".kakaoimg").on("click", function(){
			location.href = "https://kauth.kakao.com/oauth/authorize?client_id=f441fdc54da50335f120591d02097237&redirect_uri=http://192.168.0.10:8088/login&response_type=code";
			});
		$("#logoutBtn").on("click", function(){
			location.href = "member/logout";
			});
		$("#memberUpdateBtn").on("click", function(){
			location.href = "member/memberUpdateView";
			});
		$("#memberDeleteBtn").on("click", function(){
			location.href = "member/memberDeleteView";
			});
	});
</script>
</head>
<body>
<div class="login-page">
  <div class="form">
    <form action="member/login" name="loginForm" method="post">
      <c:if test="${member == null}">
        <div>
          <input type="text" name="userId" id="userId" placeholder="아이디"/>
        </div>
        <div>
          <input type="password" name="userPass" id="userPass" placeholder="비밀번호"/>
        </div>
        <div>
          <button type="submit">로그인</button>
          <br>
   			 <div class="kakaoimg">
        		<i class="fas fa-comment fa-2x"></i>
        		<div class="aa">
            	카카오 로그인
        		</div>
    		  </div>          
   		  <br>
          <button type="button" id="registerBtn">회원가입</button>
        </div>
        <p class="message"><a href="/">취소</a></p>
      </c:if>
      
      <c:if test="${member != null }"> <!-- 로그인 성공시 메인화면으로 -->
         <c:redirect url="/"/>
      </c:if>
      <c:if test="${msg == false}">
        <span>아이디 혹은 비밀번호가<br> 일치하지 않습니다</span>
      </c:if>
    </form>
    </div>
    </div>
</body>
</html>
