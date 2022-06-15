<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="section" value="0" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>취소/반품/교환 내역</title>
<style>
#cancelmain-wrap {
	display: block;
	margin-left: 50px;
}

#cancelmain-wrap .cancel-table {
	width: 100%;
	text-align: center;
	font-size: 20px;
	border-collapse: collapse;
	background-color: white;
}

.cancel-table img {
	width: 120px;
	height: 120px;
}

#cancelmain-wrap .cancel-table tr {
	border-bottom: 1px solid black;
}

tr.cancellist td {
	border-bottom: 1px solid gray;
}

#cancelmain-wrap .cancel-table #state {
	background-color: #ffc0cf;
	color: white;
}

#maintitle {
	font-size: 50px;
	color: #FD6EB0;
	padding: 0px;
	margin: 0px;

}
#empty{
height: 150px;
}

#top-table{
background: #ffc0cf;
color: white;
}
</style>
</head>
<body>
	<div id="cancelmain-wrap">
		<h1 id="maintitle">취소/반품/교환 내역</h1>
		<hr>
		<br>

		<table class="cancel-table">
			<thead>
				<tr id="top-table">
					<th width="100px">상품이미지</th>
					<th width="200px">상품이름</th>
					<th width="100px">갯수/가격</th>
					<th width="150px">취소일</th>
					<th width="150px">취소상태</th>
				</tr>
			</thead>

			<c:choose>
			<c:when test="${empty OrderVO}">
					<tr>
						<td colspan=5 class="empty"><strong>취소된 주문이 없습니다.</strong></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="OrderList" items="${OrderList}">
						<tr class="orderlist">
							<td><a
								href="${contextPath}/goods/goodsDetail.do?g_id=${OrderList.g_id}">
									<img
									src="${contextPath}/download1.do?g_id=${OrderList.g_id}&cate=main"
									onerror="this.src='${contextPath}/resources/image/not for sale.jpg'">
							</a></td>
							<td id="title"><a
								href="${contextPath}/goods/goodsDetail.do?g_id=${OrderList.g_id}">${OrderList.g_name}</a></td>
							<td>${OrderList.o_goods_qty}개/${OrderList.o_goods_price}원</td>
							<td>${OrderList.pay_order_time}</td>
							<td><b id="state">${OrderList.delivery_state}</b>
							<br><a href="${contextPath}/order/selectOrder.do?o_id=${OrderList.o_id}">취소상세</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan=8 class="fixed"><c:forEach var="page" begin="1"
						end="9" step="1">
						<c:if test="${section >0 && page==1 }">
							<a
								href="${contextPath}/order/selectCanceledOrders.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
						</c:if>
						<a
							href="${contextPath}/order/selectCanceledOrders.do?section=${section}&pageNum=${page}">${(section)*10 +page}
						</a>
						<c:if test="${page ==10 }">
							<a
								href="${contextPath}/order/selectCanceledOrders.do?section=${section}+1&pageNum=${section*10}+1">next</a>
						</c:if>
					</c:forEach></td>
			</tr>


		</table>

	</div>
</body>
</html>