<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
   <head>
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link href="${Path}/resources/css/bootstrap3.css?after" rel="stylesheet"/>
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script src="https://kit.fontawesome.com/21634ccedd.js" crossorigin="anonymous"></script>
       <title>게시판</title>
   </head>
   <style>
      .blank{
         width: 5%;
      }
      img{
         width: 150px;
         }
         #title{width: 500px;}
        #writer{width: 500px;}
        
        label{font-weight: 700;}
   </style>
   <script type="text/javascript">
      
      $(document).ready(function(){
         var formObj = $("form[name='readForm']");

         $(".div1").hide();
         
          $(".btnShow").click(function(){
              var idx = $(".btnShow").index(this);  //클릭한 것 찾아서 idx 저장...☆
              $(".div1").eq(idx).show();
          });

          $(".div2").hide();
          
          $(".btnShow2").click(function(){
              var idx = $(".btnShow2").index(this);  //클릭한 것 찾아서 idx 저장...☆
              $(".div2").eq(idx).show();
          });
         
      recCount();
        $("#rec_update").click(function(){
            console.log("${member.userId}");
            
            $.ajax({
                url: "/board/updateLike",
                type: "POST",
                data: {
                    bno: ${read.bno},
                    userId: "${member.userId}"
                    },
                success: function(){
               recCount();
                    }
                })
        });
        function recCount(){
         $.ajax({
            url: "/board/countLike",
            type: "GET",
                data: {
                    bno: ${read.bno},
                    },
                success: function(count){
                    $(".rec_count").html(count);
                    }
            })
            };
        
         // 수정 
         $(".update_btn").on("click", function(){
            formObj.attr("action", "/board/updateView");
            formObj.attr("method", "get");
            formObj.submit();            
         })
         
         // 삭제
         $(".delete_btn").on("click", function(){
            
            var deleteYN = confirm("삭제하시겠습니까?");
            if(deleteYN == true){
               
            formObj.attr("action", "/board/delete");
            formObj.attr("method", "post");
            formObj.submit();
               
            }
         })
         
         // 목록
         $(".list_btn").on("click", function(){
            location.href = "/board/list?page=${scri.page}"
                        +"&perPageNum=${scri.perPageNum}"
                        +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
         })
         
         
         //댓글 작성
         //$(".replyWriteBtn").on("click", function(){
         //});

         //댓글 수정 View
         $(".replyUpdateBtn").on("click", function(){
            location.href = "/board/replyUpdateView?bno=${read.bno}"
                        + "&page=${scri.page}"
                        + "&perPageNum=${scri.perPageNum}"
                        + "&searchType=${scri.searchType}"
                        + "&keyword=${scri.keyword}"
                        + "&rno="+$(this).attr("data-rno");
         });
         
         //댓글 삭제 View
         $(".replyDeleteBtn").on("click", function(){
            location.href = "/board/replyDeleteView?bno=${read.bno}"
               + "&page=${scri.page}"
               + "&perPageNum=${scri.perPageNum}"
               + "&searchType=${scri.searchType}"
               + "&keyword=${scri.keyword}"
               + "&rno="+$(this).attr("data-rno");
         });
      })
      
         function isnull(){
        	if($("#content").val().length == 0){ $("#content").focus(); return false;}
        	else{
            var formObj = $("form[name='replyForm']");
            formObj.attr("action", "/board/replyWrite");
            formObj.submit();
            	}
             }
   </script>
   
   <body>
         <div>
            <%@include file="nav.jsp" %>
         </div>
         
      <div class="container" style="margin-left:500px;">
         <br>
         <br>
         <header>
            <h1> 게시판</h1>
         </header>
         <hr />
          
         
         <section id="container">
            <form name="readForm" role="form" method="post">
               <input type="hidden" id="bno" name="bno" value="${read.bno}" />
               <input type="hidden" id="page" name="page" value="${scri.page}"> 
               <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
               <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
               <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
            </form>
            
            <div class="form-group">
               <label for="title">음식이름</label>
               <input type="text" id="title" name="title" class="form-control" value="${read.title}" readonly="readonly" />
               <img src = "/resources/images/recipe_image/${read.imgFile0}"/>
            </div><br>
            <div class="form-group">
               <label for="tool">재료</label>
               <textarea id="tool" name="ingredient" class="form-control" readonly="readonly" style="width:500px; resize:none;">${read.ingredient}</textarea>
            </div><br>
            <div class="form-group">
            <table>
             <tr>
            <td style="width:10%"><label for="menu">분류</label></td>
            <td rowspan="1" class="blank"></td>
            <td><label for="lev">난이도</label></td>
            </tr>
                
            <tr>
            <td><input type="text" id="menu" name="menu" class="form-control" value="${read.menu}" readonly="readonly" style="width:200px;"/></td>
            <td rowspan="2" class="blank"></td>
            <td><input type="text" id="can" name="lev" class="form-control" value="${read.lev}" readonly="readonly" style="width:200px;"/></td>
            </tr>
            
            <tr>
            <td><br><label for="time">소요시간</label></td>
            <td><br><label for="serving">인원수</label></td>
            </tr>
            
            <tr>
            <td><input type="text" id="time" name="time" class="form-control" value="${read.time}" readonly="readonly" style="width:200px;"/></td>
            <td rowspan="2" class="blank"></td>
            <td><input type="text" id="people" name="serving" class="form-control" value="${read.serving}" readonly="readonly" style="width:200px;"/></td>
            </tr>
            </table>
            </div><br><br>
            <div class="form-group">
             
               <label>내용</label><br/>
               
               <label for="contenta">step1</label>
                     <textarea id="contenta" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contenta}</textarea>
                     <c:if test="${read.imgFile1 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile1}"/>
               <br><br>
                     </c:if>
               
               <c:if test="${read.contentb != null }">
               <label for="contentb">step2</label>
               <textarea id="contentb" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentb}</textarea>
                     <c:if test="${read.imgFile2 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile2}"/>
               </c:if>
               </c:if>
               
               <c:if test="${read.contentc != null }">
               <br><br>
               <label for="contentc">step3</label>
               <textarea id="contentc" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentc}</textarea>
                     <c:if test="${read.imgFile3 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile3}"/>
                    </c:if>
               </c:if>
               
               <c:if test="${read.contentd != null }">
               <br><br>
               <label for="contentd">step4</label>
               <textarea id="contentd" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentd}</textarea>
                    <c:if test="${read.imgFile4 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile4}"/>
                    </c:if>
               </c:if>
               
               <c:if test="${read.contente != null }">
               <label for="contente">step5</label>
               <textarea id="contente" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contente}</textarea>
                      <c:if test="${read.imgFile5 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile5}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contentf != null }">
               <label for="contente">step6</label>
               <textarea id="contentf" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentf}</textarea>
                     <c:if test="${read.imgFile6 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile6}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contentg != null }">
               <label for="content7">step7</label>
               <textarea id="contentg" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentg}</textarea>
                     <c:if test="${read.imgFile7 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile7}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contenth != null }">
               <label for="contenth">step8</label>
               <textarea id="contenth" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contenth}</textarea>
                     <c:if test="${read.imgFile8 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile8}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contenti != null }">
               <label for="contenti">step9</label>
               <textarea id="contenti" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contenti}</textarea>
                     <c:if test="${read.imgFile9 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile9}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contentj != null }">
               <label for="contentj">step10</label>
               <textarea id="contentj" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentj}</textarea>
                     <c:if test="${read.imgFile10 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile10}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contentk != null }">
               <label for="contentk">step11</label>
               <textarea id="contentk" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentk}</textarea>
                     <c:if test="${read.imgFile11 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile11}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contentl != null }">
               <label for="contentl">step12</label>
               <textarea id="contentl" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentl}</textarea>
                     <c:if test="${read.imgFile12 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile12}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contentm != null }">
               <label for="contentm">step13</label>
               <textarea id="contentm" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentm}</textarea>
                     <c:if test="${read.imgFile13 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile13}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contentn != null }">
               <label for="contentn">step14</label>
               <textarea id="contentn" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contentn}</textarea>
                     <c:if test="${read.imgFile14 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile14}"/>
                     </c:if>
               </c:if>
               
               <c:if test="${read.contento != null }">
               <label for="contento">step15</label>
               <textarea id="contento" name="contentread" class="form-control"  readonly="readonly" style="width:500px; height: 130px; resize:none">${read.contento}</textarea>
                     <c:if test="${read.imgFile15 != '0' }">
                        <img src = "/resources/images/recipe_image/${read.imgFile15}"/>
                     </c:if>
               </c:if>
            </div><br><br>
            
            
             <div class="form-group">
             <c:if test="${read.tip != null }">
               <label for="tip">나만의 꿀팁!!</label>
               <textarea id="tip" name="tip" class="form-control"  readonly="readonly" style="width:500px; resize:none">${read.tip}</textarea>
           <br>
            </c:if>
            </div>
            
            <div class="form-group">
               <label for="writer">작성자</label>
               <input type="text" id="writer" name="writer" class="form-control" value="${member.userName}"  readonly="readonly" style="width:150px;"/>
            </div>
            <div class="form-group">
               <label for="regdate">작성날짜&nbsp;&nbsp;</label>
               <fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />   
            </div>
            <!-- 추천 기능 -->
        <div>
            <div class="w3-border w3-center w3-padding">
                <c:if test="${ member.userId == null }">
                    추천 기능은 <a href="/loginView" class="btn btn-info">로그인</a> 후 사용 가능합니다.<br />
                    <i class="fa fa-heart" style="font-size:16px;color:red"></i>
                    <span class="rec_count"></span>                   
                </c:if>
                <c:if test="${ member.userId != null }">
                    <button class="w3-button w3-black w3-round" id="rec_update">
                        <i class="fa fa-heart" style="font-size:16px;color:red"></i>
                        &nbsp;<span class="rec_count"></span>
                    </button> 
                </c:if>
            </div>
        </div><br>
                        
            <div>
               <c:if test="${member.userId == read.writer}"><button type="button" class="update_btn btn btn-warning">수정</button></c:if>
               <c:if test="${member.userId == read.writer}"><button type="button" class="delete_btn btn btn-danger">삭제</button></c:if>
               <button type="button" class="list_btn btn btn-primary">목록</button>   
            </div><br><br>
            <c:if test="${member.userId != null}">
            <!-- 댓글 -->
            <div id="reply">
               <ol class="replyList">
                  <c:forEach items="${replyList}" var="replyList">
                     <li>
                        <p style="color:black">
                        작성자 : ${member.userName} <br>
                        내용 : ${replyList.content}  <br>
                        작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
                        </p>
                          
                        <div>
                        <div class="div1"><%@include file="replyUpdateView.jsp" %></div>
                        <div class="div2"><%@include file="replyDeleteView.jsp" %></div>
                           <c:if test="${member.userId == replyList.writer}"><button type="button" class="btn btn-warning btnShow">수정</button></c:if>
                           <c:if test="${member.userId == replyList.writer}"><button type="button" class="btn btn-danger btnShow2">삭제</button></c:if>
                        </div>
                     </li>
                  </c:forEach>   
               </ol>
            </div>
            
            <form name="replyForm" method="post" class="form-horizontal">
               <input type="hidden" id="bno" name="bno" value="${read.bno}" />
               <input type="hidden" id="page" name="page" value="${scri.page}"> 
               <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
               <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
               <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
            
           
               
               <div class="form-group">
                  <label for="writer">댓글 작성자</label>
                  <div>
                     <input type="text" id="writer" name="writer" value="${member.userName}" class="form-control" readonly="readonly" style="width:150px;"/>
                  </div>
               </div>
               
               <div class="form-group">
                  <label for="content">댓글 내용</label>
                  <div>
                     <textarea id="content" name="content" class="form-control" style="width:500px; resize:none; height:100px;"></textarea>
                  </div>
               </div>
               
               <div class="form-group">
                  <div>
                     <button type="button" class="replyWriteBtn btn btn-success" onclick = "isnull()">작성 완료</button>
                  </div>
               </div>
               </form> 
               </c:if>
               <c:if test="${member.userId == null}">
                <p>로그인 후에 작성하실 수 있습니다.</p>
               </c:if>
                     
         </section>
      </div>
      
      <!-- 검색창 부분 -->         
          <%@include file="footer.jsp" %>
      
   </body>
</html>