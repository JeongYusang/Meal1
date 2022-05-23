<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<meta charset="utf-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>

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

 }
 function selectAll(selectAll)  {
	   const checkboxes 
	        = document.getElementsByName('animal');
	   
	   checkboxes.forEach((checkbox) => {
	     checkbox.checked = selectAll.checked;
	   })
	 }
	
</script>

<style>

#main {
	margin-top: 30px;

    }
    
.cart-wrap {
	width:100%;
    height: auto;
    margin-left: 60px;

	
	font-family: 'Roboto', sans-serif;

}

.container1 {
position:static;
width:100%;
float: left;

}

.shopping-cart {

    width: 750px;
    height: 800px;
    margin: auto;
    margin-left: 30px;
    background: #FFFFFF;
    box-shadow: 1px 2px 3px 0px rgb(0 0 0 / 10%);
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

.item-wrap{
width:100%;
display:flex;
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

   height:70px;
   width:70px;
} 



.description-wrap{

}
.description {


   width:350px;
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

.quantity input{
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
	padding-top: 27px;
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

.favorite{
width: 80px;
display: block; 
vertical-align: top;
float: right;
}

.cartlogo{
margin-top: 5px;
 width: 40px;
 height: 40px;
 float: left;

}
.cart-count{
display: inline-block;
    position: fixed;
    top: 20%;
    right: 21%;
}
.select{
display:inline-block; 

}
</style>
</head>

<body>
<div id="cart-wrap">
	<div class="container1">

		<div style="display: inline-block;">
				<div class="shopping-cart">
				<div class="container2">
					<img class="cartlogo" src="${contextPath}/resources/image/cart.png" />
					<div class="title">장바구니</div>
					</div>
					<div class= "container3">
					
					<div class=select>
						<input type='checkbox' name='animal' value='selectall'
							onclick='selectAll(this)' /> <b>전체선택</b>
							</div>
				
				<button class="favorite">선택 삭제</button>
				<button class="favorite">선택 주문</button>
				</div>
				
				<!-- Product #1 -->
				<div class="item-wrap">
				<div class="item">
					<div class="buttons">
						<input
							type="checkbox"name='animal'>
					</div>

					<div class="image-wrap">
						<img class="imagegoods" src="${contextPath}/resources/image/new1.png" />
					</div>

					<div class="description-wrap">
						<div class="description">
							<br> <span><a href="${contextPath}/main/goodsDetail.do">포크찹 스테이크</a></span> <span>수량 2개</span>
						</div>
					</div>

					<div class="quantity">
						<input type="button" onclick="incrementValue()" value="+" /> 
						<input type="text" name="quantity" value="1" maxlength="2" max="10"
							size="1" id="number" />
						<input type="button" onclick="decrementValue()" value="-" />
					</div>

					<div class="total-price">20000원</div>
				</div>
</div>
				<!-- Product #2 -->
				<div class="item-wrap">
					<div class="item">
						<div class="buttons">
							<input type="checkbox"name='animal'>
						</div>

						<div class="image-wrap">
							<img class="imagegoods" src="${contextPath}/resources/image/new1.png" />
						</div>
							<div class="description-wrap">
								<div class="description">
								<br> <span>볼케이노순두부전골</span> <span>수량 1개</span>
								</div>
							</div>

						<div class="quantity">
							<form name="form" method="get">
								<input type="button" value=" + " onclick="add();"> <input
									type=hidden name="sell_price" value="10000"> <input
									type="text" name="amount" value="1" size="3"
									onchange="change();"> <input type="button" value=" - "
									onclick="del();">
									</form>
						</div>

						<div class="total-price">20000원</div>
					</div>
				</div>
			</div>
		</div>
</div>
		<div class="cart-count">
			<div class="summary">
				<div class="summary-total-items">
					<span class="total-items"></span> 총 3개
				</div>
				<div class="summary-subtotal">
					<div class="promo-title">총 배송비</div>
					<div class="subtotal-value final-value" id="basket-subtotal">30000원</div>
					<div class="promo-title">총 배송비</div>
					<div class="promo-value final-value" id="basket-promo">3000원</div>
				</div>
				<div class="summary-total">
					<div class="total-title">총액</div>
					<div class="total-value final-value" id="basket-total">33000원</div>
				</div>
				<div class="summary-checkout">
					<button class="checkout-btn" onclick="document.location.href='./order1.do'">주문하기</button>
				</div>
			</div>
		</div>
</div>



</body>
</html>