<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
      <link href="${Path}/resources/css/bootstrap3.css?after" rel="stylesheet"/>
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       
       <link href="${Path}/resources/css/nav_top.css" rel="stylesheet"/>
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script src="https://kit.fontawesome.com/21634ccedd.js" crossorigin="anonymous"></script>
       <style>
    #interval{margin: 5px 40px 10px 0;}
    strong{font-weight:800;}
    .container{margin-left:33%;}
    </style>
<title>공지사항</title>
</head>
<style>
 .blank{
   width: 5%;
      }
</style>
<script type="text/javascript">
      
      $(document).ready(function(){
         var formObj = $("form[name='noticeReadForm']");


          // 수정 
         $(".noticeUpdate_btn").on("click", function(){
         console.log("1");
            formObj.attr("action", "/board/noticeUpdateView");
            formObj.attr("method", "get");
            formObj.submit();      
                  
         })
         
         // 삭제
         $(".noticeDelete_btn").on("click", function(){
            
            var deleteYN = confirm("삭제하시겠습니까?");
            if(deleteYN == true){
               
            formObj.attr("action", "/board/noticeDelete");
            formObj.attr("method", "post");
            formObj.submit();
               
            }
         })
         
         // 목록
         $(".noticeList_btn").on("click", function(){
               
            location.href = "/board/noticeList?page=${scri.page}"
                           +"&perPageNum=${scri.perPageNum}";
         })          
      })
</script>      
<body>
<div>
   <%@include file="nav.jsp" %>
   </div>
   
 <div class="container">
  <header>
   <h1> 공지사항</h1>
  </header>
  <hr />
<section id="container">
 <form name="noticeReadForm" role="form" method="post">
  <input type="hidden" id="bno" name="bno" value="${noticeRead.bno}" />
  <input type="hidden" id="page" name="page" value="${scri.page}"> 
  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
 </form>
 
 <div class="form-group">
  <label for="title">제목</label>
  <input type="text" id="title" name="title" class="form-control" value="${noticeRead.title}" readonly="readonly" style="width:500;"/><br>
 </div>
 
 <div class="form-group">
  <label for="content">내용</label>
  <textarea id="content" name="content" class="form-control"  readonly="readonly" style="width:500; height:300px; resize:none">${noticeRead.content}</textarea><br>
 </div>
 
 <div class="form-group">
  <label for="writer">작성자</label>
  <input type="text" id="writer" name="writer" class="form-control" value="${noticeRead.writer}"  readonly="readonly" style="width:500;"/>
 </div>
 
 <div class="form-group">
  <label for="regdate">작성날짜</label>
  <fmt:formatDate value="${noticeRead.regdate}" pattern="yyyy-MM-dd" />   
 </div>
 <div>
 <c:if test="${member.verify != 0 }">
  <button type="button" class="noticeUpdate_btn btn btn-warning">수정</button>
  <button type="button" class="noticeDelete_btn btn btn-danger">삭제</button>
 </c:if>
  <button type="button" class="noticeList_btn btn btn-primary">목록</button>
 </div>
 
 </section>
 </div>
 <%@include file="footer.jsp" %>
</body>
</html>