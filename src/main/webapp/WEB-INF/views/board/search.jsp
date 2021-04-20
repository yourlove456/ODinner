<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 이미지 불러오기 -->
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<link href="${Path}/resources/css/nav_top.css" rel="stylesheet"/>
       
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <style>
  #food { float: center; width: 1300px; height: 260px; padding: 1%; }
  .food.custom-state-active { background: #eee; }
  .food li { float: left; width: 96px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center; }
  .food li h5 { margin: 0 0 0.4em; cursor: move; }
  .food li a { float: right; }
  .food li img { width: 100%; cursor: move; }
 
  #plate { border:0px; float: center; width: 920px; height: 140px; padding: 1%; background-image: url("/resources/images/food_image/plate_2.png"); background-color: rgba(255,255,255,0.1);}
  #plate h4 { line-height: 16px; margin: 0 0 0.4em; }
  #plate .gallery h5 { display: none; }
  
  /* 오늘 뭐해먹지 배경부분 */
  /* .entry{width:1000px; height:380px; background-image: url("/resources/images/pen_6.png")} */
  h1.title{text-shadow:1px 1px 2px #666666; color:#ffcc99; padding-top:107px; text-align:center;}
  
  #center { height:40px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto; }
ul.food ui-helper-reset ui-helper-clearfix {
  width: 300px;
  margin-left: 800%;
  margin-right: auto;
}
  a#right{float:right;}
  /* #keywordInput{margin-left:100px;} */
  pre{color:black; font-size:15px; background-color:unset; border:0px; font-family: sans-serif; margin-left:30px;}
  span#big{color:red; font-size:90px; font-style:italic;}
  span#small{color:#9966ff; font-size:15px;}
  p#pp{color:#ffcc66; font-size:40px; margin-left:70px;}
  .search_food{ float:right; margin-right:180px; border:0; border-radius:70%; overflow:hidden; background-color: none;}
  .radius{width:150px; height:150px; object-fit:cover;}
  button.search_food:focus{ 	
    border: none;
    outline:none;
    }

  </style>
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(function() {
 
    // 식재료와 접시 생성
    var $food = $( "#food" ),
      $plate = $( "#plate" );
 
    // Let the food items be draggable : 식재료에 드래그 속성 설정
    $( "li", $food ).draggable({
      cancel: "a.ui-icon", 
      revert: "invalid", 
      containment: "document",
      helper: "clone",
      cursor: "move"
    });
 
    // Let the plate be droppable, accepting the food items : 식재료들을 접시에 떨어뜨리도록 한다.
    $plate.droppable({
      accept: "#food > li",
      classes: {
        "ui-droppable-active": "ui-state-highlight"
      },
      drop: function( event, ui ) {
        deleteImage( ui.draggable );
      }
    });
 
    // Let the food be droppable as well, accepting items from the plate : 식재료들을 잘 떨어뜨리게 해라 접시 안에다가
    $food.droppable({
      accept: "#plate li",
      classes: {
        "ui-droppable-active": "custom-state-active"
      },
      drop: function( event, ui ) {
        recycleImage( ui.draggable );
      }
    });
 
    // Image deletion function : 이미지 삭제 기능
    var recycle_icon 
    function deleteImage( $item ) {
      $item.fadeOut(function() {
        var $list = $( "ul", $plate ).length ?
          $( "ul", $plate ) :
          $( "<ul class='food ui-helper-reset'/>" ).appendTo( $plate );
 
        $item.find( "a.ui-icon-plate" ).remove();
        $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
          $item
            .animate({ width: "60px" })
            .find( "img" )
              .animate({ height: "50px" });
        });
      });
    }
 
    // Image recycle function : 이미지 복구(재활용?) 기능
    var plate_icon 
    function recycleImage( $item ) {
      $item.fadeOut(function() {
        $item
          .find( "a.ui-icon-refresh" )
            .remove()
          .end()
          .css( "width", "96px")
          .append( plate_icon )
          .find( "img" )
            .css( "height", "72px" )
          .end()
          .appendTo( $food )
          .fadeIn();
      });
    }
 
    // Image preview function, demonstrating the ui.dialog used as a modal window : 이미지 미리보기 기능
    function viewLargerImage( $link ) {
      var src = $link.attr( "href" ),
        title = $link.siblings( "img" ).attr( "alt" ),
        $modal = $( "img[src$='" + src + "']" );
 
      if ( $modal.length ) {
        $modal.dialog( "open" );
      } else {
        var img = $( "<img alt='" + title + "' width='60px' height='50px' style='display: none; padding: 8px;' />" )
          .attr( "src", src ).appendTo( "body" );
        setTimeout(function() {
          img.dialog({
            title: title,
            width: 400,
            modal: true
          });
        }, 1 );
      }
    }
 
  // 접시안에 담긴 식재료 이미지들을 모두 검색하는 기능
   $(function(){
       $('#searchBtn').click(function() {
          var selected = document.querySelectorAll("#plate>ul>li");
           for(var i = 0; i < selected.length; i++){
                  ingredient = selected[i].getAttribute("id")
                  $("form").append('<input type="text" name="searchList['+ i + ']" value=' +  ingredient + ' />');
                }
       });
    });
  });
