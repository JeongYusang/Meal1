
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<c:set var="section" value="0" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1문의</title>
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
	alert('${message}');
}
</script>
</c:if>
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
	color: black;
	text-align: center;
	border-collapse: collapse;
	background-color: #FFF0F0s;
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

#write a {
	float: right;
	text-align: center;
	background-color: #ffc0cb;
	font-size: 14px;
	border: 1px;
	color: white;
	padding: 10px;
	margin-bottom: 10px;
	'
}

#tabletitle {
	margin: 10px;
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
</style>
</head>
<body>
	<div id="tabletitle">
		<h1>1대1문의하기</h1>
	</div>
	<hr>
	<br>
	<br>

	<div class="table-container">
		<table class="stable-striped">
			<thead>
				<tr id="top-table">
					<th width="50px">번호</th>
					<th width="200px">작성자</th>
					<th width="400px">제목</th>
					<th width="200px">날짜</th>

					<th width="200px">답변여부</th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${empty board1}">
					<tr>
						<td colspan=5 class="fixed"><strong>작성된 글이 없습니다.</strong></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${board1}">
						<label for="border-bottom"></label>
						<tr class="border-bottom">





							<c:choose>
							<c:when test="${not empty adminInfo}">
									<td>${item.b_1_id}</td>
									<td>${item.u_id}${item.s_id}</td>
									<td><a href="${contextPath}/board1/b1Detail.do?b_1_id=${item.b_1_id}">${item.title}</a></td>
									<td>${item.creDate}</td>
								</c:when>
								
								<c:when test="${empty item.secret or not empty item.secret and not empty memberInfo and item.u_id eq memberInfo.u_id}">
									<td>${item.b_1_id}</td>
									<td>${item.u_id}${item.s_id}</td>
									<td><a href="${contextPath}/board1/b1Detail.do?b_1_id=${item.b_1_id}">${item.title}</a></td>
									<td>${item.creDate}</td>
								</c:when>

								<c:when test="${empty item.secret or not empty item.secret and not empty sellerInfo and item.s_id eq sellerInfo.s_id}">
									<td>${item.b_1_id}</td>
									<td>${item.u_id}${item.s_id}</td>
									<td><a href="${contextPath}/board1/b1Detail.do?b_1_id=${item.b_1_id}">${item.title}</a></td>
									<td>${item.creDate}</td>
									</c:when>
								<c:when test="${not empty item.secret and item.u_id != memberInfo.u_id and empty adminInfo}">
									<td>${item.b_1_id}</td>
									<td>비밀글</td>
									<td>비밀글입니다</td>
									<td>${item.creDate}</td>
								</c:when>
								<c:when test="${not empty item.secret and item.s_id != sellerInfo.s_id and empty adminInfo}">
									<td>${item.b_1_id}</td>
									<td>비밀글</td>
									<td>비밀글입니다</td>
									<td>${item.creDate}</td>
								</c:when>
								
								
							</c:choose>
							<td>${item.compare}</td>
						</tr>

					</c:forEach>
				</c:otherwise>
			</c:choose>

			</tbody>
		</table>
		<center>
		<c:forEach var="page" begin="1"
						end="9" step="1">
						<c:if test="${section >0 && page==1 }">
							<a
								href="${contextPath}/board1/selectBoard1List.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
						</c:if>
						<a
							href="${contextPath}/board1/selectBoard1List.do?section=${section}&pageNum=${page}">${(section)*10 +page}
						</a>
						<c:if test="${page ==10 }">
							<a
								href="${contextPath}/board1/selectBoard1List.do?section=${section}+1&pageNum=${section*10}+1">next</a>
						</c:if>
					</c:forEach>
					</center>


	</div>

	<hr>
	<br>
	<c:if test="${empty adminInfo }">
	<div id="write">
		<a href="${contextPath }/board1/board1Write.do">글쓰기</a>
	</div>
	</c:if>
</body>
</html>