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

      <link href="${Path}/resources/css/writeView.css?after" rel="stylesheet"/>
   <style>
    #interval{margin: 5px 40px 10px 0;}
    strong{font-weight:800;}
    </style>
       <title>게시판</title>
   </head>
   <script type="text/javascript">
   $(document).ready(function(){
      var formObj = $("form[name='updateForm']");

      $("#btnHide").click(function(){
  	          $(".div").hide();
  	      });
          $("#btnShow").click(function(){
              $(".div").show();
          });
          $("#btnToggle").click(function(){
              $(".div").toggle();
          });

          $(".div2").hide();        

  		$("#btnHide2").click(function(){
  	          $(".div2").hide();
  	      });
          $("#btnShow2").click(function(){
              $(".div2").show();
          });
          $("#btnToggle2").click(function(){
              $(".div2").toggle();
          });
             

          $(".div3").hide();        

  		$("#btnHide3").click(function(){
  	          $(".div3").hide();
  	      });
          $("#btnShow3").click(function(){
              $(".div3").show();
          });
          $("#btnToggle3").click(function(){
              $(".div3").toggle();
          });

          $(".div4").hide();        

  		$("#btnHide4").click(function(){
  	          $(".div4").hide();
  	      });
          $("#btnShow4").click(function(){
              $(".div4").show();
          });
          $("#btnToggle4").click(function(){
              $(".div4").toggle();
          });

          $(".div5").hide();        

  		$("#btnHide5").click(function(){
  	          $(".div5").hide();
  	      });
          $("#btnShow5").click(function(){
              $(".div5").show();
          });
          $("#btnToggle5").click(function(){
              $(".div5").toggle();
          });   

          $(".div6").hide();        

  		$("#btnHide6").click(function(){
  	          $(".div6").hide();
  	      });
          $("#btnShow6").click(function(){
              $(".div6").show();
          });
          $("#btnToggle6").click(function(){
              $(".div6").toggle();
          });   

          $(".div7").hide();        

  		$("#btnHide7").click(function(){
  	          $(".div7").hide();
  	      });
          $("#btnShow7").click(function(){
              $(".div7").show();
          });
          $("#btnToggle7").click(function(){
              $(".div7").toggle();
          });   

          $(".div8").hide();        

  		$("#btnHide8").click(function(){
  	          $(".div8").hide();
  	      });
          $("#btnShow8").click(function(){
              $(".div8").show();
          });
          $("#btnToggle8").click(function(){
              $(".div8").toggle();
          });   

          $(".div9").hide();        

  		$("#btnHide9").click(function(){
  	          $(".div9").hide();
  	      });
          $("#btnShow9").click(function(){
              $(".div9").show();
          });
          $("#btnToggle9").click(function(){
              $(".div9").toggle();
          });   

          $(".div10").hide();        

  		$("#btnHide10").click(function(){
  	          $(".div10").hide();
  	      });
          $("#btnShow10").click(function(){
              $(".div10").show();
          });
          $("#btnToggle10").click(function(){
              $(".div10").toggle();
          });   

          $(".div11").hide();        

  		$("#btnHide11").click(function(){
  	          $(".div11").hide();
  	      });
          $("#btnShow11").click(function(){
              $(".div11").show();
          });
          $("#btnToggle11").click(function(){
              $(".div11").toggle();
          });   

          $(".div12").hide();        

  		$("#btnHide12").click(function(){
  	          $(".div12").hide();
  	      });
          $("#btnShow12").click(function(){
              $(".div12").show();
          });
          $("#btnToggle12").click(function(){
              $(".div12").toggle();
          });   

          $(".div13").hide();        

  		$("#btnHide13").click(function(){
  	          $(".div13").hide();
  	      });
          $("#btnShow13").click(function(){
              $(".div13").show();
          });
          $("#btnToggle13").click(function(){
              $(".div13").toggle();
          });   

          $(".div14").hide();        

  		$("#btnHide14").click(function(){
  	          $(".div14").hide();
  	      });
          $("#btnShow14").click(function(){
              $(".div14").show();
          });
          $("#btnToggle14").click(function(){
              $(".div14").toggle();
          }); 

          $(".div15").hide(); 

          $("#btnHide15").click(function(){
  	        $(".div15").hide();
  	    });
          $("#btnShow15").click(function(){
              $(".div15").show();
          });
          $("#btnToggle15").click(function(){
              $(".div15").toggle();
        });        
      $(".cancel_btn").on("click", function(){
         event.preventDefault();
         location.href = "/board/readView?bno=${update.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}";
        })
        /*
      이벤트를 취소하는 도중에 preventDefault를 호출하게 되면
      일반적으로는 브라우저의 구현에 의해 처리되는 기존의 액션이 동작하지 않게되고,
      그 결과 이벤트가 발생하지 않게 됩니다.
      */
      $(".update_btn").on("click", function(){
         if(fn_valiChk()) return false;
         if($("#title").val().length == 0){alert("음식이름을 입력하세요"); $("#title").focus(); return false;}
		 if($("#tool").val().length == 0){alert("재료를 입력하세요"); $("#tool").focus(); return false;}
		 if($("#can").val()== 0){alert("난이도를 선택하세요"); $("#can").focus(); return false;}
		 if($("#time").val()== 0){alert("소요시간을 선택하세요"); $("#time").focus(); return false;}
		 if($("#people").val()== 0){alert("인원수를 선택하세요"); $("#people").focus(); return false;}
		 if($("#menu").val()== 0){alert("분류를 선택하세요"); $("#menu").focus(); return false;}
		 if($("#contenta").val().length == 0){alert("내용을 입력하세요"); $("#contenta").focus(); return false;} 
         formObj.attr("action", "/board/update");
         formObj.attr("method", "post");
           formObj.submit();
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
   
        <div>
            <%@include file="nav.jsp" %>
         </div>
      <div id="root" class="row text-center" style="width: 100%">
            <hr>
            
         <section id="container">
         <br><br>
         <h1>레시피 수정하기</h1>
            <form name="updateForm" role="form" method="post" action="/board/update" enctype= "multipart/form-data">
            <input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
               <table>
                  <tbody>
                        <tr>
                           <td>
  <label for="title"><strong>음식이름</strong></label><br>
  <input type="text" id="title"  class="form-control" name="title" value="${update.title}" style="width:250px;"/>
                           </td>
                        </tr>
                        <tr>
                           <td>
                           <br><br>
   <label for="ingredient"><strong>재료</strong></label>
   <textarea id="tool" name="ingredient" class="form-control" style="width:500px; resize:none;">${update.ingredient}</textarea>
                           </td>
                        </tr>  
                        <tr>
                           <td>
                           <br>
                           <table>
                           <tr><td>
                            <div id="interval" class="form-group">
                           <label for="menu"><strong>분류</strong></label>
                           <br>
      <select id="menu" name="menu" class="custom-select cc_cursor" style="width:230px; resize:none">
                              <option selected>${update.menu}</option>
                              <option>한식</option>
                              <option>중식</option>
                              <option>일식</option>
                              <option>양식</option>
                              <option>분식</option>
                              <option>간식</option>
                              <option>퓨전</option>
                           </select>
                           </div></td>
                           
                            <td><div id="interval" class="form-group">   
                           <label for="lev"><strong>난이도</strong></label>
                           <br>
    <select id="can" name="lev" class="custom-select cc_cursor" style="width:230px; resize:none">
                              <option>${update.lev}</option>
                              <option>찐고수</option>
                              <option>고수도전</option>
                              <option>평범한 실력</option>
                              <option>어린아이</option>
                              <option>똥손가능</option>                   
                           </select>
                          </div></td></tr>
                          
                         <tr><td><br><div class="form-group">
                           <label for="time"><strong>소요시간</strong></label>
                           <br>
  <select id="time" name="time" class="custom-select cc_cursor" style="width:230px; resize:none">
                              <option selected>${update.time}</option>
                              <option>5분이내</option>
                              <option>10분이내</option>
                              <option>30분이내</option>
                              <option>1시간이내</option>
                              <option>2시간이내</option>                   
                              <option>5시간이내</option>                   
                              <option>10시간이내</option>                   
                           </select>
                           </div></td>
                           
                        <td><br><div class="form-group">
                           <label for="serving"><strong>인원</strong></label>
                           <br>
  <select id="people" name="serving" class="custom-select cc_cursor" style="width:230px; resize:none">
                              <option selected>${update.serving}</option>
                              <option>1인분</option>
                              <option>2인분</option>
                              <option>4인분</option>
                              <option>6인분</option>
                              <option>10인분</option>                   
                              <option>30인분이상</option>                              
                           </select>
                           </div></td></tr>
                           </table>
                           </td>
                        </tr>
                        <br>
                        <tr>
                        <td><br>
                           <div>
                           <label for="content"><strong>내용</strong></label>
                           <div class = "div1">
                           <label for="contenta">step1</label>
                           <br>
                           <textarea id="contenta" name="contenta" class="contenta" style="width:500px; height:100px; resize:none;">${update.contenta}</textarea> 
                           <br>
                           <button type="button" id="btnToggle2" class="btn btn-primary" style="margin-right:-30px">추가/지우기</button>
                           </div>
                           <div class="div2"><br><br>
                           <label for="contentb">step2</label>
                           <br>
                           <textarea id="contentb" name="contentb" class="contentb" style="width:500px; height:100px; resize:none;">${update.contentb}</textarea> 
                           <br>
                           <button type="button" id="btnToggle3" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div3"><br><br>
                           <label for="contentc">step3</label>
                           <br>
                           <textarea id="contentc" name="contentc" class="contentc" style="width:500px; height:100px; resize:none;">${update.contentc}</textarea> 
                           <br>
                           <button type="button" id="btnToggle4" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div4"><br><br>
                           <label for="contentd">step4</label>
                           <br>
                           <textarea id="contentd" name="contentd" class="contentd" style="width:500px; height:100px; resize:none;">${update.contentd}</textarea> 
                           <br>
                           <button type="button" id="btnToggle5" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div5"><br><br>
                           <label for="contente">step5</label>
                           <br>
                           <textarea id="contente" name="contente" class="contente" style="width:500px; height:100px; resize:none;">${update.contente}</textarea> 
                           <br>
                           <button type="button" id="btnToggle6" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div6"><br><br>
                           <label for="contentf">step6</label>
                           <br>
                           <textarea id="contentf" name="contentf" class="contentf" style="width:500px; height:100px; resize:none;">${update.contentf}</textarea> 
                           <br>
                           <button type="button" id="btnToggle7" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div7"><br><br>
                           <label for="contentg">step7</label>
                           <br>
                           <textarea id="contentg" name="contentg" class="contentg" style="width:500px; height:100px; resize:none;">${update.contentg}</textarea> 
                           <br>
                           <button type="button" id="btnToggle8" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div8"><br><br>
                           <label for="contenth">step8</label>
                           <br>
                           <textarea id="contenth" name="contenth" class="contenth" style="width:500px; height:100px; resize:none;">${update.contenth}</textarea> 
                           <br>
                           <button type="button" id="btnToggle9" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div9"><br><br>
                           <label for="contenti">step9</label>
                           <br>
                           <textarea id="contenti" name="contenti" class="contenti" style="width:500px; height:100px; resize:none;">${update.contenti}</textarea> 
                           <br>
                           <button type="button" id="btnToggle10" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div10"><br><br>
                           <label for="contentj">step10</label>
                           <br>
                           <textarea id="contentj" name="contentj" class="contentj" style="width:500px; height:100px; resize:none;">${update.contentj}</textarea> 
                           <br>
                           <button type="button" id="btnToggle11" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div11"><br><br>
                           <label for="contentk">step11</label>
                           <br>
                           <textarea id="contentk" name="contentk" class="contentk" style="width:500px; height:100px; resize:none;">${update.contentk}</textarea> 
                           <br>
                           <button type="button" id="btnToggle12" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div12"><br><br>
                           <label for="contentl">step12</label>
                           <br>
                           <textarea id="contentl" name="contentl" class="contentl" style="width:500px; height:100px; resize:none;">${update.contentl}</textarea> 
                           <br>
                           <button type="button" id="btnToggle13" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div13"><br><br>
                           <label for="contentm">step13</label>
                           <br>
                           <textarea id="contentm" name="contentm" class="contentm" style="width:500px; height:100px; resize:none;">${update.contentm}</textarea> 
                           <br>
                           <button type="button" id="btnToggle14" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div14"><br><br>
                           <label for="contentn">step14</label>
                           <br>
                           <textarea id="contentn" name="contentn" class="contentn" style="width:500px; height:100px; resize:none;">${update.contentn}</textarea> 
                           <br>
                           <button type="button" id="btnToggle15" class="btn btn-primary"  style="margin-right:-30px">추가/지우기</button>
                           </div>   
                           <div class="div15"><br><br>
                           <label for="contento">step15</label>
                           <br>
                           <textarea id="contento" name="contento" class="contento" style="width:500px; height:100px; resize:none;">${update.contento}</textarea> 
                           <br>
                           </div>
                           </div>
                           </td>
                           
                        </tr>
                        <br>
                        <tr>
                           <td>
                           <br>
                              <label for="tip"><strong>나만의요리꿀팁!!</strong></label>
                              <br>
                              <textarea id="tip" name="tip" class="form-control"  style="width:500px; resize:none">${update.tip}</textarea>
                           </td>
                        </tr>
                        <br> 
                        <tr>
                           <td>
                           <br>
                              <label for="writer"><strong>작성자</strong></label>
                              <input type="text" id="writer" name="writer" class="form-control" title="작성자를 입력하세요." style="width:200px;resize:none;" value="${member.userName}" readonly="readonly"/>
                           <br><br></td>
                           
                        <tr>
                           <td align="center">                  
                              <button class="update_btn btn btn-primary" type="submit">작성 완료</button>   
                              <button class="cancel_btn btn btn-primary" type="submit">취소</button>   
                           </td>
                        </tr>   
                     
                     
                  </tbody>         
               </table>
            </form>
            
         </section>
         <hr />
      </div>
      <%@include file="footer.jsp" %>
   </body>
</html>