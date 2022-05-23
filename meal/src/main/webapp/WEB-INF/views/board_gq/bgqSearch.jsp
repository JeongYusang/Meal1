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
	width: 70%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	text-align: center;
	background-color: white;
	font-size: 20px;
	border-collapse: collapse;
}

.stable-striped tr:nth-child(even){background-color: #f2f2f2;}

.stable-striped tr, td {
padding: 20px;
}

#top-table {
	text-align: center;
	border-collapse: collapse;
	background-color: #FFF0F0s;
}
#top-table tr, ths{
padding: 20px;
}

#body-table {
	text-align: center;
}

tr.border-bottom td {
	border-bottom: 1px black;
}

#write {
	float: right;
	text-align: center;
	margin-right: 50px;
}

#tabletitle {
	margin-left: 50px;
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
					<th width="50px">번호</th>
					<th width="200px">제목</th>
					<th width="200px">날짜</th>
					<th width="200px">답변</th>
				</tr>
			</thead>
			<tbody id="body-table">
				<tr class="border-bottom">
					<td>1</td>
					<td>테스트 제목</td>
					<td>2022-04-17</td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td>2</td>
					<td>테스트 제목</td>
					<td>2022-04-17</td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td>3</td>
					<td>테스트 제목</td>
					<td>2022-04-17</td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td>4</td>
					<td>테스트 제목</td>
					<td>2022-04-17</td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td>5</td>
					<td>테스트 제목</td>
					<td>2022-04-17</td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td>6</td>
					<td>테스트 제목</td>
					<td>2022-04-17</td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td>7</td>
					<td>테스트 제목</td>
					<td>2022-04-17</td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td>8</td>
					<td>테스트 제목</td>
					<td>2022-04-17</td>
					<td>답변 대기중</td>
				</tr>
				<tr class="border-bottom">
					<td>9</td>
					<td>테스트 제목</td>
					<td>2022-04-17</td>
					<td>답변 대기중</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<hr>
	<br>
	<button id="write">
		<a href="${contextPath}/user/mygoodsquestionwrite.do">글쓰기</a>
	</button>
	<div class="center">
		<div class="pagination">
			<a href="#">&laquo;</a> <a href="#">1</a> <a href="#">2</a> <a
				href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
			<a href="#">&raquo;</a>
		</div>
	</div>
</body>
</html>