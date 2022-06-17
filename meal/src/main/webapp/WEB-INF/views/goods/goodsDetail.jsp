<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="section" value="0" />



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>상품 상세 정보</title>

<c:if test='${not empty message }'>
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
	
	function fn_remove_board(url,b_gq_id){
		 var form = document.createElement("form");
		 form.setAttribute("method", "get");
		 form.setAttribute("action", url);
	   var articleNOInput = document.createElement("input");
	   articleNOInput.setAttribute("type","hidden");
	   articleNOInput.setAttribute("name","b_gq_id");
	   articleNOInput.setAttribute("value", b_gq_id);
		 
	   form.appendChild(articleNOInput);
	   document.body.appendChild(form);
	   


	   form.submit();

	}
	function fn_return(url){
		var form = document.createElement("form");
		form.setAttribute("method","get");
		form.setAttribute("action",url);
		document.body.appendChild(form);
		form.submit();
	}
	function fn_update(url,b_gq_id){
		 var form = document.createElement("form");
		 form.setAttribute("method", "get");
		 form.setAttribute("action", url);
	  var articleNOInput = document.createElement("input");
	  articleNOInput.setAttribute("type","hidden");
	  articleNOInput.setAttribute("name","b_gq_id");
	  articleNOInput.setAttribute("value", b_gq_id);
		 
	  form.appendChild(articleNOInput);
	  document.body.appendChild(form);
	  form.submit();

	}
	function fn_review(url,b_gq_id){
		 var form = document.createElement("form");
		 form.setAttribute("method", "get");
		 form.setAttribute("action", url);
	 var articleNOInput = document.createElement("input");
	 articleNOInput.setAttribute("type","hidden");
	 articleNOInput.setAttribute("name","b_gq_id");
	 articleNOInput.setAttribute("value", b_gq_id);
		 
	 form.appendChild(articleNOInput);
	 document.body.appendChild(form);
	 form.submit();
	}
	//asda
	function gr_remove_board(url,b_gr_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "get");
	 form.setAttribute("action", url);
   var articleNOInput = document.createElement("input");
   articleNOInput.setAttribute("type","hidden");
   articleNOInput.setAttribute("name","b_gr_id");
   articleNOInput.setAttribute("value", b_gr_id);
   form.appendChild(articleNOInput);
   document.body.appendChild(form);
   form.submit();

}
function gr_return(url){
	var form = document.createElement("form");
	form.setAttribute("method","get");
	form.setAttribute("action",url);
	document.body.appendChild(form);
	form.submit();
}
function gr_update(url,b_gr_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "get");
	 form.setAttribute("action", url);
  var articleNOInput = document.createElement("input");
  articleNOInput.setAttribute("type","hidden");
  articleNOInput.setAttribute("name","b_gr_id");
  articleNOInput.setAttribute("value", b_gr_id);
	 
  form.appendChild(articleNOInput);
  document.body.appendChild(form);
  form.submit();

}
function gr_review(url,b_gr_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "get");
	 form.setAttribute("action", url);
 var articleNOInput = document.createElement("input");
 articleNOInput.setAttribute("type","hidden");
 articleNOInput.setAttribute("name","b_gr_id");
 articleNOInput.setAttribute("value", b_gr_id);
	 
 form.appendChild(articleNOInput);
 document.body.appendChild(form);
 form.submit();

}
</script>

<style>
#main {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.container {
	display: grid;
	grid-template-columns: 600px 500px;
	grid-column-gap: 50px;
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
	border: 1px solid;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}

.detail {
	text-align: center;
	display: inline-block;
	width: 1260px;
	height: 1400px;
}

.detail1 {
	text-align: center;
	display: inline-block;
}

div .detail1tag {
	font-size: 60px;
}

div .InfoTop {
	display: block;
	margin-left: auto;
}

.button {
	background-color: #ffd3dd;
	border: none;
	border-radius: 4px;
	color: white;
	padding: 15px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.NFSbutton {
	background-color: #000000;
	border: none;
	border-radius: 4px;
	color: white;
	padding: 15px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
/* 가로로 중앙에 배치 */
.review-table {
	width: 100%;
	text-align: center;
	margin: 0 auto;
	background-color: white;
	font-size: 24px;
	border-collapse: collapse;
}

#top-table {
	border-bottom: 1px solid black;
}

tr.border-bottom td {
	border-bottom: 1px solid black;
}

#list {
	text-align: center;
}

#write {
	text-align: right;
}

#tabletitle {
	text-align: left;
	font-size: 40px;
}

#main-wrap {
	color: black;
}

