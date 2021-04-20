<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
   <head>
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link href="${Path}/resources/css/bootstrap3.css" rel="stylesheet"/>
      <!-- 부가적인 테마 -->
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="${path}/resources/js/writeView.js?after"></script>
      <link href="${Path}/resources/css/writeView.css?after" rel="stylesheet"/>
   <style>
   #interval{margin: 5px 40px 10px 0;}
   strong{font-weight:800;}
   .recipe-step-img{padding-top:10px;}
   #small{height:100px;}
   </style>
   
       
       <title>게시판</title>
   </head>

   <body>
   
   <div>
   <%@include file="nav.jsp" %>
   </div>
   
   
      <div id="root" class="row text-center" style="width: 100%">
            <hr>
            
         <section id="container">
         <br><br>
         <h1>레시피 글쓰기</h1>
            <form name="writeForm" method="post" action="/board/write" enctype= "multipart/form-data">
               <table>
                  <tbody>
                     <c:if test="${member.userId != null}">
                        <tr>
                           <td>
							<label for="title"><strong>음식이름</strong></label>
							<input type="text" id="title" name="title" class="form-control" title="제목을 입력하세요." style="width:500px; resize:none"/>
							<label><strong>썸네일</strong></label><br>
							<div class="file_input">
							   <label>
							      <img src="${path}/resources/images/home_main/image_plus.png" width="150px" height="150px">
							        <input type="file" name = "file0" id="gdsImg" class="recipe-step-img"/>
							      </label>
							</div>
                           </td>
                        </tr>
                        <tr>
                           <td>
                           <br><br>
   <label for="ingredient"><strong>재료</strong></label>
   <textarea id="tool" name="ingredient" class="form-control" placeholder="예) 양배추/고추장 1스푼" style="width:500px; resize:none"></textarea>
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
                              <option selected value="0">분류를 선택해주세요</option>
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
                              <option selected value="0">난이도를 선택해주세요</option>
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
                              <option selected value="0">소요시간을 선택해주세요</option>
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
                              <option selected value="0">인원수를 선택해주세요</option>
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
                           <div class = "div1">
                              <label for="contenta"><strong>내용</strong></label><br>
                              <label for="contenta">step1</label>
                              <br>
                              <div style="float:left">
                              <textarea id="contenta" name="contenta" class="contenta" style="width:350px; height:100px; resize:none;"></textarea>
                              </div>
                              <div class="file_inputa" style="float:left">
                              <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px"> 
                              <input type="file" name="file1" id="gdsImga" class="recipe-step-img" /></label>
                              </div><br>
                              <button type="button" id="btnToggle2" class="btn btn-primary">추가/지우기</button>
                              </div>
                              
                           <div class="div2"><br><br>
                              <label for="contentb">step2</label>
                              <br>
                              <div style="float:left">
                              <textarea id="contentb" name="contentb" class="contentb" style="width:350px; height:100px; resize:none;"></textarea>
                              </div>
                              <div class="file_inputb" style="float:left">
                                <label id="small">
                                 <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px"> 
                                <br><input type="file" name="file2" id="gdsImgb" class="recipe-step-img" /></label>
                              </div><br>
                              <button type="button" id="btnToggle3" class="btn btn-primary" >추가/지우기</button>
                           </div>   
                           <div class="div3"><br><br>
                                 <label for="contentc">step3</label>
                                 <br>
                                 <div style="float:left">
                                 <textarea id="contentc" name="contentc" class="contentc" style="width:350px; height:100px; resize:none;"></textarea>
                                 </div>
                                 <div class="file_inputc" style="float:left">
                                 <label id="small">
                                    <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                                    <br><input type="file" name="file3" id="gdsImgc" class="recipe-step-img" /></label>
                              </div><br>
                              <button type="button" id="btnToggle4" class="btn btn-primary" >추가/지우기</button>
                          </div>   
                           <div class="div4"><br><br>
                                 <label for="contentd">step4</label>
                                 <br>
                                 <div style="float:left">
                                 <textarea id="contentd" name="contentd" class="contentd" style="width:350px; height:100px; resize:none;"></textarea>
                                 </div>
                                 <div class="file_inputd" style="float:left">
                                   <label id="small">
                                    <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                                    <br><input type="file" name="file4" id="gdsImgd" class="recipe-step-img" /></label>
                                 </div><br>
                           <button type="button" id="btnToggle5" class="btn btn-primary" >추가/지우기</button>
                           </div>   
                           <div class="div5"><br><br>
                           <label for="contente">step5</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contente" name="contente" class="contente" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           <div class="file_inpute" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file5" id="gdsImge" class="recipe-step-img" /></label>
                           </div><br>
                           <button type="button" id="btnToggle6" class="btn btn-primary" >추가/지우기</button>
                           </div>   
                           <div class="div6"><br><br>
                           <label for="contentf">step6</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contentf" name="contentf" class="contentf" style="width:350px; height:100px; resize:none;"></textarea>
                           </div> 
                           <div class="file_inputf" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px"> 
                           <br><input type="file" name="file6" id="gdsImgf" class="recipe-step-img" /></label></div><br>
                           <button type="button" id="btnToggle7" class="btn btn-primary" >추가/지우기</button>
                           </div>   
                           <div class="div7"><br><br>
                           <label for="contentg">step7</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contentg" name="contentg" class="contentg" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           <div class="file_inputg" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file7" id="gdsImgg" class="recipe-step-img" /></label></div><br>
                           <button type="button" id="btnToggle8" class="btn btn-primary" >추가/지우기</button>
                           </div>   
                           <div class="div8"><br><br>
                           <label for="contenth">step8</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contenth" name="contenth" class="contenth" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           <div class="file_inputh" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file8" id="gdsImgh" class="recipe-step-img" /></label></div><br>
                           <button type="button" id="btnToggle9" class="btn btn-primary">추가/지우기</button>
                           </div>   
                           <div class="div9"><br><br>
                           <label for="contenti">step9</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contenti" name="contenti" class="contenti" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           <div class="file_inputi" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file9" id="gdsImgi" class="recipe-step-img" /></label></div><br>
                           <button type="button" id="btnToggle10" class="btn btn-primary">추가/지우기</button>
                           </div>   
                           <div class="div10"><br><br>
                           <label for="contentj">step10</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contentj" name="contentj" class="contentj" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           
                           <div class="file_inputj" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file10" id="gdsImgj" class="recipe-step-img" /></label></div><br>
                           <button type="button" id="btnToggle11" class="btn btn-primary">추가/지우기</button>
                           </div>   
                           <div class="div11"><br><br>
                           <label for="contentk">step11</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contentk" name="contentk" class="contentk" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           <div class="file_inputk" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file11" id="gdsImgk" class="recipe-step-img" /></label></div><br>
                           <button type="button" id="btnToggle12" class="btn btn-primary">추가/지우기</button>
                           </div>   
                           <div class="div12"><br><br>
                           <label for="contentl">step12</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contentl" name="contentl" class="contentl" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           <div class="file_inputl" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file12" id="gdsImgl" class="recipe-step-img" /></label></div><br>
                           <button type="button" id="btnToggle13" class="btn btn-primary" >추가/지우기</button>
                           </div>   
                           <div class="div13"><br><br>
                           <label for="contentm">step13</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contentm" name="contentm" class="contentm" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           <div class="file_inputm" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file13" id="gdsImgm" class="recipe-step-img" /></label></div><br>
                           <button type="button" id="btnToggle14" class="btn btn-primary">추가/지우기</button>
                           </div>   
                           <div class="div14"><br><br>
                           <label for="contentn">step14</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contentn" name="contentn" class="contentn" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           <div class="file_inputn" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file14" id="gdsImgn" class="recipe-step-img" /></label></div><br>
                           <button type="button" id="btnToggle15" class="btn btn-primary" >추가/지우기</button>
                           </div>   
                           <div class="div15"><br><br>
                           <label for="contento">step15</label>
                           <br>
                           <div style="float:left">
                           <textarea id="contento" name="contento" class="contento" style="width:350px; height:100px; resize:none;"></textarea>
                           </div>
                           <div class="file_inputo" style="float:left">
                             <label id="small">
                              <img src="${path}/resources/images/home_main/image_plus.png" width="100px" height="100px">  
                           <br><input type="file" name="file15" id="gdsImgo" class="recipe-step-img" /></label></div>
                           </div>
                           </td>
                           
                        </tr>
                        <br>
                        <tr>
                           <td>
                           <br>
                              <label for="tip"><strong>나만의요리꿀팁!!</strong></label>
                              <br>
                              <textarea id="tip" name="tip" class="form-control" placeholder="예)고기는 전날 양념해두면 잡내를 잡을 수 있습니다" style="width:500px; resize:none"></textarea>
                           </td>
                        </tr>
                        <br> 
                        <tr>
                           <td>
                           <br>
                              <label for="writer"><strong>작성자</strong></label>
                              <input type="text" id="writer" name="writer" class="form-control" title="작성자를 입력하세요." style="width:200px;resize:none;" value="${member.userId}" />
                           <br><br></td>
                        <tr>
                           <td align="center">                  
                              <button class="btn btn-primary" type="submit" id="recipe_write">작성 완료</button>   
                           </td>
                        </tr>   
                     </c:if>
                     <c:if test="${member.userId == null}">
                        <p>로그인 후에 작성하실 수 있습니다.</p>
                     </c:if>
                     
                  </tbody>         
               </table>
            </form>
            
         </section>
         <hr />
      </div>
      <%@include file="footer.jsp" %>
   </body>
</html>