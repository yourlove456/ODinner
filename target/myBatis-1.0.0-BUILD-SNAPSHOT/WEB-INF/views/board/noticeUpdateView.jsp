<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
   <head>
    <!-- 합쳐지고 최소화된 최신 CSS -->
      <link href="${Path}/resources/css/bootstrap3.css" rel="stylesheet"/>
      <!-- 부가적인 테마 -->
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <style>
    #interval{margin: 5px 40px 10px 0;}
    strong{font-weight:800;}
    </style>
       <title>게시판</title>
   </head>
   <script type="text/javascript">
   $(document).ready(function(){
      var formObj = $("form[name='noticeUpdateForm']");

      $(".cancel_btn").on("click", function(){
         event.preventDefault();
         location.href = "/board/noticeList"
                     })

      $(".update_btn").on("click", function(){
         if(fn_valiChk()) return false;
         formObj.attr("action", "/board/noticeUpdate");
         formObj.attr("method", "post");
           formObj.submit();
       })
    		 $(".update_btn").click(function(){
    			 if($("#title").val().length == 0){alert("제목을 입력하세요"); $("#title").focus(); return false;}
    			 if($("#content").val().length == 0){alert("내용을 입력하세요"); $("#content").focus(); return false;}
    	});
   })
   
   function fn_valiChk(){
      var updateForm = $("form[name='noticeUpdateForm'] .chk").length;
      for(var i = 0; i<updateForm; i++){
         if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
            alert($(".chk").eq(i).attr("title"));
            return true;
            }
        }
    }

</script>
   <body>       
        <div>
            <%@include file="nav.jsp" %>
         </div>
          <div id="root" class="row text-center" style="width: 100%">
         <hr>
         
         <section id="container">
         <br><br>
         <h1>공지사항 수정하기</h1>
         <br><br>
            <form name="updateForm" role="form" method="post" action="/board/noticeUpdate" enctype= "multipart/form-data">
               <input type="hidden" name="bno" value="${noticeUpdate.bno}" readonly="readonly"/>
               <table>
                  <tbody>
                     <tr>
                        <td>
                           <label for="title">제목</label><input type="text" id="title" name="title" value="${noticeUpdate.title}" class="form-control"/><br><br>
                        </td>
                     </tr>            
                     <tr>
                        <td>
                           <label for="content">내용</label>
                           <textarea id="content" class="form-control" name="content" class="content" style="width:400px; height:200px; resize:none;">${noticeUpdate.content}</textarea>
                        <br><br>
                        </td>
                     </tr>
                     <tr>
                        <td>
                        <label for="writer">작성자</label><input type="text" id="writer" class="form-control" name="writer" value="${noticeUpdate.writer}" readonly="readonly"/><br>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <label for="regdate">작성날짜</label>
                        <fmt:formatDate value="${noticeUpdate.regdate}" pattern="yyyy-MM-dd"/><br>
                        </td>
                     </tr>      
                     <tr>  
                      <td>
                      <c:if test="${noticeUpdate.top == 1 }">
                       <input type="checkbox" name="top" value="1" checked>상단글 등록
                      </c:if> 
                      <c:if test="${noticeUpdate.top == 0 }">
                       <input type="checkbox" name="top" value="1">상단글 등록
                      </c:if> 
                      </td>
                     </tr> 
                  </tbody>         
               </table><br><br>
               <div>
                <button type="submit" class="update_btn btn btn-primary">저장</button>
                  <button type="submit" class="cancel_btn btn btn-primary">취소</button>
               </div>
            </form>
         </section>
         <hr />
      </div>
      <%@include file="footer.jsp" %>
   </body>
</html>