#mainImg {
	width: 650px;
	height: 650px;
	margin: 10px 0 0 5px;
}

.checked {
	color: orange;
}

li#slider1-1 {
	text-align: left;
	font-size: x-large;
}

p.pDDAK {
	font-size: medium;
}

ul#slider1 {
	border-bottom: 1px solid #0000ff1c;
}

.checked {
	color: #ffc0cb;
	font-size: 60px;
}

span.fa.fa-star.checked {
	float: right;
	font-size: 40px;
}

span.fa.fa-star {
	float: right;
	font-size: 40px;
}

img#titleimg {
	padding-left: 3px;
}

h6.titleText {
	text-align: center;
}

.write a {
	float: right;
	text-align: center;
	background-color: #ffc0cb;
	font-size: 14px;
	border: 1px;
	color: white;
	padding: 10px;
	margin-bottom: 10px;
	'
}

.asdf {
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	height: 200px;
}

.F {
	display: block;
	BORDER-TOP: 1PX SOLID BLACK;
	PADDING-TOP: 9PX;
}

.ultra {
	list-style: none;
}

.litra {
	float: left;
	margin-right: 30px;
	display: inline-block;
}

div #icon {
	margin-bottom: 120px;
}

.soldout {
	filter: brightness(50%);
	position: relative;
	width: 650px;
	height: 650px;
	margin: 10px 0 0 5px;
}

#goods-info #soldtext {
	text-align: center;
	position: absolute;
	font-size: 80px;
	font-weight: bold;
	top: 300px;
	color: white;
	margin-left: 135px;
}

#goods-info {
	width: 700px;
	height: 700px;
	position: relative;
}

#buttons {
	float: right;
	display: inline;
	margin: 5px;
	border: 0px;
	height: 30px;
	width: 50px;
	background: #ffc0cf;
	margin: 5px;
}

#Pcontent {
	margin-top: 3px;
	text-align: left;
}

#Pcontent input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px; /* 테두리 없애기 */
	outline: none;
}

#Reviewtitle {
	display: block;
	margin: 0px;
	float: left;
	font-size: 24px;
}

#Reviewwriter {
	display: block;
	margin: 0px;
	float: right;
	font-size: 18px;
	text-align: right;
	margin-top: 9px;
}

#title_Reviewwriter {
	display: block;
	margin: 0px;
	float: right;
	font-size: 18px;
	text-align: right;
	margin-top: 9px;
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px; /* 테두리 없애기 */
	outline: none;
}

#Pcontent textarea {
	width: 1091px;
	height: 185px;
	margin: 0 0 0 60px;
	font-size: 20px;
	resize: none;
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px; /* 테두리 없애기 */
	outline: none;
}

#p_img {
	border: solid 1px;
	margin: 20px 0 20px 450px;
	width: 280px;
	height: 280px;
}

