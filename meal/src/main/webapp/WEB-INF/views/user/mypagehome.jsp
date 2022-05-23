<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>상품 상세 정보</title>

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
	background-color: #B1D5FF;
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
	font-size: 40px;
	line-height: 150px;
	background: #B1D5FF;
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

.imagegoods {
	height: 100px;
	width: 130px;
	display: inline;
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
	font-size: 24px;
	border-collapse: collapse;
}

#top-table {
	border-bottom: 1px solid black;
}

#state {
	background-color: #B1D5FF;
	color: white;
}

tr.orderlist td {
	border-bottom: 1px solid gray;
}
</style>

</head>
<body>
	<div id="main-wrap1">
		<br> <br>
		<div id="myinfo-wrap">
			<div>
				<img src="${contextPath}/resources/image/new4.PNG" />
				<ul class="texts">
					<li class="name">&nbsp;한태상<span class="milage">
							마일리지:1000원&nbsp;</span></li>
				</ul>
			</div>
		</div>
		<div style="margin: 10px 0 0 0;">
			<div class="tab-container">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">전체</li>
					<li class="tab-link" data-tab="tab-2">결제완료</li>
					<li class="tab-link" data-tab="tab-3">배송시작</li>
					<li class="tab-link" data-tab="tab-4">배송완료</li>
				</ul>
			</div>

			<div id="tab-1" class="tab-content current">
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

						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">주문완료</b><br> <a href="#">주문 취소하기</a></td>
						</tr>
						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">배송시작</b><br> <a href="#">배송 조회하기</a></td>
						</tr>
						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">배송완료</b><br> <a href="#">후기 작성하기</a></td>
						</tr>
					</table>
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

						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">주문완료</b><br> <a href="#">주문 취소하기</a></td>
						</tr>
						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">주문완료</b><br> <a href="#">주문 취소하기</a></td>
						</tr>
						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">주문완료</b><br> <a href="#">주문 취소하기</a></td>
						</tr>
					</table>
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

						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">배송시작</b><br> <a href="#">배송 조회하기</a></td>
						</tr>
						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">배송시작</b><br> <a href="#">배송 조회하기</a></td>
						</tr>
						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">배송시작</b><br> <a href="#">배송 조회하기</a></td>
						</tr>
					</table>
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

						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">배송완료</b><br> <a href="#">후기 작성하기</a></td>
						</tr>
						<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">배송완료</b><br> <a href="#">후기 작성하기</a></td>
						</tr>
					<tr class="orderlist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원
							</td>
							<td><b id="state">배송완료</b><br> <a href="#">후기 작성하기</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>





</body>
</html>