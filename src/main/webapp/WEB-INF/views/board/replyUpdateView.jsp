<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
 <!-- 합쳐지고 최소화된 최신 CSS -->
      <link href="${Path}/resources/css/bootstrap3.css?after" rel="stylesheet"/>
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
   $(document).ready(function(){
      var formObj = $("form[name='updateForm']");

      $(".btnHide").click(function(){
          var idx = $(".btnHide").index(this);  //클릭한 것 찾아서 idx 저장...☆
           $(".div1").eq(idx).hide();
       });
      
      $(".cancel_btn").on("click", function(){
         event.preventDefault();
         location.href = "/board/readView?bno=${replyUpdate.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}";
        })
        
   })
   
   function fn_valiChk(){
      var updateForm = $("form[name='updateForm'] .chk").length;
      for(var i = 0; i<updateForm; i++){
         if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
            alert($(".chk").eq(i).attr("title"));
            return true;
            }
        }
    }

</script>

<body>
<div id="root">
   <section id="container">
      <form name="updateForm" role="form" method="post" action="/board/replyUpdate">
         <input type="hidden" name="bno" value="${read.bno}" readonly="readonly" />
         <input type="hidden" id="rno" name="rno" value="${replyList.rno}" />
         <input type="hidden" id="page" name="page" value="${scri.page}" />
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
        
        <table>
           <tbody>
              <tr><td><label for="content">댓글 작성자</label><input type="text" id="writer" name="writer" value="${member.userName}" /></td></tr>
              <tr><td><label for="content">댓글 내용</label><input type="text" id="content" name="content" value="${replyList.content}" /></td></tr>
           </tbody>
        </table>
        <div>
           <button type="submit" class="update_btn btn btn-warning">저장</button>
           <button type="button" class="btnHide btn btn-primary">취소</button>
        </div>
        </form>
    </section><hr/>
   </div>
</body>
</html>