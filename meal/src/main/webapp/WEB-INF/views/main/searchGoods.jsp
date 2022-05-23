<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>검색결과</title>
<meta name="viewport" content="width=device-width, initial-scale=1">




<style>
.maingoodslist{
width:1280px;
position:inline-flex
position:relative;
text-align: center;
}
.maingList{
width:100%;
position:inline-flex;

}
.mangList .ul li a{
display: inline-block;}
.maingList .ul li, .maingoodslist .ol li {
display: inline-block;
text-align: center;
}
#main-wrap .img {
	display: inline-block;
	margin: 0 10px 0 10px;
	
}


#main-wrap a:link {
	text-decoration: none;
	color: black;
}

#main-wrap a:visited {
	text-decoration: none;
	color: black;
}

#main-wrap a:active {
display:block;
	text-decoration: none;
	color: black;
}

#main-wrap a:hover {
	text-decoration: none;
	color: black;
}

#main-wrap a{
color: black;
}

#main-wrap .b{
margin-left:40px;
text-align:center;
}
#main-wrap{
position:relative;
display:flex;
justify-content: center;
align-items: center;
width:1280px;
}
.w3-bar{
margin-left: 50px;
}
</style>
</head>
<body>

<div id="main-wrap">


	<div class="maingoodslist">
	<b class="b1" style="font-size: 32px">'두부' 검색 결과</b>
		<br>
<div class="w3-bar">
  <a href="#" class="w3-bar-item">가격낮은순</a>
  <a href="#" class="w3-bar-item">가격높은순</a>
  <a href="#" class="w3-bar-item">신상품순</a>
  <a href="#" class="w3-bar-item">평점높은순</a>
</div>
	<div class="maingList">
		<ul class="ul">
			<li><a href="${contextPath }/main/goodsDetail.do"><img src="${contextPath}/resources/image/new1.png" width="250px"
					height="250px"><br>서울식 소불고기 전골<br>19800월</a></li>
			<li><a href="${contextPath }/main/goodsDetail.do"><img src="${contextPath}/resources/image/new2.png" width="250px"
					height="250px"><br>볼케이노순두부전골<br>18900원</a></li>
			<li><a href="${contextPath }/main/goodsDetail.do"><img src="${contextPath}/resources/image/new3.png" width="250px"
					height="250px"><br>피스타<br>10000원</a></li>
			<li><a href="${contextPath }/main/goodsDetail.do"><img src="${contextPath}/resources/image/new4.PNG" width="250px"
					height="250px"><br>포크찹 스테이크<br>30000월</a></li>
		</ul>
		
	</div>
	</div>
	</div>


</body>
</html>