</script>

  
  
<title>재료로 음식 찾기</title>
</head>

<body>
 <div>
   <%@include file="nav.jsp" %>
   </div>
   
   <br>
   <br>
   <br>
   <p id="pp"><b><span id="big">오</span>늘 <span id="big">디너</span>&nbsp;뭐 해먹지?</b></p><br><br>
   
         <form name = "foodForm" action = "/board/list" method = "GET">
         <button id="searchBtn" type="submit" class="search_food" width="150px;" height="150px;" >
         <img class="radius"  src="<spring:url value='/resources/images/food_image/search_3.png'/>">
         
         </button>
         </form>
         
   <pre>
   점심에 이어 저녁 메뉴까지도 고민하지 마세요!
   원하는 식재료들 조합으로 음식메뉴를 추천해드립니다.
   
   <span id="small">먹고싶은 식재료를 드래그하여 접시안에 담으세요.</span>
   </pre>
   <div align="center">
    <!-- 여기 -->
   <div id="plate" class="ui-widget-content ui-state-default" align="center">
</div><br><br><br>
   <br style="clear:both">

<label for="center"  class="col-sm-2 control-label"></label>
<div id="cen" class="ui-widget ui-helper-clearfix">
 
<ul id="food" class="food ui-helper-reset ui-helper-clearfix" >
  <li class="ui-widget-content ui-corner-tr" id="밀가루">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/flour.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="쌀">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/rice.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="빵" >
    <img class="ui-widget-header"  width="92px" height="72px" src="<spring:url value='/resources/images/food_image/bread.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="고등어">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/fish_2.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="연어">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/salmon.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="새우">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/shrimp.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="돼지고기">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/pork.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="소고기">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/beef.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="닭가슴살">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/chest.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="햄">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/ham.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="양상추">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/vegetable.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="고추">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/pepper.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="달걀">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/egg.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="당근">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/carrot.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="옥수수">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/corn.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="양파">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/onion.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="우유">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/milk.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="치즈">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/cheese.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="아보카도">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/abo.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="사과">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/apple.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="딸기">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/strawberry.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="토마토">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/tomato.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="오이">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/cucumber.png'/>">
  </li>
  <li class="ui-widget-content ui-corner-tr" id="김치">
    <img class="ui-widget-header" width="92px" height="72px" src="<spring:url value='/resources/images/food_image/kimchi.png'/>">
  </li>
</ul>

</div>

 

          <!-- 검색창 부분 -->         
            </div>
          <%@include file="footer.jsp" %>

          
</body>
</html>