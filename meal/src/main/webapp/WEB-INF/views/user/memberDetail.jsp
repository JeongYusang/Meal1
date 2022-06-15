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

<style type="text/css">
.div1 {
	width: 1080px;
	height: 1550px;
	position: relative;
	overflow: hidden;
}

.div2 {
	width: 3000px;
	height: 100px;
	background: #ffc0cf;
	text-align: center;
	font-size: 50px;
	line-height: 100px;
	margin-left: 33%;
	display: inline-block
}

.div2-1 {
	margin: 10px;
	display: inline-block;
	float: right;
}

.div2-1 a {
	text-decoration: none;
	background: #ffc0cf;
	color: black;
	border: 3px solid gray;
}

.div3 {
	margin-top: 10px;
	margin-left: 10%;
	width: 80%;
	height: 100px;
	background: #ffC0cf;
	font-size: 45px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.div3 div {
	display: inline-flex;
}

.div3 .div3-1 {
	font-size: 30px;
}

.div3 .div3-3 {
	font-size: 15px;
}

.div4 {
	display: flex;
	background: white;
	height: 150px;
	width: 100%;
	flex-wrap: nowrap;
	justify-content: space-around;
}

.div4 ul {
	list-style: none;
	padding-inline-start: 0px;
}

.div4 .tabmenu {
	margin: 0 auto;
	position: relative;
	margin: 0 auto;
}

.div4 .tabmenu ul li {
	display: inline-block;
	width: 300px;
	height: auto;
	text-align: center;
	background: #ffc0cf;
	margin: 0 27px;
}

.div4 .tabmenu label {
	display: block;
    width: 100%;
    height: 70px;
    font-size: 30px;
}

.div4 .tabmenu input {
	display: none;
}

.div4 .tabCon {
	display: none;
    text-align: center;
    left: 0;
    top: 80%;
    position: absolute;
    box-sizing: border-box;
    width: 100%;
    height: 1180px;
    border: 5px solid #ffc0cf;
    margin-bottom: 10px;
}

.div4 .tabmenu input:checked ~ label {
	background: hotpink;
}

.div4 .tabmenu input:checked ~ .tabCon {
	display: block;
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

.texts b {
	text-transform: capitalize;
	font-size: 40px;
}

.div4 img {
	height: 100px;
	width: 100px;
}

.order-table {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	background-color: white;
	font-size: 20px;
	border-collapse: collapse;
}

tr.orderlist td {
    border-bottom: 1px solid gray;
}

#top-table {
	border-bottom: 1px solid black;
}

#state {
	background-color: #ffc0cf;
	color: white;
}
</style>
</head>
<body>

	<div class="div1">
		<div class="div2-1">
			<a href="${contextPath }/member/">수정</a> <a href="#">삭제</a>
		</div>
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
						<li class="name">&nbsp;<b>[${memberInfo.u_rank}]</b>&nbsp;${memberInfo.u_name}님
							환영합니다<span class="milage"> 마일리지:${memberInfo.u_mile}&nbsp;</span></li>
					</ul>
				</div>
			</div>


		</div>

		<div class="div4">
			<div class="tabmenu">
				<ul>
					<li id="tab1" class="btnCon"><input type="radio" checked
						name="tabmenu" id="tabmenu1"><label for="tabmenu1">결제완료
					</label>
						<div class="tabCon">
							<div class="detail">
								<div class="order-table">
									<table class="order-table">
										<thead>
											<tr id="top-table">
												<th width="250px">상품이미지</th>
												<th width="250px">상품이름</th>
												<th width="200px">갯수/결제 금액</th>
												<th width="200px">배송상태</th>
												<th width="200px"></th>
											</tr>
										</thead>


										<c:choose>
											<c:when test="${empty OrderList}">
												<tr>
													<td colspan=5 class="fixed"><strong>주문 내역이
															없습니다.</strong></td>
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
														<td>${OrderList.o_goods_qty}개/<c:if
																test="${OrderList.o_goods_price >= 30000}">${OrderList.o_goods_price - OrderList.o_useMile}원</c:if>
															<c:if test="${OrderList.o_goods_price < 30000}">${OrderList.o_goods_price + 3000 - OrderList.o_useMile}원</c:if></td>
														<td><b id="state">${OrderList.delivery_state}</b></td>
														<td><c:if test="${OrderList.delivery_state == '주문완료'}">
																<a href="#">주문 환불</a>
															</c:if> 
															<c:if test="${OrderList.delivery_state == '결제완료'}">
																<a href="#">주문 수정하기</a>
																<br>
																<a href="#">주문 환불</a>
																<br>
															</c:if> 
															<c:if test="${OrderList.delivery_state == '배송시작'}">
																<a href="https://tracker.delivery/#/kr.cjlogistics/560067553920">배송
																	조회하기</a>
															</c:if> 
															<c:if test="${OrderList.delivery_state == '주문확인중'}">
																<a href="${contextPath}/order/deleteOrder.do?o_id=${OrderList.o_id}">주문 취소하기</a>
															</c:if> 
															<c:if test="${OrderList.delivery_state == '배송완료'}">
																<c:if test="${OrderList.review == 'false'}">
																	<a href="${contextPath}/boardGr/boardGrWrite.do?g_id=${OrderList.g_id}&o_id=${OrderList.o_id}">후기 작성하기</a>
																</c:if>
																<c:if test="${OrderList.review == 'true'}">
																	<a href="${contextPath}/boardGr/gr_detail.do?b_gr_id=${OrderList.b_gr_id}">후기 보기</a>
																</c:if>
															</c:if> <a href="${contextPath}/order/OrderResult.do?parentNo=${OrderList.parentNo}">주문상세</a></td>
													</tr>
												</c:forEach>
											</c:otherwise>

										</c:choose>
									</table>
								</div>
								<c:choose>
									<c:when test="${OrderVO == null}">
										<c:forEach var="page" begin="1" end="9" step="1">
											<c:if test="${section >0 && page==1 }">
												<a
													href="${contextPath}/member/memberDetail.do?section=${section}-1&pageNum=${(section-1)*10+1 }&id=${memberInfo.u_id}">preview</a>
											</c:if>
											<a
												href="${contextPath}/member/memberDetail.do?section=${section}&pageNum=${page}&id=${memberInfo.u_id}">${(section)*10 +page}
											</a>
											<c:if test="${page ==10 }">
												<a
													href="${contextPath}/member/memberDetail.do?section=${section}+1&pageNum=${section*10}+1&id=${memberInfo.u_id}">next</a>
											</c:if>
										</c:forEach>
									</c:when>
								</c:choose>
							</div>
						</div></li>
					<li id="tab2" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu2"> <label for="tabmenu2">교환/반품/취소
					</label>
						<div class="tabCon">
							<table class="order-table">
								<thead>
									<tr id="top-table">
										<th width="250px">상품이미지</th>
										<th width="200px">상품이름</th>
										<th width="200px">갯수/가격</th>
										<th width="200px">취소일</th>
										<th width="200px">취소상태</th>
									</tr>
								</thead>

								<c:choose>
									<c:when test="${empty CancledOrderList}">
										<tr>
											<td colspan=5 class="empty"><strong>취소된 주문이
													없습니다.</strong></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="OrderList" items="${CancledOrderList}">
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
												<td><b id="state">${OrderList.delivery_state}</b> <br>
												<a
													href="${contextPath}/order/selectOrder.do?o_id=${OrderList.o_id}">취소상세</a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<tr>
									<td colspan=8 class="fixed"><c:forEach var="page"
											begin="1" end="9" step="1">
											<c:if test="${section >0 && page==1 }">
												<a href="${contextPath}/member/memberDetail.do?Csection=${section}-1&CpageNum=${(section-1)*10+1 }&id=${memberInfo.u_id}">preview</a>
											</c:if>
											<a href="${contextPath}/member/memberDetail.do?Csection=${section}&CpageNum=${page}&id=${memberInfo.u_id}">${(section)*10 +page}
											</a>
											<c:if test="${page ==10 }">
												<a href="${contextPath}/member/memberDetail.do?Csection=${section}+1&CpageNum=${section*10}+1&id=${memberInfo.u_id}">next</a>
											</c:if>
										</c:forEach></td>
								</tr>


							</table>
						</div></li>
					<li id="tab3" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu3"> <label for="tabmenu3">작성게시글
					</label>
						<div class="tabCon">내용물3</div></li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>