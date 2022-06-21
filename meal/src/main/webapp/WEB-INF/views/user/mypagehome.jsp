<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="section" value="0" />



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>상품 상세 정보</title>
<c:if test='${ not empty message}'>
	<script>
		window.onload = function() {
			result();
		}

		function result() {
			alert("${message}");
		}
	</script>
</c:if>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	});
</script>

<style>
#main {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

ul.tabs {
	text-align: center;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	text-align: center;
	display: inline-block;
	color: black;
	cursor: pointer;
	width: 200px;
	height: 200px;
	border: 1px solid;
	margin-right: 30px;
	line-height: 200px;
	font-size: 40px;
	line-height: 200px
}

ul.tabs li.current {
	text-align: center;
	font-size: 50px;
	border: 5px solid;
	background-color: #ffc0cf;
	color: white;
}

.tab-content {
	display: none;
	border: 1px solid;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}

.detail {
	text-align: center;
	display: inline-block;
	width: 1100px;
	height: 600px;
}

.detail1 {
	text-align: center;
	display: inline-block;
}

#main-wrap {
	color: black;
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
	display: block;
	text-decoration: none;
	color: black;
}

#main-wrap a:hover {
	text-decoration: none;
	color: black;
}

#main-wrap a {
	color: black;
}

.checked {
	color: orange;
}

#myinfo-wrap {
	display: inline;
}

#myinfo-wrap img {
	width: 150px;
	heigth: 150px;
	display: inline;
	float: left;
}

.texts {
	color: white;
	font-size: 34px;
	line-height: 150px;
	background: #ffc0cf;
}

.name {
	text-align: left;
}

.milage {
	float: right;
}

.tab-container {
	display: inline-block;
	margin-top: 50px;
	margin-left: 100px;
	margin-bottom: 50px;
}

.description-wrap {
	display: inline;
}

.orderlist {
	text-align: center;
}

.review-table {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	background-color: white;
	font-size: 20px;
	border-collapse: collapse;
}

.review-table img {
	height: 100px;
	width: 130px;
	display: inline;
}

#top-table {
	border-bottom: 1px solid black;
}

#state {
	background-color: #ffc0cf;
	color: white;
}

tr.orderlist td {
	border-bottom: 1px solid gray;
}

.texts b {
	text-transform: capitalize;
	font-size: 40px;
}
</style>

