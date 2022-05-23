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
.wishitems-ul{
display: inline-flex;
}
#wishlist h1 {
margin-left: 40px;
font-size: 36px;
margin-bottom: 0px;
} 
</style>
</head>
<body>
	<div id="wishlist">
	<h1>찜 목록</h1>
	<hr>
		<div class="wishitems">
			<ul class="wishitems-ul">
				<li><a href="${contextPath }/main/goodsDetail.do"><img
						src="${contextPath}/resources/image/new1.png" width="200px"
						height="200px"><br>서울식 소불고기 전골<br>19800월</a></li>
			</ul>
			<ul class="wishitems-ul">
				<li><a href="${contextPath }/main/goodsDetail.do"><img
						src="${contextPath}/resources/image/new1.png" width="200px"
						height="200px"><br>서울식 소불고기 전골<br>19800월</a></li>
			</ul>
			<ul class="wishitems-ul">
				<li><a href="${contextPath }/main/goodsDetail.do"><img
						src="${contextPath}/resources/image/new1.png" width="200px"
						height="200px"><br>서울식 소불고기 전골<br>19800월</a></li>
			</ul>
			<ul class="wishitems-ul">
				<li><a href="${contextPath }/main/goodsDetail.do"><img
						src="${contextPath}/resources/image/new1.png" width="200px"
						height="200px"><br>서울식 소불고기 전골<br>19800월</a></li>
			</ul>
			<ul class="wishitems-ul">
				<li><a href="${contextPath }/main/goodsDetail.do"><img
						src="${contextPath}/resources/image/new1.png" width="200px"
						height="200px"><br>서울식 소불고기 전골<br>19800월</a></li>
			</ul>
			<ul class="wishitems-ul">
				<li><a href="${contextPath }/main/goodsDetail.do"><img
						src="${contextPath}/resources/image/new1.png" width="200px"
						height="200px"><br>서울식 소불고기 전골<br>19800월</a></li>
			</ul>
			<ul class="wishitems-ul">
				<li><a href="${contextPath }/main/goodsDetail.do"><img
						src="${contextPath}/resources/image/new1.png" width="200px"
						height="200px"><br>서울식 소불고기 전골<br>19800월</a></li>
			</ul>
			<ul class="wishitems-ul">
				<li><a href="${contextPath }/main/goodsDetail.do"><img
						src="${contextPath}/resources/image/new1.png" width="200px"
						height="200px"><br>서울식 소불고기 전골<br>19800월</a></li>
			</ul>
		
		</div>
	</div>
</body>
</html>