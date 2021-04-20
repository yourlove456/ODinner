<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>필요없어!</title>
<style>
*{
	margin:0;
	padding:0;
}

ul,li{list-style:none;}
.slide{height:100px;overflow:hidden;}
.slide ul{position:relative;height:100%;}
.slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 16s infinite;}
.slide li:nth-child(1){background:#ffa;animation-delay:0s}
.slide li:nth-child(2){background:#faa;animation-delay:4s}
.slide li:nth-child(3){background:#afa;animation-delay:8s}
.slide li:nth-child(4){background:#aaf;animation-delay:12s}
    /* 100 / 8 = 12.5 */
@keyframes fade {
	0% {opacity:0;}
    5% {opacity:1;}
   	25% {opacity:1;}
    30% {opacity:0;}
    100% {opacity:0;}
}
</style>
</head>
<body>
  <div class="slide">
    <ul>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>
</body>
</html>