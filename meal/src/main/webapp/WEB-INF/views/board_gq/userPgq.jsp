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
	width: 100%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	text-align: center;
	background-color: white;
	font-size: 18px;
	border-collapse: collapse;
	color: black;
}

.stable-striped tr:nth-child(even) {
	background-color: #FFF6FA;
}

.stable-striped tr, td {
	padding: 20px;
}

#top-table {
	text-align: center;
	border-collapse: collapse;
	background-color: #FFF0F0s;
	color: black;
}

#top-table tr, ths {
	padding: 20px;
}

#body-table {
	text-align: center;
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
	margin: 10px;
	font-size: 32px;
	color: #FD6EB0;
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
</style>
</head>
<body>
	<div id="tabletitle">
		<h1>상품문의사항</h1>
	</div>
	<hr>
	<br>
	<br>

	<div class="table-container">
		<table class="stable-striped">
			<thead>
				<tr id="top-table">
					<th width="70px">상품이미지</th>
					<th width="250px">상품명</th>
					<th width="300px">제목</th>
					<th width="200px">날짜</th>
					<th width="150px">답변</th>
				</tr>
			</thead>
			<tbody id="body-table">
				<tr class="border-bottom">
					<td><img src="${contextPath}/resources/image/new1.png"></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">많이 매운가요?</a></td>
					<td><a href="#">2022-04-17</a></td>
					<td>답변 대기중</td>
				</tr>
					<tr class="border-bottom">
					<td><img src="${contextPath}/resources/image/new1.png"></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">많이 매운가요?</a></td>
					<td><a href="#">2022-04-17</a></td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td><img src="${contextPath}/resources/image/new1.png"></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">많이 매운가요?</a></td>
					<td><a href="#">2022-04-17</a></td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td><img src="${contextPath}/resources/image/new1.png"></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">많이 매운가요?</a></td>
					<td><a href="#">2022-04-17</a></td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td><img src="${contextPath}/resources/image/new1.png"></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">많이 매운가요?</a></td>
					<td><a href="#">2022-04-17</a></td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td><img src="${contextPath}/resources/image/new1.png"></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">많이 매운가요?</a></td>
					<td><a href="#">2022-04-17</a></td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td><img src="${contextPath}/resources/image/new1.png"></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">많이 매운가요?</a></td>
					<td><a href="#">2022-04-17</a></td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td><img src="${contextPath}/resources/image/new1.png"></td>
					<td><a href="#">서울식 불고기 전골</a></td>
					<td><a href="#">많이 매운가요?</a></td>
					<td><a href="#">2022-04-17</a></td>
					<td>답변 대기중</td>
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