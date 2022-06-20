<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<meta charset="utf-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>


<c:forEach var="CartList" items="${CartList}">
	<c:if test="${CartList.g_saleprice ==0 }">
		<c:set var="total"
			value="${total + (CartList.c_qty * CartList.g_price)}" />

		<c:choose>

			<c:when test="${CartList.c_qty * CartList.g_price  >= 30000}">
				<c:set var="totalDele" value="${totalDele + 0}" />
			</c:when>
			<c:otherwise>
				<c:set var="totalDele" value="${totalDele + 3000}" />
			</c:otherwise>

		</c:choose>
	</c:if>
	<c:if test="${CartList.g_saleprice !=0 }">
		<c:set var="total"
			value="${total + (CartList.c_qty * CartList.g_saleprice)}" />

		<c:choose>

			<c:when test="${CartList.c_qty * CartList.g_price  >= 30000}">
				<c:set var="totalDele" value="${totalDele + 0}" />
			</c:when>

			<c:otherwise>
				<c:set var="totalDele" value="${totalDele + 3000}" />
			</c:otherwise>

		</c:choose>
	</c:if>
</c:forEach>

<script>

 /* window.onload =function(){
		var total = 0; 
		var tDele = 0;
		var length = ${length};
		var CartList = ${CartList};
  	 	for(var i=0; i < length ; i++){
  	 		var sale = ${CartList[i].g_saleprice};
  	 		
  	 		console.log("진입");
  	 		console.log("이거 뜨냐 " + sale);
				if(${CartList[i].g_saleprice != 0}){
					// 상품 할인이 있을경우
					var GoodsPrice = ${CartList[i].c_qty * CartList[i].g_saleprice};
					console.log(GoodsPrice);
					if(GoodsPrice >= 30000){
						tDele+= 3000;
						total += GoodsPrice + tDele;
					}else{
						total += GoodsPrice;
					}	
					
				}else{
					var GoodsPrice = ${CartList[i].c_qty * CartList[i].g_price};
					if(GoodsPrice >= 30000){
						tDele+= 3000;
						total += GoodsPrice + tDele;
					}else{
						total += GoodsPrice;
					}	
					
				}
        }      
   	document.getElementById("p_total").value = total;
   	document.getElementById("dele").value = tDele;
   	console.log("total : " +total);
	console.log("tDele : " +dele);
}  */

function check_total(){
	var total = 0; 
	var tDele = 0;
	var length = ${length};
	$('input[type="checkbox"]:checked').each(function (index) {
	        
		   if (index != 0) {
		        var checkT = $(this).val();
	        	for(var i=0; i < length ; i++){
	        		console.log("진입");
	        	if(${CartList[i].c_id == checkT}){
					if(${CartList[i].g_saleprice != 0}){
						// 상품 할인이 있을경우
						var GoodsPrice = ${CartList[i].c_qty * CartList[i].g_saleprice};
						if(GoodsPrice >= 30000){
							tDele+= 3000;
							total += GoodsPrice + tDele;
						}else{
							total += GoodsPrice;
						}	
						
					}else{
						var GoodsPrice = ${CartList[i].c_qty * CartList[i].g_price};
						if(GoodsPrice >= 30000){
							tDele+= 3000;
							total += GoodsPrice + tDele;
						}else{
							total += GoodsPrice;
						}	
						
					}
	        	}
	        	
	         } 
	        	document.getElementById("p_total").value = total;
	        	document.getElementById("dele").value = tDele;
	        	console.log("total : " +total);
	        	console.log("tDele : " +dele);
	        	
		   }
	});
	        
	  }

	 /* var total = 0;
 var length = ${CartList}.length;
 var CartList[] = ${CartList}; 
 for (int i = 0; i < length ; i++){
	 if(${CartList[i].g_saleprice != 0}){
		 total += ${CartList[i].g_saleprice * CartList[i].c_qty};
	 }else{
		 total += ${CartList[i].g_price * CartList[i].c_qty};
	 }
	document.getElementById("p_total").value = total;	 
 } */


 /* function change() {
    hm = document.form.amount;
    sum = document.form.sum;

    if (hm.value < 0) {
       hm.value = 0;
    }
    sum.value = parseInt(hm.value) * sell_price;
 }
 function incrementValue() {
    var value = parseInt(document.getElementById('number').value, 10);
    value = isNaN(value) ? 0 : value;
    if (value < 10) {
       value++;
       document.getElementById('number').value = value;
    }
 }
 function decrementValue() {
    var value = parseInt(document.getElementById('number').value, 10);
    value = isNaN(value) ? 0 : value;
    if (value > 1) {
       value--;
       document.getElementById('number').value = value;
    }

 } */
 function selectAll(selectAll)  {
	   const checkboxes 
	        = document.getElementsByName('checked_cart');
	   
	   checkboxes.forEach((checkbox) => {
	     checkbox.checked = selectAll.checked;
	   })
	 }
 
 /*주문건들던 그거  */
 function order() {
		var OrderToCart = '';
	    
	    $('input[type="checkbox"]:checked').each(function (index) {
	        if (index != 0) {
	        	OrderToCart += '/';
	     
	        }       
	        OrderToCart += $(this).val();
	       
	    });
		document.getElementById("OrderToCart").value = OrderToCart;
		console.log(OrderToCart);
	    return true;
	}

 </script>

