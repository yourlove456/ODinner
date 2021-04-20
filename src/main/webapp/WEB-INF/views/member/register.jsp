<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
  background: -moz-linear-gradient(right, #ffffff,#a0d812);
  background: -o-linear-gradient(right, #ffffff, #a0d812);
  background: linear-gradient(to left, #ffffff, #a0d812);
  
  
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
</style>


<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">
//이메일 입력방식 선택
$(document).ready(function(){
$('#selectEmail').change(function(){
   $("#selectEmail option:selected").each(function () {
      
      if($(this).attr("isSelf")== 'true'){ //직접입력일 경우
          $(".email").val('');                        //값 초기화
          $(".email").attr("disabled",false); //활성화
      }else{ //직접입력이 아닐경우
          $(".email").val($(this).text());      //선택값 입력
          $(".email").attr("disabled",false); //비활성화
      }
   });
});
})
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
   $(document).ready(function(){
       $(".cancel").on("click", function(){
         location.href = "/";
       });
       $("#submit").on("click", function(){
          if($("#userId").val().length == 0){ alert("아이디를 입력해주세요."); $("#userId").focus(); return false; }
          if($("#userPass").val().length == 0){alert("비밀번호를 입력해주세요."); $("#userPass").focus(); return false; }
          if($("#userName").val().length == 0){alert("이름을 입력해주세요."); $("#userName").focus(); return false; }
         
          //중복 체크 안했다면
          //핸폰 인증 안했다면
         
          var idChkVal = $("#idChk").val();
         if(idChkVal == "N"){
            alert("중복확인 버튼을 눌러주세요.");
            return false;
         }else if(idChkVal == "Y"){
            $("#regForm").submit();
         }
      });
   })
   
   function fn_idChk(){
      $.ajax({
         url : "/member/idChk",
         type : "post",
         dataType : "json",
         data : {"userId" : $("#userId").val()},
         success : function(data){
            if(data == 1){
             alert("중복된 아이디입니다.");
            }else if(data == 0){
               $("#idChk").attr("value", "Y");
               alert("사용가능한 아이디입니다.");
            }
         }
      })
   }
   $(function(){ 
    $("#alert-success").hide(); 
    $("#alert-danger").hide(); 
    $("input").keyup(function(){ 
      var userPass=$("#userPass").val(); 
      var userPassConfirm=$("#userPassConfirm").val(); 
      if(userPass != "" || userPassConfirm != ""){ 
         if(userPass == userPassConfirm){ 
          $("#alert-success").show(); 
          $("#alert-danger").hide(); 
       }else{ 
         $("#alert-success").hide();
          $("#alert-danger").show(); 
          } } }); });


</script>
  </head>
  <body>
  <div class="login-page">
  <div class="form">
    <section class="container">
      <form action="/member/register" method="post" id="regForm">

          <input type="text" name="userId" id="userId" placeholder="아이디" />
          <button type="button" class="idChk" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
			<br>
			<br>
          <input type="password" name="userPass" id="userPass" class="form-control" placeholder="비밀번호" required />
           
          <input type="password" name="userPassConfirm" id="userPassConfirm" class="form-control" placeholder="비밀번호 확인" required />
           
        <div class="alert alert-success" id="alert-success" style="color:blue">비밀번호가 일치합니다.</div> 
        <div class="alert alert-danger" id="alert-danger" style="color:red">비밀번호가 일치하지 않습니다.</div>
			<br>
          <input type="text" name="userName" id="userName" placeholder="이름"/>

          <input name="userTel" id="userTel" placeholder="연락처">

          <br>
        
          <input type="text" name="userEmail" id="userEmail" placeholder="이메일"/>
        

          <button type="submit" id="submit">회원가입</button>
          <p class="message"><a href="/">취소</a></p>
        
        </div>
  		</div>
        
      </form>
    </section>
</body>
</html>