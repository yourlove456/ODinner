<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
 <!-- 합쳐지고 최소화된 최신 CSS -->
      <link href="${Path}/resources/css/bootstrap3.css" rel="stylesheet"/>
      
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

      <script src="https://kit.fontawesome.com/21634ccedd.js" crossorigin="anonymous"></script>
      
<title>공지사항</title>
</head>
<body>
<div>
   <%@include file="nav.jsp" %>
  </div>

<br>
<br>
 <div class="container">
 <div>
  <header>
   <h1>공지사항</h1>
  </header>
  
  
  
  <section id="container">
   <form role="form" method="get">
    <table class="table table-hover">
     <thead>
      <tr class = "table-success">
     <th scope = "col"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 번호 </font> </font> </th>
     <th scope = "col"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 제목</font> </font> </th>
     <th scope = "col"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 작성자</font> </font> </th>
     <th scope = "col"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 등록일</font> </font> </th>
      </thead>

     
     <c:forEach items="${noticeList }" var="noticeList">
     <tr>
      <td><c:out value="${noticeList.bno }"/> &nbsp;&nbsp;
     <c:if test="${noticeList.top == 1 }"> 
      <i class="fas fa-volume-down fa-1x" style="color:red"></i>
     </c:if> 
     <c:if test="${noticeList.top == 0 }"> 
     </c:if></td>
      <td>
       <a href="/board/noticeReadView?bno=${noticeList.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${noticeList.title}"/></a> 
      </td>
      <td><c:out value="${noticeList.writer }"/></td>
      <td><fmt:formatDate value="${noticeList.regdate }" pattern="yyyy-MM-dd"/></td>
     </tr>
     </c:forEach> 
    </table>
   </form>
    <c:if test="${member.verify != 0 }"><a href="/board/noticeWriteView" style="float:right">공지사항 작성</a></c:if>
     <div class="col-md-offset-3">
                  <ul class="pagination">
                     <c:if test="${pageMaker.prev}">
                        <li class="page-item disabled">
                        <a class="page-link" href="noticeList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
                        </li>
                     </c:if> 
                     
                     <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                        <li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
                        <a class="page-link" href="noticeList${pageMaker.makeSearch(idx)}">${idx}</a></li>
                     </c:forEach>
                     
                     <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                        <li><a href="noticeList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
                     </c:if> 
                     
                  </ul>
               </div>
  </section>
 </div>
 </div>
 <%@include file="footer.jsp" %>
</body>
</html>