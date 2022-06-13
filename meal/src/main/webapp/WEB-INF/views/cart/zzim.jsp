<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<style>

.wishitems-ul li {
display: inline-flex;
}
.wishitems-ul li {
display: inline-flex;
}
.wishitems-ul{
display: inline-flex;
}
#wishlist h1 {
margin-left: 40px;
font-size: 36px;
margin-bottom: 0px;
}
.imagegoods{
width: 200px;
height: 200px; 
postiion : relative;
}
.Zzimdelbtn {
  position: absolute;
}
.x_img {
    height: 20px;
    width: 20px;
    left: 190px;
    top: -10px;
    position: absolute;
}
</style>
</head>
<body>
	<div id="wishlist">
	<h1>찜 목록</h1>
	<hr>
		
		<div class="wishitems">
		<c:forEach var="ZzimList" items="${ZzimList}">
			<ul class="wishitems-ul">
				<li><a href="${contextPath }/goods/goodsDetail.do?g_id=${ZzimList.g_id}">
				<img class="imagegoods" src="${contextPath}/download1.do?g_id=${ZzimList.g_id}&cate=main" />
						<br>${ZzimList.g_name}<br>${ZzimList.g_price}원</a> <a class= Zzimdelbtn
               href="${contextPath}/cart/removeZzimGoods.do?c_id=${ZzimList.c_id}"
               class="button"> <img class = "x_img" src="${contextPath}/resources/image/cross.png"></a>
              </li>
			</ul>
				</c:forEach>
		</div>
	
	</div>
</body>
</html>