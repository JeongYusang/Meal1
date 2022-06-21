<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sum" value="${orderVO.sum + orderVO.d_price}" />



<head>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//Daum 주소 API
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("zipcode").value = data.zonecode;
            document.getElementById("roadAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("ex_detailAddress").focus();
        }
    }).open();
}
    

var IMP = window.IMP; // 생략 가능
IMP.init('imp53396567');
function fn_buyBTN() {
   var userMileage = document.getElementById("max_mile").value;
   
   
   
   IMP.request_pay({
                  pg : 'html5_inicis', // version 1.1.0부터 지원.
                  pay_method : 'card',
                  merchant_uid : 'merchant_' + new Date().getTime(),
                  name : document.getElementById("g_name").value,
                  amount : document.getElementById("final_total_Price").value, //판매 가격
                  buyer_email : '${memberInfo.u_email1} + ${memberInfo.u_email2}',
                  buyer_name : '${memberInfo.u_name}',
                  buyer_tel : '${memberInfo.u_hp1}',
                  buyer_addr : '${memberInfo.u_addr2} + ${memberInfo.u_addr3}',
                  buyer_postcode : '${memberInfo.u_addr1}'
               }, function(rsp) {
                     if ( rsp.success ) {
                           //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                           $.ajax({
                              url : "${contextPath}/order/insertOrder.do", //cross-domain error가 발생하지 않도록 주의해주세요
                              type: 'POST',
                              data : {
                              u_id : document.getElementById("u_id").value,
                              g_id : document.getElementById("g_id").value,
                              s_id : document.getElementById("s_id").value,
                              u_name : rsp.buyer_name,
                              g_name : rsp.name,
                              o_goods_qty : document.getElementById("h_order_goods_qty").value,
                              o_goods_price : document.getElementById("g_price").value,
                              pay_method : rsp.pay_method,
                              card_pay_month : rsp.card_quota,
                              receiver_hp : document.getElementById("receiver_hp").value,
                              receiver_name : document.getElementById("receiver_name").value,
                              receiver_addr1 : document.getElementById("zipcode").value,
                              receiver_addr2 : document.getElementById("roadAddress").value,
                              receiver_addr3 : document.getElementById("namujiAddress").value,
                              deliver_message : document.getElementById("deliver_message").value,
                              deliver_method : document.getElementById("deliver_method").value,
                              o_useMile : document.getElementById('o_useMile').value
                           }
                           }).done(function(data) {
                                 if ( everythings_fine ) {
                                    msg = '결제가 완료되었습니다.';
                                    msg += '\n고유ID : ' + rsp.imp_uid;
                                    msg += '\n결제 금액 : ' + rsp.paid_amount;
                                    msg += '카드 승인번호 : ' + rsp.apply_num;
                                    alert(msg);
                                 } else {
                                    //[3] 아직 제대로 결제가 되지 않았습니다.
                                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                                 }
                              });
                              //성공시 이동할 페이지
                              location.replace("${contextPath}/order/OrderResult.do");
                           } else {
                              msg = '결제에 실패하였습니다.';
                              msg += '에러내용 : ' + rsp.error_msg;
                              //실패시 이동할 페이지
                              location.href="${contextPath}/order/OrderForm.do?g_id=${goodsVO.g_id}&o_goods_qty=${orderVO.o_goods_qty}";
                              alert(msg);
                           }
                        });
   }


	
	

	function calculatePay() {
		var price1 = document.getElementById("totalPrice").value;
		var price2 = document.getElementById("o_useMile").value;
		var userMileage = document.getElementById("max_mile").value;
		if(userMileage< price2){
		alert ("보유 마일리지보다 큰 금액을 입력하였습니다.");
		document.order.u_mile.value = 0;
		document.getElementById("orderBTN").disabled = true;
		}else{
		
		document.order.FinalTotalPrice.value = parseInt(price1) + ${orderVO.d_price} - parseInt(price2);
		document.order.u_mile.value = price2;
		document.getElementById("orderBTN").disabled = false;
		}
		
	}



	function maxMile(){
		var price1 = document.getElementById("totalPrice").value;
		     if(${memberInfo.u_mile} > ${orderVO.sum}) {
			
	var price2 = document.getElementById("o_useMile").value;
			var useMile = parseInt(price1) + ${orderVO.d_price} - 100;
			document.getElementById("o_useMile").value = useMile;
			
			document.order.FinalTotalPrice.value = 100;
			document.order.u_mile.value = useMile;
		}else {
				document.getElementById("o_useMile").value = ${memberInfo.u_mile};
				var price2 = document.getElementById("o_useMile").value;
		
				document.order.FinalTotalPrice.value = parseInt(price1) + ${orderVO.d_price} - parseInt(price2);
				document.order.u_mile.value = price2;
				
			}
		}