#answer {
	font-size: 36px;
	font-weight: bold;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body onload="init();">
	<script language="JavaScript">
		var sell_price;
		var amount;

		function init() {
			sell_price = document.form.sell_price.value;
			amount = document.form.amount.value;
			document.form.sum.value = sell_price;
			change();
		}

		function add() {
			hm = document.form.amount;
			sum = document.form.sum;
			hm.value++;

			sum.value = parseInt(hm.value) * sell_price;
		}

		function del() {
			hm = document.form.amount;
			sum = document.form.sum;
			if (hm.value > 1) {
				hm.value--;
				sum.value = parseInt(hm.value) * sell_price;
			}
		}

		function change() {
			hm = document.form.amount;
			sum = document.form.sum;
			qty = document.form.qty;

			if (hm.value < 0) {
				hm.value = 0;
			}
			sum.value = parseInt(hm.value) * sell_price;
		}
		function buy() {
			hm = document.form.amount;
			window.location.href = '${contextPath}/order/OrderForm.do?g_id=${goodsInfo.g_id}&o_goods_qty='
					+ hm.value
		}
		function cart() {
			hm = document.form.amount;
			window.location.href = '${contextPath}/cart/addGoodsInCart.do?g_id=${goodsInfo.g_id}&cate=cart&c_qty='
					+ hm.value
		}
	</script>
	<div id="main-wrap">
		<div class="container">
			<div id="goods-info">
				<c:if test="${goodsInfo.g_amount <= 0}">
					<img class="soldout"
						src="${contextPath}/download1.do?g_id=${goodsInfo.g_id}&cate=main">
					<div id="soldtext">상품준비중</div>
				</c:if>
				<c:if test="${goodsInfo.g_amount > 0}">
					<img
						src="${contextPath}/download1.do?g_id=${goodsInfo.g_id}&cate=main"
						id="mainImg">
				</c:if>
			</div>

			<div class="InfoTop">
				<br> <br> <br> <b style="font-size: 52px">${goodsInfo.g_name}</b>
				<p style="font-size: 45px; font-weight: 600; margin-top: 0;">${goodsInfo.g_price }원</p>
				<div id="icon">
					<ul class="ultra">
						<li class="litra"><img
							src="${contextPath}/resources/image/BANG.png" width="40px"
							height="40px">${goodsInfo.g_bang }</li>
						<li class="litra"><img
							src="${contextPath}/resources/image/INBUN.jpg" width="40px"
							height="40px">${goodsInfo.g_inbun }</li>
						<li class="litra"><img
							src="${contextPath}/resources/image/time.png" width="40px"
							height="40px">${goodsInfo.g_time }분</li>
					</ul>
				</div>
				<div class="text">
					<h3>남은수량 : ${goodsInfo.g_amount}개</h3>
					<h3>유통기한 : ${goodsInfo.g_eatDate}</h3>
					<h3>단위(인분) : ${goodsInfo.g_inbun}</h3>
					<h3>알레르기 상세정보 : ${goodsInfo.g_allergy_D}</h3>
					<h4>---------------------------------------------</h4>
					<c:if test="${goodsInfo.g_amount > 0}">
						<h2>
							할인기간 :
							<fmt:formatDate value="${goodsInfo.g_saleDate1}" type="Date"
								pattern="yy년 MM월 dd일" />
							~
							<fmt:formatDate value="${goodsInfo.g_saleDate2}" type="Date"
								pattern="yy년 MM월 dd일" />
						</h2>
					</c:if>
				</div>
				<c:if test="${goodsInfo.g_amount > 0}">
					<div id="price">
						<form name="form" method="get" enctype="multipart/form-data">
							<b>수량 : &nbsp;<input type="button" value=" + "
								onclick="add();"> <input type=hidden name="sell_price"
								value="${goodsInfo.g_price }"> <input type="text"
								name="amount" value="1" size="1" onchange="change();"> <input
								type="button" value=" - " onclick="del();"><br> <br>

								금액 : <input type="text" name="sum" size="8"
								style="width: 100px; height: 30px; font-size: 30px; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">원
							</b>
						</form>
					</div>
				</c:if>
				<br>
				<c:if test="${goodsInfo.g_amount <=0}">
					<a
						href="${contextPath}/cart/addGoodsInCart.do?g_id=${goodsInfo.g_id}&cate=zzim"
						class="button">찜하기</a>
					<a class="NFSbutton">구매불가</a>
					<a class="NFSbutton">상품 준비중</a>
				</c:if>
				<c:if test="${goodsInfo.g_amount > 0}">
					<a
						href="${contextPath}/cart/addGoodsInCart.do?g_id=${goodsInfo.g_id}&cate=zzim"
						class="button">찜하기</a>
					<a name="qty" onClick="buy();" class="button">구매하기</a>
					<a
						href="${contextPath}/cart/addGoodsInCart.do?g_id=${goodsInfo.g_id}&cate=cart"
						class="button">장바구니담기</a>
				</c:if>
			</div>
		</div>
		<br>
		<div style="margin: 10px 0 0 0;">
			<div class="container1">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">상품 상세</li>
					<li class="tab-link" data-tab="tab-2">리뷰</li>
					<li class="tab-link" data-tab="tab-3">상품문의</li>
					<li class="tab-link" data-tab="tab-4">배송정보</li>
				</ul>
			</div>

			<div id="tab-1" class="tab-content current">
				<div class="detail">
					<div class="detail1tag">${goodsInfo.g_detail1 }</div>
					<c:forEach var="item" items="${ImgList }">
						<c:if test="${item.cate != 'main' }">
							<p>
								<img src="${contextPath}/goodsdown.do?ig_id=${item.ig_id}"
									width="100%" height="100%" /><br>

							</p>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				<div class="detail">
					<div id="tabletitle">
						<h6 class="titleText">리뷰</h6>
					</div>
					<table class="review-table">
						<tbody>
							<c:choose>
								<c:when test="${empty boardGrList}">
									<tr class="border-bottom asdf">
										<td colspan=5 class="fixed"><strong>등록된 리뷰가
												없습니다.</strong></td>
									</tr>
								</c:when>
								
								<c:otherwise>
								<c:forEach var="item" items="${boardGrList}" begin="0" end="10">
								<c:choose>
								<c:when test="${empty item.secret or not empty item.secret and item.u_id == memberInfo.u_id or not empty item.secret and item.s_id == sellerInfo.s_id}">
										<div id="box11">
											<c:choose>
												<c:when test="${item.star == 5}">
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
												</c:when>
												<c:when test="${item.star == 4}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
												</c:when>
												<c:when test="${item.star == 3}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
												</c:when>
												<c:when test="${item.star == 2}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
												</c:when>
												<c:otherwise>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star checked"></span>
												</c:otherwise>
											</c:choose>
											<ul id="slider1">
												<li id="slider1-1"><span id="slide1-11">${item.title}
												</span>

													<p id=Pcontent>
													<c:if test="${item.u_id == memberInfo.u_id }">
															<br>
															<input id="buttons" type=button value="수정"
																onClick="gr_update('${contextPath}/boardGr/boardGrUpdateform.do',${item.b_gr_id })" />
															<input id="buttons" type=button value="삭제"
																onClick="gr_remove_board('${contextPath}/boardGr/boardGrDelete.do',${item.b_gr_id })" />
														</c:if>
														<c:if test="${item.s_id == sellerInfo.s_id }">
														<br>
															<input id="buttons" type=button value="답글"
																onClick="gr_review('${contextPath}/boardGr/boardGrReviewform.do', ${item.b_gr_id})" />
														</c:if>
														

														<img id="p_img"
															src="${contextPath}/thumbnailsBoard.do?b_gr_id=${item.b_gr_id}"
															onerror="this.style.display='none';" /> <br>
														<textarea readonly>${item.content}</textarea>
														<br>
														<c:forEach var="boardGrReviewList"
															items="${boardGrReviewList}">
															<c:if
																test="${boardGrReviewList.parentNo == item.b_gr_id}">
																<input id="answer" type="text" value="답변">
																<br>
																<br>
																<input type="text" id="Reviewtitle"
																	value="${boardGrReviewList.title}" readonly>
																<input type="text" id="Reviewwriter"
																	value=" 작성자: ${boardGrReviewList.s_id}" readonly>
																<br>
																<c:if test="${boardGrReviewList.s_id == sellerInfo.s_id }">
																<input id="buttons" type=button value="수정" onClick="gr_update('${contextPath}/boardGr/boardGrUpdateform.do',${boardGrReviewList.b_gr_id })" />
																<input id="buttons" type=button value="삭제" onClick="gr_remove_board('${contextPath}/boardGr/boardGrDelete.do',${boardGrReviewList.b_gr_id })" />
																</c:if>



																<img id="p_img"
																	src="${contextPath}/thumbnailsBoard.do?b_gr_id=${boardGrReviewList.b_gr_id}"
																	onerror="this.style.display='none';" />
																<br>
																<textarea readonly>${boardGrReviewList.content}</textarea>
															</c:if>
														</c:forEach>
													</p></li>
											</ul>
										</div>
								</c:when>
								<c:when test="${not empty item.secret and item.u_id != memberInfo.u_id and item.s_id != sellerInfo.s_id}">
								<div id="box11">
								<c:choose>
								
												<c:when test="${item.star == 5}">
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
												</c:when>
												<c:when test="${item.star == 4}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
												</c:when>
												<c:when test="${item.star == 3}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
												</c:when>
												<c:when test="${item.star == 2}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star checked"></span>
													<span class="fa fa-star checked"></span>
												</c:when>
												<c:otherwise>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star checked"></span>
												</c:otherwise>
											</c:choose>
											<ul id="slider1">
												<li id="slider1-1"><span id="slide1-11">비밀글입니다
												</span>
														<br>
												</li>
											</ul>
											</div>
											</c:when>
											</c:choose>
								</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<center>
						<div id="page">

							<c:forEach var="page" begin="1" end="9" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/goods/goodsDetail.do?g_id=${goodsInfo.g_id}&section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/goods/goodsDetail.do?g_id=${goodsInfo.g_id}&section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page ==10 }">
									<a
										href="${contextPath}/goods/goodsDetail.do?g_id=${goodsInfo.g_id}&section=${section}+1&pageNum=${section*10}+1">next</a>
								</c:if>
							</c:forEach>
						</div>
					</center>



				</div>
			</div>
			<div id="tab-3" class="tab-content">
				<div class="detail">
					<div id="tabletitle">
						<h6 class="titleText">상품문의</h6>
					</div>
					<table class="review-table">
						<tbody>
							<c:choose>
								<c:when test="${empty boardGqList}">
									<tr class="border-bottom asdf">
										<td colspan=5 class="fixed"><strong>등록된 게시물이
												없습니다.</strong></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${boardGqList}" begin="0" end="10">
									<c:choose>
								<c:when test="${empty item.secret or not empty item.secret and item.u_id == memberInfo.u_id or not empty item.secret and item.s_id == sellerInfo.s_id}">
										<ul id="slider1">
											<li id="slider1-1"><span id="slide1-11">${item.title}<input
													type="text" id="title_Reviewwriter"
													value=" 작성자: ${item.u_id}" readonly></span>
												<p id=Pcontent>
													<c:if test="${item.u_id == memberInfo.u_id }">
														<input id="buttons" type=button value="수정"
															onClick="fn_update('${contextPath}/boardGq/boardGqUpdateform.do',${item.b_gq_id })" />
														<input id="buttons" type=button value="삭제"
															onClick="fn_remove_board('${contextPath}/boardGq/boardGqDelete.do',${item.b_gq_id })" />
													</c:if>
													<c:if test="${item.s_id == sellerInfo.s_id }">
														<input id="buttons" type=button value="답글"
															onClick="fn_review('${contextPath}/boardGq/boardGqReviewform.do', ${item.b_gq_id})" />
													</c:if>
													<br> <img id="p_img"
														src="${contextPath}/thumbnailsBoardGq.do?b_gq_id=${item.b_gq_id}"
														onerror="this.style.display='none';" />
													<textarea readonly>${item.content}</textarea>
													<c:forEach var="boardGqReviewList"
														items="${boardGqReviewList}">
														<c:if test="${boardGqReviewList.parentNo == item.b_gq_id}">
															<br>
															<input id="answer" type="text" value="답변">
															<br>
															<br>
															<input type="text" id="Reviewtitle"
																value="${boardGqReviewList.title}" readonly>
															<br>
															<input type="text" id="Reviewwriter"
																value=" 작성자: ${boardGqReviewList.s_id}" readonly>
															<br>
															<c:if
																test="${boardGqReviewList.s_id == sellerInfo.s_id }">
																<input id="buttons" type=button value="수정"
																	onClick="fn_update('${contextPath}/boardGq/boardGqUpdateform.do',${boardGqReviewList.b_gq_id })" />
																<input id="buttons" type=button value="삭제"
																	onClick="fn_remove_board('${contextPath}/boardGq/boardGqDelete.do',${boardGqReviewList.b_gq_id })" />
																<br>
															</c:if>
															<img id="p_img"
																src="${contextPath}/thumbnailsBoardGq.do?b_gq_id=${boardGqReviewList.b_gq_id}"
																onerror="this.style.display='none';" />
															<br>
															<textarea readonly>${boardGqReviewList.content}</textarea>
														</c:if>
													</c:forEach>
												</p></li>
										</ul>
										</c:when>
										<c:when test="${not empty item.secret and item.u_id != memberInfo.u_id and item.s_id != sellerInfo.s_id}">
										<ul id="slider1">
											<li id="slider1-1"><span id="slide1-11">비밀글입니다<input
													type="text" id="title_Reviewwriter"
													value=" 작성자: ****" readonly></span>
								
											</li>
										</ul>
										</c:when>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</tbody>
					</table>
					<center>
						<div id="page">

							<c:forEach var="page" begin="1" end="9" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/goods/goodsDetail.do?g_id=${goodsInfo.g_id}&section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/goods/goodsDetail.do?g_id=${goodsInfo.g_id}&section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page ==10 }">
									<a
										href="${contextPath}/goods/goodsDetail.do?g_id=${goodsInfo.g_id}&section=${section}+1&pageNum=${section*10}+1">next</a>
								</c:if>
							</c:forEach>
						</div>
					</center>
					<c:if test="${empty sellerInfo and empty adminInfo}">
					<div class="write">
						<a href="${contextPath }/boardGq/boardGqWrite.do?g_id=${goodsInfo.g_id}">글쓰기</a>
					</div>
					</c:if>
				</div>
			</div>
			<div id="tab-4" class="tab-content">
				<div class="detail">
					<table class="review-table">
						<tr>
							<td><img src="${contextPath}/resources/image/delivery.jpg"
								height="1250px" width="100%"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("p p").hide();
		// $("ul > li:first-child a").next().show();
		$("ul li span").click(function() {
			$(this).next().slideToggle(300);
			// $(this).next().slideDown(300);
			$("ul li span").not(this).next().slideUp(300);
			return false;
		});
		$("ul li span").eq(0).trigger("click");
	});
</script>
</html>