<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의</title>
<style>
.stable-striped {
	margin-left: 20px;
	text-align: center;
	background-color: white;
	font-size: 20px;
	border-collapse: collapse;
}

.stable-striped tr:nth-child(even) {
	background-color: #FFF6FA;
}

.stable-striped tr, td {
	padding: 5px;
}

#top-table {
	text-align: center;
	border-collapse: collapse;
	background-color: #FFF0F0s;
	color: black;
}

#top-table tr, ths {
	padding: 5px;
}

#body-table {
	text-align: center;
		color: black;
}

tr.border-bottom td {
	border-bottom: 1px black;
}

#write a{
	float: right;
	text-align: center;
	background-color: #ffc0cb;
	font-size: 14px;
	border: 1px;
	color: white;
	padding: 10px;
	margin-bottom: 10px;'
}

#tabletitle {
	color: #FD6EB0;
	font-size: 32px;
}

.pagination {
	margin: auto;
}

.pagination a {
	font-size: 22px;
	border: 1px solid #ddd;
}

.center {
	text-align: center;
}

.border-bottom img {
	width: 90px;
	height: 90px;
}

.checked {
	color: #ffc0cb;
}

</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
	<div id="tabletitle">
		<h1>상품후기</h1>
	</div>
	<hr>
	<br>
	<br>

	<div class="table-container">
		<table class="stable-striped">
			<thead>
				<tr id="top-table">
					<th width="50px">번호</th>
					<th width="200px">별점</th>
					<th width="400px">상품이름</th>
					<th width="500px">글 제목</th>
					<th width="200px">날짜</th>
				</tr>
			</thead>
			<tbody id="body-table">
				<tr class="border-bottom">
					<td>1</td>
					<td><a href="#"><img
							src="${contextPath}/resources/image/new1.png"></a><br> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
						<span class="fa fa-star"></span> <span class="fa fa-star"></span>
						<span class="fa fa-star"></span></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">최악이에요 다시는 안시킵니다</a></td>
					<td>2022-04-17</td>

				</tr>
				<tr class="border-bottom">
					<td>2</td>
					<td><a href="#"><img
							src="${contextPath}/resources/image/new1.png"></a><br> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">너무너무너무너무너무너무 맛있어요</a></td>
					<td>2022-04-17</td>
				</tr>
				<tr class="border-bottom">
					<td>3</td>
					<td><a href="#"><img
							src="${contextPath}/resources/image/new1.png"></a><br> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">맛있어요</a></td>
					<td>2022-04-17</td>
				</tr>
				<tr class="border-bottom">
					<td>4</td>
					<td><a href="#"><img
							src="${contextPath}/resources/image/new1.png"></a><br> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td>누구보다 빠르게 남들과는 다르게 색다르게 택배받았습니다</td>
					<td>2022-04-17</td>
				</tr>
				<tr class="border-bottom">
					<td>5</td>
					<td><a href="#"><img
							src="${contextPath}/resources/image/new1.png"></a><br> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
						<span class="fa fa-star"></span></td>
					<td>서울식 불고기 전골</td>
					<td>낫베드하네요</td>
					<td>2022-04-17</td>
				</tr>
				<tr class="border-bottom">
					<td>6</td>
					<td><a href="#"><img
							src="${contextPath}/resources/image/new1.png"></a><br> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
						<span class="fa fa-star"></span></td>
					<td>서울식 불고기 전골</td>
					<td>가성비 제품입니다</td>
					<td>2022-04-17</td>
				</tr>
				<tr class="border-bottom">
					<td>7</td>
					<td><img src="${contextPath}/resources/image/new1.png"><br>
						<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
						<span class="fa fa-star"></span></td>
					<td>서울식 불고기 전골</td>
					<td>맛있어요</td>
					<td>2022-04-17</td>
				</tr>
				<tr class="border-bottom">
					<td>8</td>
					<td><img src="${contextPath}/resources/image/new1.png"><br>
						<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
						<span class="fa fa-star"></span></td>
					<td>서울식 불고기 전골</td>
					<td>맛있어요</td>
					<td>2022-04-17</td>
				</tr>
				<tr class="border-bottom">
					<td>9</td>
					<td><img src="${contextPath}/resources/image/new1.png"><br>
						<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
						<span class="fa fa-star"></span></td>
					<td>서울식 불고기 전골</td>
					<td>맛있어요</td>
					<td>2022-04-17</td>
				</tr>
			</tbody>
		</table>
	</div>

	<hr>
	<br>
	<div id="write">
		<a href="${contextPath}/user/mygoodsquestionwrite.do">글쓰기</a>
	</div>
	<div class="center">
		<div class="pagination">
			<a href="#">&laquo;</a> <a href="#">1</a> <a href="#">2</a> <a
				href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
			<a href="#">&raquo;</a>
		</div>
	</div>
</body>
</html>