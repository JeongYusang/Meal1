<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="section" value="0" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.main-container {
    text-align: center;
}

.table-container {
    font-size: 20px;
    font-weight: 400;
    display: flex;
    flex-direction: column;
    align-items: center;
}

div#maintitle {
    text-align: center;
    font-size: 40px;
    font-weight: 900;
}

table#stable-striped {
    border: 5px solid #00000024;
    border-radius: 5px;
}
th#thID {
    border: 5px solid #dbdbdb;
    margin: 0px;
    padding: 0px;
}
</style>
</head>
<body>
<div class="main-container">
				<div id=maintitle>공지사항</div>
				<div class="table-container">
					<table id="stable-striped">
						<thead>
							<tr id="top-table">
								<th width="216px">등록번호</th>
								<th width="216px">작성자</th>
								<th width="216px">제   목</th>
								<th width="216px">내용</th>
								<th width="216px">등록날짜</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty boardAList}">
								<tr>
									<td colspan=5 class="fixed"><strong>등록된 공지사항이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:when test="${not empty boardAList}">
								<c:forEach var="item" items="${boardAList}" begin="0" end="10">
								<c:if test="${item.cate eq '공지사항'}">
									<label for="border-bottom"></label>
									<tr class="border-bottom" onClick="location.href='${contextPath}/boardA/boardADetail.do?b_a_id=${item.b_a_id}&cate=공지사항'">
										<td>${item.b_a_id}</td>
										<td>${item.a_id}</td>
										<td>${item.title}</td>
										<td>${item.content}</td>
										<td>${item.creDate}</td>
									</tr>
								</c:if>
								</c:forEach>
								</c:when>
						</c:choose>
					</table>
					<center>
						<div class="" id="pagination">
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/boardA/boardAList.do?section=${section}-1&pageNum=${(section-1)*12+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/boardA/boardAList.do?section=${section}&pageNum=${page}">${(section)*12 +page}
								</a>
								<c:if test="${page ==10 }">
									<a
										href="${contextPath}/boardA/boardASPList.do?section=${section}+1&pageNum=${section*12}+1">next</a>
								</c:if>
							</c:forEach>
						</div>
					</center>

				</div>
			</div>
</body>
</html>