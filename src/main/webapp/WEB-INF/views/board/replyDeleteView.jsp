<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
   <head>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <!-- 합쳐지고 최소화된 최신 CSS -->
      <link href="${Path}/resources/css/bootstrap3.css?after" rel="stylesheet"/>
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <title>게시판</title>
   </head>
   <script type="text/javascript">
      $(document).ready(function(){
         var formObj = $("form[name='updateForm']");

         $(".btnHide2").click(function(){
             var idx = $(".btnHide2").index(this);  //클릭한 것 찾아서 idx 저장...☆
              $(".div2").eq(idx).hide();
          });
         
         $(".cancel_btn").on("click", function(){
            location.href = "/board/readView?bno=${replyDelete.bno}"
                  + "&page=${scri.page}"
                  + "&perPageNum=${scri.perPageNum}"
                  + "&searchType=${scri.searchType}"
                  + "&keyword=${scri.keyword}";
         })
         
      })
      
   </script>
   <body>
   
      <div id="root">
         <section id="container">
            <form name="updateForm" role="form" method="post" action="/board/replyDelete">
               <input type="hidden" name="bno" value="${read.bno}" readonly="readonly"/>
               <input type="hidden" id="rno" name="rno" value="${replyList.rno}" />
               <input type="hidden" id="page" name="page" value="${scri.page}"> 
               <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
               <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
               <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
                  
               <div>
                  <p>삭제 하시겠습니까?</p>
                  <button type="submit" class="replyDelete_btn btn btn-warning">예 삭제합니다.</button>
                  <button type="button" class="btnHide2 btn btn-primary">아니오. 삭제하지 않습니다.</button>
               </div>
            </form>
         </section>
         <hr />
      </div>
   </body>
</html>