</head>
<body>
	<div id="main-wrap1">
		<div id="myinfo-wrap">
			<div>
				<c:if test="${memberInfo.u_rank == 'gold'}">
					<img src="${contextPath}/resources/image/gold-medal.png" />
				</c:if>
				<c:if test="${memberInfo.u_rank == 'silver'}">
					<img src="${contextPath}/resources/image/silver-medal.png" />
				</c:if>
				<c:if test="${memberInfo.u_rank == 'bronze'}">
					<img src="${contextPath}/resources/image/bronze-medal.png" />
				</c:if>
				<ul class="texts">
					<li class="name">&nbsp;<b>[${memberInfo.u_rank}]</b>&nbsp;${memberInfo.u_name}님 환영합니다<span
						class="milage"> 마일리지:${memberInfo.u_mile}&nbsp;</span></li>
				</ul>
			</div>
		</div>
		
		
		 <div style="margin: 10px 0 0 0;">
			<div class="tab-container">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">전체</li>
					<li class="tab-link" data-tab="tab-2">결제완료</li>
					<li class="tab-link" data-tab="tab-3">배송중</li>
					<li class="tab-link" data-tab="tab-4">배송완료</li>
				</ul>
			</div>
			

			<div id="tab-1" class="tab-content current">
				<div class="detail">
					<table class="review-table">
						<thead>
							<tr id="top-table">
								<th width="150px">상품이미지</th>
								<th width="200px">상품이름</th>
								<th width="150px">갯수/결제 금액</th>
								<th width="150px">배송상태</th>
								<th width="150px"></th>
							</tr>
						</thead>


						<c:choose>
				<c:when test="${empty OrderVO}">
					<tr>
						<td colspan=5 class="fixed"><strong>주문 내역이 없습니다.</strong></td>
					</tr>
				</c:when>
							<c:otherwise>
								<c:forEach var="OrderList" items="${OrderVO}">
									<tr class="orderlist">
										<td><a href="${contextPath}/goods/goodsDetail.do?g_id=${OrderList.g_id}">
										<img src="${contextPath}/download1.do?g_id=${OrderList.g_id}&cate=main" onerror= "this.src='${contextPath}/resources/image/not for sale.jpg'"></a></td>
										<td id="title"><a href="${contextPath}/goods/goodsDetail.do?g_id=${OrderList.g_id}">${OrderList.g_name}</a></td>
										<td><c:if test = "${OrderList.o_goods_price * OrderList.o_goods_qty < 30000}">${OrderList.o_goods_qty}개/${OrderList.o_goods_price * OrderList.o_goods_qty + 3000 - OrderList.o_useMile }원</c:if>
										<c:if test = "${OrderList.o_goods_price * OrderList.o_goods_qty > 30000}">${OrderList.o_goods_qty}개/${OrderList.o_goods_price * OrderList.o_goods_qty - OrderList.o_useMile }원</c:if></td>
										<td><b id="state">${OrderList.delivery_state}</b></td>
										<td><c:if test="${OrderList.delivery_state == '주문완료'}">
												<a href="#">주문 환불</a>
											</c:if> <c:if test="${OrderList.delivery_state == '결제완료'}">
												<a href="${contextPath}/order/deleteOrder.do?o_id=${OrderList.o_id}">주문 취소하기</a>
											</c:if> <c:if test="${OrderList.delivery_state == '배송중'}">
												<a href="https://tracker.delivery/#/kr.cjlogistics/560067553920">배송 조회하기</a>
											</c:if> <c:if test="${OrderList.delivery_state == '배송완료'}">
												<c:if test="${OrderList.review == 'false'}">
													<a href="${contextPath}/boardGr/boardGrWrite.do?g_id=${OrderList.g_id}&o_id=${OrderList.o_id}">후기 작성하기</a>
												</c:if>
												<c:if test="${OrderList.review == 'true'}">
													<a href="${contextPath}/boardGr/gr_detail.do?b_gr_id=${OrderList.b_gr_id}">후기 보기</a>
												</c:if>
											</c:if><br> <a href="${contextPath}/order/OrderResult.do?parentNo=${OrderList.parentNo}">주문상세</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						
						</c:choose>
					</table>
					<c:choose>
						<c:when test="${OrderVO != null}">
							<c:forEach var="page" begin="1" end="9" step="1">
								<c:if test="${section >0 && page==1 }">
									<a href="${contextPath}/order/selectUserOrders.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a href="${contextPath}/order/selectUserOrders.do?section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page ==10 }">
									<a href="${contextPath}/order/selectUserOrders.do?section=${section}+1&pageNum=${section*10}+1">next</a>
								</c:if>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				<div class="detail">
					<table class="review-table">
						<thead>
							<tr id="top-table">
								<th width="15%">상품이미지</th>
								<th width="40%">상품이름</th>
								<th width="15%">갯수/가격</th>
								<th width="20%">배송상태</th>
							</tr>
						</thead>
						<c:choose>
						<c:when test="${empty orderMap.orderListPaid}">
								<tr>
									<td colspan=5 class="fixed"><strong>작성된 글이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="OrderMap" items="${orderMap.orderListPaid}">
									<tr class="orderlist">
										<td><a
											href="${contextPath}/goods/goodsDetail.do?g_id=${OrderMap.g_id}">
												<img
												src="${contextPath}/download1.do?g_id=${OrderMap.g_id}&cate=main">
										</a></td>
										<td id="title"><a
											href="${contextPath }/goods/goodsDetail.do?g_id=${OrderMap.g_id}">${OrderMap.g_name}</a></td>
										<td><c:if test = "${OrderMap.o_goods_price * OrderMap.o_goods_qty < 30000}">${OrderMap.o_goods_qty}개/${OrderMap.o_goods_price * OrderMap.o_goods_qty + 3000 - OrderMap.o_useMile }원</c:if>
										<c:if test = "${OrderMap.o_goods_price * OrderMap.o_goods_qty > 30000}">${OrderMap.o_goods_qty}개/${OrderMap.o_goods_price * OrderMap.o_goods_qty - OrderMap.o_useMile }원</c:if></td>
										<td><b id="state">${OrderMap.delivery_state}</b><br>
											<a
											href="${contextPath}/order/deleteOrder.do?o_id=${OrderMap.o_id}">주문
												취소하기</a><br> <a
											href="${contextPath}/order/OrderResult.do?parentNo=${OrderMap.parentNo}">주문
												상세</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<c:choose>
						<c:when test="${OrderVO != null}">
							<c:forEach var="page" begin="1" end="9" step="1">
								<c:if test="${section >0 && page==1 }">
									<a href="${contextPath}/order/selectUserOrders.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a href="${contextPath}/order/selectUserOrders.do?section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page ==10 }">
									<a href="${contextPath}/order/selectUserOrders.do?section=${section}+1&pageNum=${section*10}+1">next</a>
								</c:if>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>

			</div>
			<div id="tab-3" class="tab-content">
				<div class="detail">
					<table class="review-table">
						<thead>
							<tr id="top-table">
								<th width="15%">상품이미지</th>
								<th width="40%">상품이름</th>
								<th width="15%">갯수/가격</th>
								<th width="20%">배송상태</th>
							</tr>
						</thead>

						<c:choose>
							<c:when test="${empty orderMap.orderListDstart}">
								<tr>
									<td colspan=5 class="fixed"><strong>작성된 글이 없습니다.</strong></td>
								</tr>
							</c:when>
						<c:otherwise>
								<c:forEach var="OrderMap" items="${orderMap.orderListDstart}">
									<tr class="orderlist">
										<td><a
											href="${contextPath}/goods/goodsDetail.do?g_id=${OrderMap.g_id}">
												<img
												src="${contextPath}/download1.do?g_id=${OrderMap.g_id}&cate=main">
										</a></td>
										<td id="title"><a
											href="${contextPath }/goods/goodsDetail.do?g_id=${OrderMap.g_id}">${OrderMap.g_name}</a></td>
										<td><c:if test = "${OrderMap.o_goods_price * OrderMap.o_goods_qty < 30000}">${OrderMap.o_goods_qty}개/${OrderMap.o_goods_price * OrderMap.o_goods_qty + 3000 - OrderMap.o_useMile }원</c:if>
										<c:if test = "${OrderMap.o_goods_price * OrderMap.o_goods_qty > 30000}">${OrderMap.o_goods_qty}개/${OrderMap.o_goods_price * OrderMap.o_goods_qty - OrderMap.o_useMile }원</c:if></td>
										<td><b id="state">${OrderMap.delivery_state}</b><br>
											<a
											href="https://tracker.delivery/#/kr.cjlogistics/560067553920"
											target="_blank">배송 조회하기</a><br> <a
											href="${contextPath}/order/OrderResult.do?parentNo=${OrderMap.parentNo}">주문
												상세</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<c:choose>
						<c:when test="${OrderVO != null}">
							<c:forEach var="page" begin="1" end="9" step="1">
								<c:if test="${section >0 && page==1 }">
									<a href="${contextPath}/order/selectUserOrders.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a href="${contextPath}/order/selectUserOrders.do?section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page ==10 }">
									<a href="${contextPath}/order/selectUserOrders.do?section=${section}+1&pageNum=${section*10}+1">next</a>
								</c:if>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div id="tab-4" class="tab-content">
				<div class="detail">
					<table class="review-table">
						<thead>
							<tr id="top-table">
								<th width="15%">상품이미지</th>
								<th width="40%">상품이름</th>
								<th width="15%">갯수/가격</th>
								<th width="20%">배송상태</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty orderMap.orderListDone}">
								<tr>
									<td colspan=5 class="fixed"><strong>작성된 글이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="OrderMap" items="${orderMap.orderListDone}">
									<tr class="orderlist">
										<td><a href="${contextPath}/goods/goodsDetail.do?g_id=${OrderMap.g_id}">
												<img src="${contextPath}/download1.do?g_id=${OrderMap.g_id}&cate=main">
										</a></td>
										<td id="title"><a href="${contextPath }/goods/goodsDetail.do?g_id=${OrderMap.g_id}">${OrderMap.g_name}</a></td>
										<td><c:if test = "${OrderMap.o_goods_price * OrderMap.o_goods_qty < 30000}">${OrderMap.o_goods_qty}개/${OrderMap.o_goods_price * OrderMap.o_goods_qty + 3000 - OrderMap.o_useMile }원</c:if>
										<c:if test = "${OrderMap.o_goods_price * OrderMap.o_goods_qty > 30000}">${OrderMap.o_goods_qty}개/${OrderMap.o_goods_price * OrderMap.o_goods_qty - OrderMap.o_useMile }원</c:if></td>
										<td><b id="state">${OrderMap.delivery_state}</b><br>
											<c:if test="${OrderMap.review == 'false'}">
												<a href="${contextPath}/boardGr/boardGrWrite.do?g_id=${OrderMap.g_id}&o_id=${OrderMap.o_id}">후기
													작성하기</a>
											</c:if> <c:if test="${OrderMap.review == 'true'}">
												<a href="${contextPath}/boardGr/gr_detail.do?b_gr_id=${OrderMap.b_gr_id}">후기
													보기</a>
											</c:if><br> <a href="${contextPath}/order/OrderResult.do?parentNo=${OrderMap.parentNo}">주문
												상세</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<c:choose>
					<c:when test="${OrderVO != null}">
							<c:forEach var="page" begin="1" end="9" step="1">
								<c:if test="${section >0 && page==1 }">
									<a href="${contextPath}/order/selectUserOrders.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a href="${contextPath}/order/selectUserOrders.do?section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page ==10 }">
									<a href="${contextPath}/order/selectUserOrders.do?section=${section}+1&pageNum=${section*10}+1">next</a>
								</c:if>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		</div>

</body>
</html>