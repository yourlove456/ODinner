<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
      <link href="${Path}/resources/css/bootstrap3.css" rel="stylesheet"/>
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<meta charset="UTF-8">
<title>공지사항</title>
</head>
<script>
$(document).ready(function() {
	 $(".btn-primary").click(function(){
		 if($("#title").val().length == 0){alert("제목을 입력하세요"); $("#title").focus(); return false;}
		 if($("#content").val().length == 0){alert("내용을 입력하세요"); $("#content").focus(); return false;}
});
});
</script>
<body>

   <div>
   <%@include file="nav.jsp" %>
   </div>

<div id="root" class="row text-center" style="width: 64%">
<hr>

<section id=="container">
<br><br>
  <h1>공지사항</h1>            <br><br>
 <form name="noticeWriteForm" method="post" action="/board/noticeWrite">
  <table>
   <tbody>
    <tr>
     <td>
      <label for="title" style="float:left"><strong>제목</strong></label>
      <br>
      <input type="text" id="title" name="title" class="form-control" title="제목을 입력하세요."/><br><br>
     </td>
    </tr>
    <tr>
     <td>
      <label for="content" style="float:left"><strong>내용</strong></label>
      <br>
      <textarea id="content" name="content" class="form-control" title="내용을 입력하세요" style="width:400px; height:200px; resize:none;"></textarea><br><br>
     </td>
    </tr>
    <tr>
     <td>
      <label for="writer" style="float:left"><strong>작성자</strong></label>
      <br>
      <input type="text" id="writer" name="writer" class="form-control" value="관리자" readonly="readonly" /><br>
     </td>
    </tr>
    <tr>  
     <td>
     <div style="float:left"><input type="checkbox" name="top" value="1">상단글 등록</div><br><br>
     <br>
      <button class="btn btn-primary" type="submit">작성</button>
     </td>
    </tr> 
   </tbody>
  </table>
 </form>
</section>

</div>
<%@include file="footer.jsp" %>
</body>
</html>