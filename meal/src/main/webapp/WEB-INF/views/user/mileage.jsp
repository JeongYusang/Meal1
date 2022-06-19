<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="section" value="0" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-*">
<title>내 마일리지</title>
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
ul.tabs {
	text-align: center;
	padding: 0px;
	list-style: none;
	font-size: 24px;
}

ul.tabs li {
	text-align: center;
	display: inline-block;
	color: gray;
	cursor: pointer;
	margin-right: 10px;
	font-size: 24px;
}

ul.tabs li.current {
	text-align: center;
	color: black;
	font-size: 24px;
}

.tab-content {
	display: none;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}

.detail {
	text-align: center;
	display: inline-block;
	width: 1000px;
	height: 600px;
	margin: auto
}

#main-container1 {
	margin-left: 30px;
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

.tab-container {
	float: left;
}

#main-wrap a {
	color: black;
}

.mileage-table {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	font-size: 16px;
	border-collapse: collapse;
	color: black;
}

#top-table {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

tr.border-bottom td {
	border-bottom: 1px solid black;
}

#use {
	color: red;
}

#earn {
	color: blue;
}

#main-title {
	font-size: 24px;
	font-weight: bold;
	color: black;
}

#main-title h1 {
	margin: 10px 0 0 0;
	color: #FD6EB0;
}

#sub-title {
	font-size: 30px;
	font-weight: bold;
	color: black;
}

hr {
	background-color: black;
}

#main-container1 h3 {
	margin: 0px;
}
</style>
</head>
<body>
	<div id="main-container1">
		<div id="main-title">
			<h1>마일리지</h1>
		</div>
		<hr>
		<br>
		<h3>현재 적립금</h3>
		<div id="sub-title">
			${u_mile}<br> <br>
		</div>

		<div style="margin: 10px 0 0 0;">
			<div class="tab-container">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">전체</li>
					<li class="tab-link" data-tab="tab-2">적립</li>
					<li class="tab-link" data-tab="tab-3">사용</li>

				</ul>
			</div>

			<div id="tab-1" class="tab-content current">
				<div class="detail">
					<table class="mileage-table">
						<thead>
							<tr id="top-table">
								<th width="100px">주문번호</th>
								<th width="100px">상태</th>
								<th width="100px">적립금</th>
								<th width="300px">적립내용</th>
								<th width="300px">날짜</th>
							</tr>
						</thead>
						<c:forEach var="mileage" items="${MilagePage}" varStatus="status">
							<tr class="border-bottom">
								<td>${mileage.o_id}</td>
								<c:if test="${mileage.m_point > 0 }">
									<td id="earn">적립</td>
								</c:if>
								<c:if test="${mileage.m_point < 0 }">
									<td id="use">사용</td>
								</c:if>
								<c:if test="${mileage.m_point > 0 }">
									<td id="earn">${mileage.m_point}</td>
								</c:if>
								<c:if test="${mileage.m_point < 0 }">
									<td id="use">${mileage.m_point}</td>
								</c:if>

								<td><a
									href="${contextPath }/goods/goodsDetail.do?g_id=${mileage.g_id}">${mileage.g_name}</a></td>
								<td>${mileage.pay_order_time}</td>
							</tr>
						</c:forEach>
						<tr><td colspan=8 class="fixed"><c:forEach var="page" begin="1"
									end="9" step="1">
									<c:if test="${section >0 && page==1 }">
										<a
											href="${contextPath}/member/myMileage.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
									</c:if>
									<a
										href="${contextPath}/member/myMileage.do?section=${section}&pageNum=${page}">${(section)*10 +page}
									</a>
									<c:if test="${page ==10 }">
										<a
											href="${contextPath}/member/myMileage.do?section=${section}+1&pageNum=${section*10}+1">next</a>
									</c:if>

								</c:forEach></td></tr>
					</table>
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				<div class="detail">
					<table class="mileage-table">
						<thead>
							<tr id="top-table">
								<th width="100px">주문번호</th>
								<th width="100px">상태</th>
								<th width="100px">적립금</th>
								<th width="300px">적립내용</th>
								<th width="300px">날짜</th>
							</tr>
						</thead>
						<c:forEach var="mileage" items="${myMileagePlus}" varStatus="status">
							<c:choose>
								<c:when test="${mileage.m_point > 0 }">
									<tr class="border-bottom">
										<td>${mileage.o_id}</td>
										<td id="earn">적립</td>
										<td id="earn">${mileage.m_point}</td>
										<td><a
											href="${contextPath }/goods/goodsDetail.do?g_id=${mileage.g_id}">${mileage.g_name}</a></td>
										<td>${mileage.pay_order_time}</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
						<tr><td colspan=8 class="fixed"><c:forEach var="page" begin="1"
									end="9" step="1">
									<c:if test="${section >0 && page==1 }">
										<a
											href="${contextPath}/member/myMileage.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
									</c:if>
									<a
										href="${contextPath}/member/myMileage.do?section=${section}&pageNum=${page}">${(section)*10 +page}
									</a>
									<c:if test="${page ==10 }">
										<a
											href="${contextPath}/member/myMileage.do?section=${section}+1&pageNum=${section*10}+1">next</a>
									</c:if>

								</c:forEach></td></tr>
					</table>
				</div>
			</div>
			<div id="tab-3" class="tab-content">
				<div class="detail">
					<table class="mileage-table">
						<thead>
							<tr id="top-table">
								<th width="100px">주문번호</th>
								<th width="100px">상태</th>
								<th width="100px">적립금</th>
								<th width="300px">적립내용</th>
								<th width="300px">날짜</th>
							</tr>
						</thead>
						<c:forEach var="mileage" items="${myMileageMinus}" varStatus="status">
							<c:choose>
								<c:when test="${mileage.m_point < 0 }">
									<tr class="border-bottom">
										<td>${mileage.o_id}</td>
										<td id="use">사용</td>
										<td id="use">${mileage.m_point}</td>
										<td><a href="${contextPath }/goods/goodsDetail.do?g_id=${mileage.g_id}">${mileage.g_name}</a></td>
										<td>${mileage.pay_order_time}</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
						<tr>
							<td colspan=8 class="fixed"><c:forEach var="page" begin="1"
									end="9" step="1">
									<c:if test="${section >0 && page==1 }">
										<a
											href="${contextPath}/member/myMileage.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
									</c:if>
									<a
										href="${contextPath}/member/myMileage.do?section=${section}&pageNum=${page}">${(section)*10 +page}
									</a>
									<c:if test="${page ==10 }">
										<a
											href="${contextPath}/member/myMileage.do?section=${section}+1&pageNum=${section*10}+1">next</a>
									</c:if>

								</c:forEach></td>
						</tr>
						<tr>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>