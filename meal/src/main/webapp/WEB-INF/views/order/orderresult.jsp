<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />




<c:forEach var="OrderList" items="${OrderList}">
	<c:if test="${OrderList.o_goods_saleprice == 0 }">
		<c:set var="total"
			value="${total + (OrderList.o_goods_qty * OrderList.o_goods_price)}" />

		<c:choose>

			<c:when test="${OrderList.o_goods_qty * OrderList.o_goods_price  >= 30000}">
				<c:set var="totalDele" value="${totalDele + 0}" />
			</c:when>
			<c:otherwise>
				<c:set var="totalDele" value="${totalDele + 3000}" />
			</c:otherwise>

		</c:choose>
	</c:if>
	<c:if test="${OrderList.o_goods_saleprice != 0 }">
		<c:set var="total"
			value="${total + (OrderList.o_goods_qty * OrderList.o_goods_saleprice)}" />

		<c:choose>

			<c:when test="${OrderList.o_goods_qty * OrderList.o_goods_saleprice  >= 30000}">
				<c:set var="totalDele" value="${totalDele + 0}" />
			</c:when>

			<c:otherwise>
				<c:set var="totalDele" value="${totalDele + 3000}" />
			</c:otherwise>

		</c:choose>
	</c:if>
</c:forEach>
<c:forEach var="OrderList" items="${OrderList}">
	<c:set var="useMile"
		value="${useMile +(OrderList.o_useMile)}" />
</c:forEach> 

<c:set var="dprice" value="0"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<script>
	window.onload = function() {
		var length = document.getElementsByName("Allprice").length;
		var total = 0;
		for (var i = 0; i < length; i++) {
		total += parseInt(document.getElementsByName("Allprice")[i].value);
		
		}
		document.getElementsByName("Allprice").value = total;
		${"#Allprice"}.append("total");
		
		//
		if (!window.location.hash) {
			window.location = window.location + '#loaded';
			window.location.reload();
			
		}
	}
</script>
<style>
body {
	background: white;
	color: black;
}