<style>
#main {
	margin-top: 30px;
}

.cart-wrap {
	height: auto;
	margin-left: 60px;
}

.container1 {
	float: left;
}

.shopping-cart {
	width: 750px;
	height: 800px;
	margin: auto;
	margin-left: 30px;
	background: #FFFFFF;
	box-shadow: 1px 2px 3px 0px rgb(0 0 0/ 10%);
	border-radius: 6px;
	display: flex;
	position: relative;
	flex-direction: column;
}

.title {
	height: 30px;
	border-bottom: 1px solid #E1E8EE;
	padding: 10px 10px;
	color: #5E6977;
	font-size: 18px;
	font-weight: 400;
	color: black;
}

.item-wrap {
	width: 100%;
	display: flex;
	align-items: center;
	/* overflow: hidden; */
}

.item {
	width: 100%;
	padding: 5px 5px;
	height: 70px;
	display: flex;
	align-items: center;
	flex-wrap: nowrap;
	/*     overflow: hidden; */
	justify-content: space-between
}

.item:nth-child(3) {
	border-top: 1px solid #E1E8EE;
	border-bottom: 1px solid #E1E8EE;
}

.buttons {
	position: relative;
}

.imagegoods {
	height: 70px;
	width: 70px;
}

.description-wrap {
	
}

.description {
	width: 350px;
}

.description span {
	display: block;
	font-size: 14px;
	color: #43484D;
	font-weight: 400;
	text-align: center;
}

.description span:first-child {
	margin-bottom: 5px;
}

.description span:last-child {
	font-weight: 300;
	margin-top: 8px;
	color: #86939E;
}

.quantity {
	padding-top: 10px;
	width: 200px;
}

.quantity input {
	-webkit-appearance: none;
	display: inline-block;
	border: none;
	text-align: center;
	width: 32px;
	font-size: 16px;
	color: #43484D;
	font-weight: 300;
}

.minus-btn img {
	margin-bottom: 3px;
}

.plus-btn img {
	margin-top: 2px;
}

.button1:focus, input:focus {
	outline: 0;
}

.total-price {
	width: 83px;
	text-align: center;
	font-size: 16px;
	color: #43484D;
	font-weight: 300;
}

.summary {
	background-color: #eee;
	border: 1px solid #aaa;
	padding: 1rem;
	width: 100%;
	display: block;
	margin-top: 50px;
	margin-left: 50px;
}

.summary-total-items {
	color: #666;
	font-size: 0.875rem;
	text-align: center;
}

.summary-subtotal, .summary-total {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	clear: both;
	overflow: hidden;
	padding: 0.5rem 0;
}

.promo-value {
	color: #111;
	float: left;
	width: 50%;
}

.summary-promo {
	-webkit-transition: all .3s ease;
	-moz-transition: all .3s ease;
	-o-transition: all .3s ease;
	transition: all .3s ease;
}

.promo-title {
	float: left;
	width: 70%;
}

.promo-value {
	color: #8B0000;
	float: left;
	text-align: right;
	width: 30%;
}

.summary-delivery {
	padding-bottom: 3rem;
}

.subtotal-value, .total-value {
	text-align: right;
}

.total-title {
	font-weight: bold;
	text-transform: uppercase;
}

.summary-checkout {
	display: block;
}

.checkout-cta {
	display: block;
	float: none;
	font-size: 0.75rem;
	text-align: center;
	text-transform: uppercase;
	padding: 0.625rem 0;
	width: 100%;
}

.checkout-btn {
	display: block;
	float: none;
	font-size: 0.75rem;
	text-align: center;
	padding: 0.625rem 0;
	width: 100%;
	color: green;
	background-color: white;
}
/* 해당부분 제거
.favorite {
	width: 80px;
	display: block;
	vertical-align: top;
	float: right;
}
 */
