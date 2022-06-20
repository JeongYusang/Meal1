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
	height: 1630px;
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

.div4 .tabmenu1 {
	margin: 0 auto;
	position: relative;
	margin: 0 auto;
}

.div4 .tabmenu1 #main_tab .btnCon {
	display: inline-block;
	width: 300px;
	height: auto;
	text-align: center;
	background: #ffc0cf;
	margin: 0 27px;
}

.div4 .tabmenu1 label {
	display: block;
	width: 100%;
	height: 70px;
	font-size: 30px;
}

.div4 .tabmenu1 input {
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
	height: 1280px;
	border: 5px solid #ffc0cf;
	margin-bottom: 10px;
}

.div4 .tabmenu1 input:checked ~ label {
	background: hotpink;
}

.div4 .tabmenu1 input:checked ~ .tabCon {
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
	height: 95px;
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

.milage {
	float: right;
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

ul.tabs {
	margin: auto;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	text-align: center;
	display: inline-block;
	border-radius: 10px;
	font-size: large;
	color: black;
	background: #f1f1f1;
	padding: 10px 15px;
	cursor: pointer;
	width: 284px;
	height: 30px;
}

ul.tabs li.current {
	font-size: 16px;
	border: 5px solid;
	border-radius: 10px;
	background-color: #ffd3dd;
	color: white;
}

.tab-content {
	display: none;
}

.tab-content.current {
	display: inherit;
}

tr.border-bottom td {
	border-bottom: 1px black solid;
	border-collapse: collapse;
}

.checked {
	color: #ffc0cb;
	font-size: 60px;
}

.stable-striped {
	font-size: 20px;
	border-collapse: collapse;
}

.titleText {
	font-size: 30px;
	color: #FD6EB0;
	margin: 30px;
}
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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

	function delchk() {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.href = "/member/deleteMember.do?u_id=${memberVO.u_id}";
			return true;
		} else {
			alert("취소 되었습니다");
			return false;
		}
	}
</script>
</head>
<body>

	<div class="div1">
		<div class="div2-1">
			<c:choose>
				<c:when test="${not empty adminInfo }">
					<a
						href="${contextPath }/member/MemberUpdateForm.do?u_id=${memberVO.u_id}">수정</a>
					<a
						href="${contextPath }/member/deleteMember.do?u_id=${memberVO.u_id}"
						onClick="delchk()">삭제</a>
				</c:when>
				<c:otherwise>
					<button type="button" class="checkpw">수정</button>
					<button type="button" class="checkpw1">탈퇴</button>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="main-wrap1">
			<div id="myinfo-wrap">
				<div>
					<c:if test="${memberVO.u_rank == 'gold'}">
						<img src="${contextPath}/resources/image/gold-medal.png" />
					</c:if>
					<c:if test="${memberVO.u_rank == 'silver'}">
						<img src="${contextPath}/resources/image/silver-medal.png" />
					</c:if>
					<c:if test="${memberVO.u_rank == 'bronze'}">
						<img src="${contextPath}/resources/image/bronze-medal.png" />
					</c:if>
					<ul class="texts">
						<li class="name">&nbsp;<b>[${memberVO.u_rank}]</b>&nbsp;${memberVO.u_name}님
							<span class="milage"> 마일리지:${memberVO.u_mile}&nbsp;</span></li>
					</ul>
				</div>
			</div>


		</div>

		<div class="div4">
			<div class="tabmenu1">
				<ul id=main_tab>
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
														<td><c:if
																test="${OrderList.delivery_state == '주문완료'}">
																<a
																	href="${contextPath}/order/deleteOrder.do?o_id=${OrderList.o_id}">주문
																	취소하기</a>
																<br>
															</c:if> <c:if test="${OrderList.delivery_state == '결제완료'}">
																<a
																	href="${contextPath}/order/deleteOrder.do?o_id=${OrderList.o_id}">주문
																	취소하기</a>
																<br>
															</c:if> <c:if test="${OrderList.delivery_state == '배송시작'}">
																<a
																	href="https://tracker.delivery/#/kr.cjlogistics/560067553920">배송
																	조회하기</a>
																<br>
															</c:if> <c:if test="${OrderList.delivery_state == '배송완료'}">
																<c:if test="${OrderList.review == 'false'}">
																	<a
																		href="${contextPath}/boardGr/boardGrWrite.do?g_id=${OrderList.g_id}&o_id=${OrderList.o_id}">후기
																		작성하기</a>
																	<br>
																</c:if>
																<c:if test="${OrderList.review == 'true'}">
																	<a
																		href="${contextPath}/boardGr/gr_detail.do?b_gr_id=${OrderList.b_gr_id}">후기
																		보기</a>
																	<br>
																</c:if>
															</c:if> <a
															href="${contextPath}/order/OrderResult.do?parentNo=${OrderList.parentNo}">주문상세</a></td>
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
													href="${contextPath}/member/memberDetail.do?section=${section}-1&pageNum=${(section-1)*10+1 }&u_id=${memberVO.u_id}">preview</a>
											</c:if>
											<a
												href="${contextPath}/member/memberDetail.do?section=${section}&pageNum=${page}&u_id=${memberVO.u_id}">${(section)*10 +page}
											</a>
											<c:if test="${page ==10 }">
												<a
													href="${contextPath}/member/memberDetail.do?section=${section}+1&pageNum=${section*10}+1&u_id=${memberVO.u_id}">next</a>
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
												<a
													href="${contextPath}/member/memberDetail.do?section=${section}-1&pageNum=${(section-1)*10+1 }&u_id=${memberVO.u_id}">preview</a>
											</c:if>
											<a
												href="${contextPath}/member/memberDetail.do?section=${section}&pageNum=${page}&u_id=${memberVO.u_id}">${(section)*10 +page}
											</a>
											<c:if test="${page ==10 }">
												<a
													href="${contextPath}/member/memberDetail.do?section=${section}+1&pageNum=${section*10}+1&u_id=${memberVO.u_id}">next</a>
											</c:if>
										</c:forEach></td>
								</tr>


							</table>
						</div></li>
					<li id="tab3" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu3"> <label for="tabmenu3">작성게시글
					</label>
						<div class="tabCon">
							<div style="margin: 10px 0 0 0;">
								<div class="container1">
									<ul class="tabs">
										<li class="tab-link current" data-tab="tab-1">상품문의</li>
										<li class="tab-link" data-tab="tab-2">리뷰</li>
										<li class="tab-link" data-tab="tab-3">1대1 문의</li>
									</ul>
								</div>
							</div>
							<div id="tab-1" class="tab-content current">
								<div class="detail">
									<div id="tabletitle">
										<h6 class="titleText">상품문의</h6>
									</div>
									<table class="stable-striped">
										<thead>
											<tr id="top-table">
												<th width="200px"></th>
												<th width="200px">상품</th>
												<th width="400px">제목</th>
												<th width="200px">날짜</th>
												<th width="200px">답변여부</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${BoardGqList}">

												<tr class="border-bottom"
													onClick="location.href='${contextPath}/boardGq/gq_detail.do?b_gq_id=${item.b_gq_id}'"
													style="cursor: hand">
													<td><img class="GrImg"
														src="${contextPath}/download1.do?g_id=${item.g_id}&cate=main"
														onerror="this.src='${contextPath}/resources/image/not for sale.jpg'">
													</td>
													<td>${item.g_name}</td>
													<td>${item.title}</td>
													<td>${item.creDate}</td>
													<td>${item.compare}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<c:choose>
										<c:when test="${OrderVO == null}">
											<c:forEach var="page" begin="1" end="9" step="1">
												<c:if test="${section >0 && page==1 }">
													<a
														href="${contextPath}/member/memberDetail.do?section=${section}-1&pageNum=${(section-1)*10+1 }&u_id=${memberVO.u_id}">preview</a>
												</c:if>
												<a
													href="${contextPath}/member/memberDetail.do?section=${section}&pageNum=${page}&u_id=${memberVO.u_id}">${(section)*10 +page}
												</a>
												<c:if test="${page ==10 }">
													<a
														href="${contextPath}/member/memberDetail.do?section=${section}+1&pageNum=${section*10}+1&u_id=${memberVO.u_id}">next</a>
												</c:if>
											</c:forEach>
										</c:when>
									</c:choose>
								</div>
							</div>
							<div id="tab-2" class="tab-content">
								<h6 class="titleText">상품후기</h6>
								<table class="stable-striped">

									<thead>
										<tr id="top-table">
											<th width="150px"></th>
											<th width="150px">별점</th>
											<th width="200px">상품</th>
											<th width="250px">제목</th>
											<th width="100px">작성자</th>
											<th width="150px">날짜</th>
											<th width="150px">답변여부</th>
										</tr>
									</thead>
									<c:choose>
										<c:when test="${empty BoardGrList}">
											<tr>
												<td colspan=8 class="fixed"><strong>작성된 글이
														없습니다.</strong></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="item" items="${BoardGrList}">
												<tr class="border-bottom"
													onClick="location.href='${contextPath}/boardGr/gr_detail.do?b_gr_id=${item.b_gr_id}'"
													style="cursor: hand">
													<td><img class="GrImg"
														src="${contextPath}/download1.do?g_id=${item.g_id}&cate=main"
														onerror="this.src='${contextPath}/resources/image/not for sale.jpg'">
													</td>
													<td><c:choose>
															<c:when test="${item.star == 5}">
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
															</c:when>
															<c:when test="${item.star == 4}">
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star"></span>
															</c:when>
															<c:when test="${item.star == 3}">
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
															</c:when>
															<c:when test="${item.star == 2}">
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
															</c:when>
															<c:otherwise>
																<span class="fa fa-star checked"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
															</c:otherwise>
														</c:choose></td>
													<td>${item.g_name}</td>
													<td>${item.title}</td>
													<td>${item.u_id}</td>
													<td>${item.creDate}</td>
													<td>${item.compare}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
								<c:choose>
									<c:when test="${OrderVO == null}">
										<c:forEach var="page" begin="1" end="9" step="1">
											<c:if test="${section >0 && page==1 }">
												<a
													href="${contextPath}/member/memberDetail.do?section=${section}-1&pageNum=${(section-1)*10+1 }&u_id=${memberVO.u_id}">preview</a>
											</c:if>
											<a
												href="${contextPath}/member/memberDetail.do?section=${section}&pageNum=${page}&u_id=${memberVO.u_id}">${(section)*10 +page}
											</a>
											<c:if test="${page ==10 }">
												<a
													href="${contextPath}/member/memberDetail.do?section=${section}+1&pageNum=${section*10}+1&u_id=${memberVO.u_id}">next</a>
											</c:if>
										</c:forEach>
									</c:when>
								</c:choose>

							</div>
							<div id="tab-3" class="tab-content">
								<div class="detail">
									<div id="tabletitle">
										<h6 class="titleText">1대1 문의</h6>
									</div>
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
										<tbody>
											<c:forEach var="item" items="${Board1List}">
												<tr class="border-bottom">
													<td>${item.b_1_id}</td>
													<td>${item.u_id}</td>
													<td><a
														href="${contextPath}/board1/b1Detail.do?b_1_id=${item.b_1_id}">${item.title}</a></td>
													<td>${item.creDate}</td>
													<td>${item.compare}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<c:choose>
										<c:when test="${OrderVO == null}">
											<c:forEach var="page" begin="1" end="9" step="1">
												<c:if test="${section >0 && page==1 }">
													<a
														href="${contextPath}/member/memberDetail.do?section=${section}-1&pageNum=${(section-1)*10+1 }&u_id=${memberVO.u_id}">preview</a>
												</c:if>
												<a
													href="${contextPath}/member/memberDetail.do?section=${section}&pageNum=${page}&u_id=${memberVO.u_id}">${(section)*10 +page}
												</a>
												<c:if test="${page ==10 }">
													<a
														href="${contextPath}/member/memberDetail.do?section=${section}+1&pageNum=${section*10}+1&u_id=${memberVO.u_id}">next</a>
												</c:if>
											</c:forEach>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>