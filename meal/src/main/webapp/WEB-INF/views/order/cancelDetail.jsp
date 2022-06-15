<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>취소/반품/교환 내역</title>
<style type="text/css">

#cancelmain-wrap {
	width: 100%;
	margin: auto;
}

#cancelmain-wrap .cancel-table {
	width: 100%;
	text-align: center;
	font-size: 20px;
	background-color: white;
	border-collapse: collapse;
	margin: auto;
}

#cancelmain-wrap .cancelinfo {
	text-align: left;
	font-size: 20px;
	background-color: white;
	margin-bottom: 50px;
	margin-left: 30px;
	border-collapse: collapse;
	float: left;
	display: inline;
	border: 1px solid;
}

#cancelmain-wrap .cancelinfo2 {
	text-align: left;
	font-size: 20px;
	background-color: white;
	margin-bottom: 50px;
	border-collapse: collapse;
	float: left;
	display: inline;
	border: 1px solid;
}

.tableholder {
	margin-bottom: auto;
}

.imagegoods {
	width: 200px;
	height: 200px;
}

#listback {
	width: 200px;
	height: 70px;
	margin: auto;
	display: block;
	background: #ffc0cf;
	border: 0px;
}

#tableholder {
	font-size: 40px;
	margin-bottom: 100px;
}

.cancellist img {
width: 120px;
height: 120px;
}
#top-table2 {
background: #ffc0cf;
border-collapse: collapse;
}
#cancelmain-wrap #maintitle {
font-size: 30px;
color: #FD6EB0;
}
</style>
</head>
<body>
	<div id="cancelmain-wrap">
		<div id="maintitle">취소/반품/교환 내역</div>
		<br>
		<h3>취소 신청일:${orderVO.pay_order_time} 주문번호:${orderVO.o_id}</h3>
		<table class="cancel-table">
			<thead>
				<tr id="top-table2">
					<th width="150px">상품이미지</th>
					<th width="200px">상품이름</th>
					<th width="200px">금액</th>
					<th width="200px">마일리지</th>
					<th width="200px">배송비</th>
					<th width="200px">진행상태</th>
				</tr>

				<tr class="cancellist">
					<td><a href="${contextPath}/goods/goodsDetail.do?g_id=${orderVO.g_id}">
					<img src="${contextPath}/download1.do?g_id=${orderVO.g_id}&cate=main" onerror="this.src='${contextPath}/resources/image/not for sale.jpg'">
					</a></td>
					<td id="title"><a href="${contextPath }/main/goodsDetail.do">${orderVO.g_name}</a></td>
					<td>${orderVO.o_goods_price - o_useMile}원
					</td>
					<td>
					-${orderVO.o_useMile}포인트
					</td>
					<td>
					<c:if test="${orderVO.o_goods_price < 30000 }">0원</c:if>
					<c:if test="${orderVO.o_goods_price >= 30000 }">3000원</c:if>
					</td>
					<td><b id="state">${orderVO.delivery_state}</b></td>
				</tr>
			</thead>
		</table>
		<div id="table-wrap">
			<h1>상세정보</h1>

			<table class="cancelinfo">
				<tr id="top-table">
					<th width="130px">취소접수일자:</th>
					<th width="400px">${orderVO.pay_order_time}</th>

				</tr>
				<tr>
					<td>주문번호:</td>
					<td>${orderVO.o_id}</td>
				</tr>
				
			</table>
			<table class="cancelinfo2">
				<tr>
					<th width="100px">환불 수단:</th>
					<th width="400px"><c:if test ="${orderVO.pay_method == 'point'}">카카오페이</c:if>
					<c:if test ="${orderVO.pay_method != 'point'}">${orderVO.pay_method}</c:if></th>
				</tr>

				<tr>
					<td>환불 금액:</td>
					<td><c:if test="${orderVO.o_goods_price >= 30000 }">${orderVO.o_goods_price - orderVO.o_useMile}원</c:if>
					<c:if test="${orderVO.o_goods_price < 30000 }">${orderVO.o_goods_price + 3000 - orderVO.o_useMile}원</c:if></td>
				</tr>
				
			</table>
		</div>


		<button id="listback"onclick="location.href='${contextPath }/order/selectCanceledOrders.do'">
			목록
		</button>
	</div>
</body>
</html>