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
<title>상품 조회하기</title>
</head>
<body>
<div class="main-container">
				<div id=maintitle>상품관리</div>
				<div class="table-container">
					<table id="stable-striped">
						<thead>
							<tr id="top-table">
								<th width="20%"></th>
								<th width="20%"></th>
								<th width="20%"></th>
								<th width="20%"></th>
								<th width="20%"></th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty goodsList}">
								<tr>
									<td colspan=5 class="fixed"><strong>등록된 상품이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:when test="${not empty goodsList}">
								
								<c:forEach var="item" items="${goodsList}">
									<label for="border-bottom"></label>
									<tr class="border-bottom">
										<td>${item.g_id}</td>
										<td>${item.g_name}</td>
										<td>${item.g_cate2}</td>
										<td>${item.g_amount}</td>
										<td>${item.g_price}</td>
										<td>${item.g_state}</td>
										<!-- 추후 표기방식 변경 예정 -->
										<td>${item.g_saleWon}, ${item.g_salePer}</td>
										<td>
											<fmt:formatDate value="${item.g_saleDate1}" type="Date" dateStyle="short"/> ~ 
											<fmt:formatDate value="${item.g_saleDate2}" type="Date" dateStyle="short"/>
										</td>
										<td>${item.g_inbun}</td>
										<td>${item.g_bang}</td>
										<td><fmt:formatDate value="${item.g_creDate}" type="Date" dateStyle="short" /></td>
										<td>
											<a href="${contextPath}/goods/updateGoodsForm.do?g_id=${item.g_id}">수정하기</a>
											<br>
											<br>
											<a href="${contextPath}/goods/deleteGoods.do?g_id=${item.g_id}" onClick="delOk()">삭제하기</a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
					<center>
						<div class="" id="pagination">
							<c:forEach var="page" begin="1" end="9" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/goods/selectGoodsPage.do?section=${section}-1&pageNum=${(section-1)*12+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/goods/selectGoodsPage.do?section=${section}&pageNum=${page}">${(section)*12 +page}
								</a>
								<c:if test="${page ==10 }">
									<a
										href="${contextPath}/goods/selectGoodsPage.do?section=${section}+1&pageNum=${section*12}+1">next</a>
								</c:if>
							</c:forEach>
						</div>
					</center>

				</div>
			</div>
</body>
</html>