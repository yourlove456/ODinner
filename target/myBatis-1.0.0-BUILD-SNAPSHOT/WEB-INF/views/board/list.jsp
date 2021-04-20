<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
   <head>
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link href="${Path}/resources/css/bootstrap3.css" rel="stylesheet"/>
      <!-- 부가적인 테마 -->
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
      <link href="${Path}/resources/css/list1.css?after" rel="stylesheet"/>

      
      <script>
      	console.log("log: " + ${list});
      </script>
      <script type="text/javascript">
      
      $(document).ready(function(){
         var formObj = $("form[name='listForm']");

         // 최신순 정렬 
         $("#newdate").on("click", function(){
         location.href = "/board/newdate"
                     })

          // 오래된순 정렬 
         $("#olddate").on("click", function(){
         location.href = "/board/olddate"
                     })
         
      })
      
      </script>
         
         
       <title>게시판</title>
   </head>
   <body>
   
   <div>
   <%@include file="nav.jsp" %>
   </div>
   
   
   		<br>
   		<br>
      <div class="container">
         <header>
            <h1>🥦레시피 게시판🥦</h1>
         </header>
          
         
         
         <section id="container">
         
               <div style="float:right;">
                <button type="button" id="newdate" class="btn btn-primary" style="background-color:#558B2F">최신순</button>
                <button type="button" id="olddate" class="btn btn-primary" style="background-color:#558B2F">오래된순</button>
               </div>   
               <div style="height: 100px"></div>
            <form role="form" method="get">

               <div id="master_bp">
                  <c:forEach items="${list}" var = "list">
               	<div class="master_bp">
                     <figure><a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
                     <img src="/resources/images/recipe_image/${list.imgFile0}"></a>
                     	<figcaption><c:out value="${list.title}"/></figcaption>
                     	<figcaption><c:out value="${list.writer}"/></figcaption></figure>
                   </div>
                  </c:forEach>
               </div>
                 <c:if test="${member != null }"><a href="/board/writeView" style="float:right">글작성</a></c:if><br><br>
               <div class="search row">
                  <div class="col-xs-2 col-sm-2">
                     <select name="searchType" class="form-control">
                        <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
                        <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>음식이름</option>
                        <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>작성자</option>
                        <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>난이도</option>
                        <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>음식이름+난이도</option>
                     </select>
                  </div>
                   
                  <div class="col-xs-10 col-sm-10">
                     <div class="input-group">
                        <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
                        <span class="input-group-btn">
                           <button id="searchBtn"   type="button" class="btn btn-primary">검색</button>    
                        </span>
                     </div>
                  </div>
                   
                  <script>
                      $(function(){
                         $('#searchBtn').click(function() {
                            self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
                         });
                      });   
                  </script>
               </div>
               <div class="col-md-offset-3">
                  <ul class="pagination">
                     <c:if test="${pageMaker.prev}">
                        <li class="page-item disabled">
                        <a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
                        </li>
                     </c:if> 
                     
                     <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                        <li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
                        <a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
                     </c:forEach>
                     
                     <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                        <li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
                     </c:if> 
                     
                  </ul>
               </div>
            </form>
         </section>
      </div>
  
    <!-------------------footer 부분-------------------------------  -->
    <%@include file="footer.jsp" %>
    <!--  -->
   </body>
</html>