<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.memberUpdate{display: none}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $(".cancel").on("click",function(){
            location.href = "/";
         });


      $(".changeInfo").on("click", function(){
    	  if($("#userPass").val().length == 0){alert("새비밀번호를 입력하세요"); $("#userPass").focus(); return false;}
    	  else if($("#userPass2").val().length == 0){alert("새비밀번호를 확인해주세요"); $("#userPass2").focus(); return false;}
    	  else if($("#userName").val().length == 0){alert("이름을 입력하세요"); $("#userName").focus(); return false;}
    	  else{
    	   $(".completeText").style.display = "block";
        	  }
           });
/*
       $(".changeInfo").submit(function(){
      });
  */    
      $(".checkPass").on("click",function(){
          var userPass = $(".userPasschk").val();
           if( userPass == "${member.userPass}"){
               $(".log").css("display","none");
               $(".memberUpdate").css("display","inline-block");
           }else{
               alert("비밀번호를 재입력해주세요");
               }
         });

         $(function(){ 
             $("#alert-success").hide(); 
             $("#alert-danger").hide(); 
             $("input").keyup(function(){ 
               var userPass=$("#userPass").val(); 
               var userPass2=$("#userPass2").val(); 
               if(userPass != "" || userPass2 != ""){ 
                  if(userPass == userPass2){ 
                   $("#alert-success").show(); 
                   $("#alert-danger").hide(); 
                   $("#submit").removeAttr("disabled"); 
                }else{ 
                  $("#alert-success").hide();
                   $("#alert-danger").show(); 
                   $("#submit").attr("disabled", "disabled"); 
                   } 
                  } 
               }); 
             });
                  
   });
   
</script>

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
  width: 260px;
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
</style>



</head>
<body>
    <section class="container">
    <!-- 회원 정보 변경 비번 인증 -->
   
   
      <div class="log">
         <div class="login-page">
        <div class="form">
         <h1>회원정보 수정</h1>
        <div>
          <input type="text" name="userId" id="userId" value = "${member.userId }" placeholder="아이디"/>
        </div>
        <div>
          <input type="password" name="userPass" class = "userPasschk"  placeholder="비밀번호"/>
          
        </div>
        <div>
          <button type="submit" class = "checkPass" >수정하기</button>
          <p class="message"><a href="/">취소</a></p>
        </div>
       </div> 
       </div>
       </div>

   <!-- 회원 정보 변경 -->
   <div class="memberUpdate">
   <div class="login-page">
        <div class="form">
      <form action="/member/memberUpdate" method="post" name = "changeForm">
        <div>
         <input type="text" name = "userId" value= "${member.userId }" placeholder="아이디" readonly="readonly"/>
        </div>
        <div>
          <input type="password" name="userPass"  id="userPass" class ="userPass"  placeholder="새 비밀번호"/><br>
          <input type="password" name="userPass2" id="userPass2" class = "userPass"  placeholder="새 비밀번호 확인"/>
        <div class="alert alert-success" id="alert-success" style="color:blue">비밀번호가 일치합니다.</div> 
        <div class="alert alert-danger" id="alert-danger" style="color:red">비밀번호가 일치하지 않습니다.</div>
        </div>
         <div>
          <input type="text" name="userName" id="userName" value= "${member.userName}" placeholder="이름"/>
        </div>
        <div>
          <input type="text" name="userTel" id="userTel" value = "${member.userTel}" placeholder="연락처"/>
        </div>
        <div>
          <input type="email" name="userEmail" id="userEmail" value = "${member.userEmail}" placeholder="이메일"/>
        </div>
        <div>
           <button type="submit" class="changeInfo">변경</button>
           <p class="message"><a href="/">취소</a></p>
        </div>
      </form>
     </div> 
      </div>
    </div>
    </section>
   
</body>
</html>