</script>

<style type="text/css">
.order {
	border: none;
	color: white;
	padding: 15px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

#post {
	text-align: center;
	display: inline-block;
	border: none;
}

#list_view {
	font-size: 12px;
}

.list_view {
	border-collapse: collapse;
}

.list_view th, .list_view td {
	border: 1px solid black;
}

#main-wrap {
	display: block;
}

.goods_info {
	border-collapse: collapse;
}

.goods_info .line {
	border-bottom: 1px solid black;
}

.goods_info img {
	width: 80px;
	height: 80px;
}

.goods_info thead {
	font-size: 14px;
	text-align: center;
	color: black;
	background-color: #ffc0cf;
}

.detail_table tr {
	border: 1px solid black;
}

#final_total_Price, #max_mile, #totalPrice, #u_mile {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px; /* 테두리 없애기 */
	outline: none;
	select-dummy: expression(this.hideFocus = true); /* 링크 점선없애기 */
}

//
숫자 인풋박스 화살표 없애기
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}
</style>
<c:if test='${not empty message}'>
	<script>
		window.onload = function() {
			result();
		}
		function result() {
			alert("${message}");
		}
	</script>
</c:if>
</head>
<body>
	<div id="main-wrap">
		<form name="order" onsubmit="return fn_buyBTN()">
			<input type="hidden" id="g_name" value="${goodsVO.g_name}"> 
			<input type="hidden" id="g_id" value="${goodsVO.g_id}">
			<input type="hidden" id="s_id" value="${goodsVO.s_id}">
			<input type="hidden" id="g_price" value="${goodsVO.g_price}">
			<H1>1.주문확인</H1>
			<table class="goods_info">
				<thead>
					<tr class="line">
						<td width="130px">주문상품명</td>
						<td width="100x">수량</td>
						<td width="100px">주문금액</td>
						<td width="100px">배송비</td>
						<td width="100px">예상적립금</td>
						<td width="100px">주문금액합계</td>
					</tr>
				</thead>
				<tbody align=center>
					<tr class="line">
						<td class="goods_image"><img src="${contextPath}/download1.do?g_id=${goodsVO.g_id}&cate=main" width="50px" height="50px" /> 
						<a href="${contextPath}/goods/goodsDetail.do?g_id=${goodsVO.g_id}"><br>${goodsVO.g_name}</a>
						<td>
							<h4>${orderVO.o_goods_qty}</h4> <input type="hidden"
							id="h_order_goods_qty" name="h_order_goods_qty"
							value="${orderVO.o_goods_qty}" />
						</td>
						<c:choose><c:when test = "${goodsVO.g_saleprice == 0}">
						<td>${goodsVO.g_price}원</td>
						
						</c:when>
						<c:otherwise>
						<td>${goodsVO.g_saleprice }</td>
						</c:otherwise>
						
						</c:choose>
						
						<td>${orderVO.d_price}원</td>
						
						<td>${goodsVO.g_price * 0.01}원</td>
						<td>${sum}원</td>
						
					</tr>
				</tbody>
			</table>
			<H1>2.배송지 정보</H1>
			<DIV class="detail_table">

				<table>
					<tbody>

						<tr class="line">
							<td class="fixed_join"><h4>받으실 분</h4></td>
							<td><input id="receiver_name" name="receiver_name"
								type="text" size="40" value="${memberInfo.u_name }" />
						</tr>
						<tr class="line">
							<td><h4>핸드폰</h4></td>
							<td><input type="text" name="receiver_hp"
								value="${memberInfo.u_hp1}" size="15" /><br></td>
						</tr>
						<c:if test="${memberInfo.u_addr1 != null}">
							<tr class="line">
								<td class="fixed_join"><h4>주소</h4></td>
								<td><input type="text" id="zipcode" name="zipcode" size="5"
									value="${memberInfo.u_addr1}">
										<a href="javascript:execDaumPostcode()">우편번호검색</a>
									<br> <br> 도로명 주소: <input type="text"
									id="roadAddress" name="receiver_addr2" size="50"
									value="${memberInfo.u_addr2 }" /> <br> <br> 나머지 주소:
									<input type="text" id="namujiAddress" name="receiver_addr3"
									size="50" value="${memberInfo.u_addr3 }" />
						</c:if>
						<c:if test="${memberInfo.u_addr1 == null}">
							<tr class="line">
								<td class="fixed_join">주소</td>
								<td><input type="text" id="zipcode" name="zipcode" size="5"
									"> <a
									href="javascript:execDaumPostcode()">우편번호검색</a> <br> 도로명
									주소:<br> <input type="text" id="roadAddress"
									name="roadAddress" size="50"  />

									<br> <br> 나머지 주소: <input type="text"
									 name="namujiAddress" id = "ex_detailAddress" size="50" value="" />
									<!-- <input
									type="hidden" id="h_zipcode" name="h_zipcode" value="" /> <input
									type="hidden" id="h_roadAddress" name="h_roadAddress" value="" />
									<input type="hidden" id="h_namujiAddress"
									name="h_namujiAddress" value="" /> --></td>
							</tr>
						</c:if>
						<tr class="line">
							<td class="fixed_join"><h4>배송메세지</h4></td>
							<td><input id="deliver_message" name="deliver_message"
								type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요." /></td>
						</tr>
					</tbody>
				</table>
				<input type="radio" id="deliver_method" name="deliver_method"
					value="새벽배송" /> 새벽배송 <input type="radio" id="deliver_method"
					name="deliver_method" value="일반택배" checked /> 일반택배


			</div>
			<div>
				<h2>3.주문고객</h2>
				<table>
					<tbody>
						<tr class="line">
							<td><h4>이름</h4></td>
							<td><input type="text" value="${memberInfo.u_name}"
								size="15" /> <input type="hidden" value="${memberInfo.u_id}"
								id="u_id" /></td>
						</tr>
						<tr class="line">
							<td><h4>핸드폰</h4></td>
							<td><input type="text" name="receiver_hp" id="receiver_hp"
								value="${memberInfo.u_hp1}" size="15" /></td>
						</tr>
						<tr class="line">
							<td><h4>이메일</h4></td>
							<td><input type="text"
								value="${memberInfo.u_email1}@${memberInfo.u_email2}" size="15" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="clear"></div>
			<br>


			<H2>4.할인 정보</H2>
			<div class="detail_table">
				<table>
					<tbody>
						<tr class="line">
							<td>보유 마일리지 <input type="text" size="5" id="max_mile"
								value="${memberInfo.u_mile}" readonly>원
							</td>
						</tr>
						<tr>
							<td>마일리지 사용 <input id="o_useMile" size="5" name="o_useMile"
								type="number" onChange="calculatePay()" value="0" />원
								<button type="button" name="useMile" id="useMile" onClick="maxMile()">모두
									사용</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="clear"></div>

			<br>
			<table class="list_view">
				<tbody>
					<tr align=center class="fixed">
						<td class="fixed">총 상품수</td>
						<td>총 상품금액</td>
						<td>총 배송비</td>
						<td>총 할인 금액</td>
						<td>최종 결제금액</td>
					</tr>
					<tr align=center>
						<td>${orderVO.o_goods_qty}<input id="h_total_order_goods_qty"
							type="hidden" value="${total_order_goods_qty}" />
						</td>
						<td><input id="totalPrice" type="text" value="${orderVO.sum}"
							size="10" onChange="calculatePay()" />원 <input id="h_totalPrice"
							type="hidden" value="${orderVO.sum}" /></td>
						<td>
							<p id="p_totalDelivery">${orderVO.d_price}원</p> <input
							id="h_totalDelivery" type="hidden" value="${orderVO.d_price}" />
						</td>
						<td><input type="number" id="u_mile" name="u_mile" value="0">원
						</td>
						<td><input id="final_total_Price" type="number"
							name="FinalTotalPrice" size=10 value="${sum}" readonly>원</td>
					</tr>
				</tbody>
			</table>
			<br> <br> <br>
		</form>

		<center>
			<input class='order' id="orderBTN" type='button' value='결제하기' onclick="fn_buyBTN()" />
			<button class="order">
				<a href="${contextPath}/main/main.do">메인으로 가기</a>
			</button>
		</center>
	</div>
</body>
</html>