#main-wrap {
	background: #efefef;
}
</style>
</head>
<body>
	<div id="main-wrap">
		<div class="orderInfo">
			<h1>주문 완료</h1>
			<p>
				<strong>고객님의 주문이 완료 되었습니다.</strong> 주문내역 및 배송에 관한 안내는 <a
					href="/myshop/order/list.html">주문조회</a> 를 통하여 확인 가능합니다.
			</p>
			<ul>
				<li>주문번호 : <strong>${OrderList[0].parentNo}</strong></li>
				<li>주문일자 : <span>${OrderList[0].pay_order_time}</span></li>
			</ul>
		</div>
		<div class="orderArea">
			<div class="title">
				<h3>결제정보</h3>
			</div>
			<div class="boardView">
				<table border="1" summary="">
					<caption>결제정보</caption>
					<thead>
						<tr>
							<th scope="col" class="thumb">최종결제금액</th>
							<th scope="col" class="product">결제수단</th>
					</thead>
					<tbody>
						<tr>
							<td>${total}</td>
							<td>${OrderList[0].pay_method}</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		<!-- 주문 상품 정보 -->
		<div class="orderListArea">
			<div class="title">
				<h3>주문 상품 정보</h3>
			</div>
			<!-- 기본배송 -->
			<table border="1" class="boardList">
				<caption>기본배송</caption>
				<thead>
					<tr>
						<th scope="col" class="thumb">이미지</th>
						<th scope="col" class="product">상품정보</th>
						<th scope="col" class="price">판매가</th>
						<th scope="col" class="quantity">수량</th>
						<th scope="col" class="mileage">마일리지</th>
						<th scope="col" class="total">합계</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="OrderList" items="${OrderList}">
						
						<tr>
							<td>
							<c:if test = "${OrderList.o_goods_saleprice == 0}">
							<input type = "hidden" name= "Allprice" value = "${OrderList.o_goods_qty * OrderList.o_goods_price }">
							</c:if>
									<c:if test = "${OrderList.o_goods_saleprice != 0}">
							<input type = "hidden" name= "Allprice" value = "${OrderList.o_goods_qty * OrderList.o_goods_saleprice }">
							</c:if>
							<a
								href="${contextPath}/goods/goodsDetail.do?g_id=${OrderList.g_id}"><img
									src="${contextPath}/download1.do?g_id=${OrderList.g_id}&cate=main"
									width="165px" height="100px" alt="상품이미지" /></a></td>
							<td class="product"><a
								href="${contextPath}/goods/goodsDetail.do?g_id=${OrderList.g_id}"><strong>${OrderList.g_name}</strong></a>
								<ul class="option" module="Order_optionSet">
									<li>${OrderList.o_goods_qty}개</li>
								</ul></td>
							<c:if test="${OrderList.o_goods_saleprice == 0 }">	
							<td class="price">
							${OrderList.o_goods_price}원
							</td>
							</c:if>
							<c:if test="${OrderList.o_goods_saleprice != 0 }">	
							<td class="price">
							${OrderList.o_goods_saleprice}원
							</td>
							</c:if>
							
							<td class="quantity">${OrderList.o_goods_qty}개</td>
							<c:if test="${OrderList.o_goods_saleprice == 0 }">	
							<td class="mileage">${OrderList.o_goods_price * 0.01}포인트</td>
							</c:if>
							<c:if test="${OrderList.o_goods_saleprice != 0 }">	
							<td class="mileage">${OrderList.o_goods_saleprice * 0.01}포인트</td>
							</c:if>
							
							<c:if test="${OrderList.o_goods_saleprice == 0 }">
							<td class="total">${OrderList.o_goods_price * OrderList.o_goods_qty}원</td>
							</c:if><c:if test="${OrderList.o_goods_saleprice != 0 }">
							<td class="total">${OrderList.o_goods_saleprice * OrderList.o_goods_qty}원</td>
							</c:if>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>


		<!-- 결제금액 -->
		<div class="totalArea">
			<div class="summary">
				<table border="1" summary="">
					<caption>결제금액</caption>
					<thead>
						<tr>
							<th scope="col"><span>총 주문 금액</span></th>
							<th scope="col">사용 마일리지</th>
							<th scope="col">총 결제금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><div class="box">
									주문 총액: <p id="Allprice"> </p> +
									<c:if test="${total>= 30000}">배송비: ${dprice}원</c:if>
									<c:if test="${total < 30000}">
										<c:set var="dprice" value="3000"></c:set>배송비: ${dprice}원</c:if>
									=${total + dprice}원
								</div></td>
							<td><div class="box">${useMile}포인트</div></td>
							<td class="total"><div class="box">주문 총액: ${total + dprice}원
									- ${useMile}포인트 = ${total + dprice - useMile}원</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class>
				<table border="1" summary="">
					<caption>적립예정 내역</caption>
					<tbody>
						<tr class="total">
							<th scope="row">총 적립예정 마일리지</th>
							<td>포인트 = ${(total + dprice -o_useMile)*0.01}포인트</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		<!-- 배송지정보 -->
		<div class="orderArea">
			<div class="title">
				<h3>배송지정보</h3>
			</div>
			<div class="boardView">
				<table border="1" summary="">
					<caption>배송지 정보</caption>
					<tbody>
						<tr>
							<th scope="row">받으시는분</th>
							<td>${OrderList[0].receiver_name}</td>
						</tr>
						<tr>
							<th scope="row">우편번호</th>
							<td>${OrderList[0].receiver_addr1}</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>${OrderList[0].receiver_addr2} ${OrderList[0].receiver_addr3}</td>
						</tr>
						<tr>
							<th scope="row">휴대전화</th>
							<td>${OrderList[0].receiver_hp}</td>
						</tr>
						<tr>
							<th scope="row">배송메시지</th>
							<td>${OrderList[0].deliver_message}</td>
						</tr>
						<tr>
							<th scope="row">희망배송일</th>
							<td><strong>2022-04-15</strong></td>
						</tr>
						<tr>
							<th scope="row">배송방법</th>
							<td>${OrderList[0].delivery_state}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<br>
		<div class="btnArea">

			<span class="center"> <a href="${contextPath}/main/main.do"><img
					src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_ing.gif"
					alt="쇼핑계속하기" /></a> <a href="${contextPath}/order/selectUserOrders.do"><img
					src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_check.gif"
					alt="주문목록확인하기" /></a>
			</span>
		</div>
		<!-- 이용안내 -->
		<div class="help">
			<h3>이용안내</h3>
			<div class="content">
				<ul>
					<li class="item2">배송은 결제완료 후 지역에 따라 1일 ~ 3일 가량이 소요됩니다.</li>
					<li class="item3">상품별 자세한 배송과정은 주문조회를 통하여 조회하실 수 있습니다.</li>
					<li class="item4">주문의 취소 및 환불, 교환에 관한 사항은 이용안내의 내용을 참고하십시오.</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>