.cartlogo {
	margin-top: 5px;
	width: 40px;
	height: 40px;
	float: left;
}

.cart-count {
	display: inline-block;
}

.select {
	display: inline-block;
}

#delbtn {
	width: 50px;
}

.delete {
	width: 83px;
	padding-top: 27px;
	text-align: center;
	font-size: 16px;
	color: #43484D;
	font-weight: 300;
}

.cart_p {
	text-decoration: line-through;
	margin: 0px;
}

.p_total {
	
}
</style>


</head>

<body>
	<div id="cart-wrap">
		<div class="container1">

			<div style="display: inline-block;">
				<div class="shopping-cart">
					<div class="container2">
						<img class="cartlogo"
							src="${contextPath}/resources/image/cart.png" />
						<div class="title">장바구니</div>
					</div>
					<div class="container3">

						<div class=select>
							<input type='checkbox' name='checked_cart' value='selectall'
								onclick='selectAll(this)' /> <b>전체선택</b>
						</div>
					</div>
					<c:choose>
						<c:when test="${CartList != null}">
							<c:forEach var="CartList" items="${CartList}" varStatus="index">

								<!-- <form name="cart" id = "cartForm" action="#" onsubmit="return order()"> -->
								<form name="cart" id="cartForm"
									action="${contextPath}/order/CartOrderForm.do"
									onsubmit="return order()">



									<div class="item-wrap">
										<div class="item">
											<div class="buttons">
												<input type="checkbox" class="checked_cart"
													name='checked_cart' value="${CartList.c_id}" checked>
												<input type="hidden" class="checked_Index"
													name="checked_Index" value="${index.index }">
											</div>

											<div class="image-wrap">
												<img class="imagegoods"
													src="${contextPath}/download1.do?g_id=${CartList.g_id}&cate=main" />
											</div>

											<div class="description-wrap">
												<div class="description">
													<br> <span><a
														href="${contextPath}/goods/goodsDetail.do?g_id=${CartList.g_id}">${CartList.g_name}</a></span>
													<input type="hidden" id="g_id" value="${CartList.g_id}">
													<span>${CartList.c_qty}개</span>
												</div>
											</div>
											<div class="quantity">
												<button type="button"
													onclick="location.href='${contextPath}/cart/plusCartGoods.do?c_id=${CartList.c_id}'"
													id="addbtn">+</button>
												&nbsp;<input type="text" id="o_goods_qty"
													value="${CartList.c_qty}" readonly>개&nbsp;
												<button type="button"
													onclick="location.href='${contextPath}/cart/minusCartGoods.do?c_id=${CartList.c_id}'"
													class="button" id="btn">-</button>
											</div>
											<c:choose>
												<c:when test="${CartList.g_saleprice != 0 }">
													<div class="total-price">
														<p class="cart_p">${CartList.g_price}원</p>${CartList.g_saleprice}원</div>
												</c:when>

												<c:otherwise>
													<div class="total-price">${CartList.g_price}원</div>
												</c:otherwise>

											</c:choose>
											<div class="delete">
												<a
													href="${contextPath}/cart/removeCartGoods.do?c_id=${CartList.c_id}"
													class="button" id="delbtn"> X</a>
											</div>
										</div>
									</div>
									<input type="hidden" id="OrderToCart" name="OrderToCart"
										value="">
								</form>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<td>주문 내역이 없습니다.</td>
						</c:otherwise>
					</c:choose>




				</div>
			</div>
		</div>
		<div class="cart-count">
			<div class="summary">
				<div class="summary-total-items">
					<span class="total-items"></span> 총 3개
				</div>
				<div class="summary-subtotal">
					<c:forEach var="item" items="${CartList }">

					</c:forEach>
					<div class="promo-title">총 금액</div>
					<div class="subtotal-value final-value" id="basket-subtotal">${total}원</div>
					<div class="promo-title">총 배송비</div>
					<div class="promo-value final-value" id="basket-promo dele">

					${totalDele }원
					</div>
				</div>
				<div class="summary-total">
					<div class="total-title">총액</div>
					<div class="total-value final-value" id="basket-total">
						<p id="p_total">
							<%-- <input type="text" id="p_total" name="total" value="${total }"
								onchange="check_total()">원 --%>
								${total} 원
						</p>
					</div>
				</div>
				<div class="summary-checkout">
					<button class="checkout-btn" type="submit" form="cartForm">주문하기</button>

				</div>
			</div>
		</div>
	</div>



</body>
</html>