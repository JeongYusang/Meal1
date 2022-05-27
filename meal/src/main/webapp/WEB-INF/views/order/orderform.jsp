<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- 주문자 휴대폰 번호 -->
<c:set var="orderer_hp" value="" />
<!-- 최종 결제 금액 -->
<c:set var="final_total_order_price" value="0" />

<!-- 총주문 금액 -->
<c:set var="total_order_price" value="0" />
<!-- 총 상품수 -->
<c:set var="total_order_goods_qty" value="0" />
<!-- 총할인금액 -->
<c:set var="total_mileage_use" value="0" />
<!-- 총 배송비 -->
<c:set var="total_delivery_price" value="0" />

<head>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    
  window.onload=function()
  {
    init();
  }

  function init(){
  	var form_order=document.form_order;
  	var h_tel1=form_order.h_tel1;
  	var h_hp1=form_order.h_hp1;
  	var tel1=h_tel1.value;
  	var hp1=h_hp1.value;
  	var select_tel1=form_order.tel1;
  	var select_hp1=form_order.hp1;
  	select_tel1.value=tel1;
  	select_hp1.value=hp1;
  }
  
/*   $(function () {
	  $("#o_useMile").keydown(function () {
	    // Save old value.
	    if (!$(this).val() || (parseInt($(this).val()) <= ${memberInfo.u_mile} && parseInt($(this).val()) >= 0))
	    $(this).data("old", $(this).val());
	  });
	  $("#o_useMile").keyup(function () {
	    // Check correct, else revert back to old value.
	    if (!$(this).val() || (parseInt($(this).val()) <= ${memberInfo.u_mile} && parseInt($(this).val()) >= 0));
	    else
	      $(this).val($(this).data("old"));
	    alert("보유 마일리지")
	  });
	}); */
	//var s_name = document.asdfqwre

	// 결제창
/* 	var IMP = window.IMP; // 생략 가능
	IMP.init('imp53396567');
	function fn_buyBTN() {
		IMP.request_pay({
			pg : 'html5_inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_',
			name : '${goodsInfo.g_name}',
			amount : 100, //판매 가격
			buyer_email : '${memberInfo.u_email1} + ${memberInfo.u_email2}',
			buyer_name : '${memberInfo.u_name}',
			buyer_tel : '${memberInfo.u_hp1}',
			buyer_addr : '${memberInfo.u_addr2} + ${memberInfo.u_addr3}',
			buyer_postcode : '${memberInfo.u_addr3}'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				
				// action="" 보낼 컨트롤러  +summit;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	}; */
	
	var IMP = window.IMP; // 생략 가능
	IMP.init('imp53396567');

	function fn_buyBTN() {
		
	 IMP.request_pay({
		 pg : 'html5_inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '${goodsInfo.g_name}1',
			amount : 100, //판매 가격
			buyer_email : '${memberInfo.u_email1} + ${memberInfo.u_email2}',
			buyer_name : '${memberInfo.u_name}',
			buyer_tel : '${memberInfo.u_hp1}',
			buyer_addr : '${memberInfo.u_addr2} + ${memberInfo.u_addr3}',
			buyer_postcode : '${memberInfo.u_addr3}'
	    }, function (rsp) { // callback
	      if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	        // jQuery로 HTTP 요청
	        jQuery.ajax({
	            url: "${contextPath}/order/insertOrder.do", // 예: https://www.myservice.com/payments/complete
	            method: "POST",
	            data: {
	                o_id: rsp.merchant_uid,
	                u_name: rsp.buyer_name,
	                g_name: rsp.name,
	                o_goods_qty: rsp.amount,
	                o_goods_price: rsp.paid_amount,
	                pay_method: rsp.pay_method,
	                pay_order_time: new Date().getTime(),
	                pay_method: rsp.pay_method,
	                card_pay_month: rsp.card_quota,
	                receiver_hp: document.getElementById("receiver_hp").value,
	                receiver_name: document.getElementById("receiver_name").value,
	        		receiver_addr1: document.getElementById("zipcode").value,
	        		receiver_addr2: document.getElementById("roadAddress").value,
	        		receiver_addr3: document.getElementById("namujiAddress").value,
	        		deliver_message: document.getElementById("deliver_message").value,
	        		deliver_method: document.getElementById("deliver_method").value,
	        		o_useMile: document.getElementById('o_useMile').value
	            }
	        }).done(function (data) {
	        	console.log()
	        })
	      } else {
	        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	      }
	    });
	}
/* 	total_mileage_use = document.getElementById('o_useMile').value; */
     
</script>
<style>
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

input.underline {
	　border-left-width:0;
　border-right-width:0;
　border-top-width:0;
　border-bottom-width:1;
}
//숫자 인풋박스 화살표 없애기
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
 input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
</style>
<c:if test='${not empty message}'>
	<script>
      window.onload = function() {
         result();
      }
      function result() {
         alert(${message});
      }
   </script>
</c:if>
</head>
<body>
	<div id="main-wrap">
		<form name="form_order">
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
						<td class="goods_image"><img
							src="${contextPath}/resources/image/new4.PNG" width="50px"
							height="50px" /> <a
							href="${pageContext.request.contextPath}/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
							<input type="hidden" id="h_goods_title" name="h_goods_title"
							value="${item.g_name}" /></td>
						<td>
							<h4>1개</h4> <input type="hidden" id="order_goods_qty"
							name="h_order_goods_qty" value="${item.o_goods_qty}" />
						</td>
						<td>${item.o_goods_price}</td>
						<td>< <c:if test=""></c:if>
						</td>
						<td>${item.totalprice *0.9}</td>
						<td>13000원 <input type="hidden" id="each_goods_price"
							name="each_goods_price"
							value="${item.goods_price * item.order_goods_qty}" />
						</td>
					</tr>
					<tr class="line">
						<td class="goods_image"><img
							src="${contextPath}/resources/image/new4.PNG" width="50px"
							height="50px" /> <a
							href="${pageContext.request.contextPath}/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
							<input type="hidden" id="h_goods_title" name="h_goods_title"
							value="${item.g_name}" /></td>
						<td>
							<h4>1개</h4> <input type="hidden" id="order_goods_qty"
							name="h_order_goods_qty" value="${item.o_goods_qty}" />
						</td>
						<td>${item.o_goods_price}</td>
						<td><c:if test=""></c:if></td>
						<td>${item.totalprice *0.9}</td>
						<td>13000원 <input type="hidden" id="each_goods_price"
							name="each_goods_price"
							value="${item.goods_price * item.order_goods_qty}" />
						</td>
					</tr>
					<c:set var="final_total_order_price"
						value="${final_total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
					<c:set var="total_order_price"
						value="${total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
					<c:set var="total_order_goods_qty"
						value="${total_order_goods_qty+item.order_goods_qty }" />
				</tbody>
			</table>
			<H1>2.배송지 정보</H1>
			<DIV class="detail_table">

				<table>
					<tbody>

						<tr class="line">
							<td class="fixed_join"><h4>받으실 분</h4></td>
							<td><input id="receiver_name" name="receiver_name"
								type="text" size="40" value="${memberInfo.u_name }" /> <%-- <input type="hidden" id="receiver_name" name="receiver_name"
								value="${memberInfo.u_name }" /> --%>
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
									<button>
										<a href="javascript:execDaumPostcode()">우편번호검색</a>
									</button> <br> <br> 도로명 주소: <input type="text"
									id="roadAddress" name="receiver_addr2" size="50"
									value="${memberInfo.u_addr2 }" /> <br> <br> 나머지 주소:
									<input type="text" id="namujiAddress" name="receiver_addr3"
									size="50" value="${memberInfo.u_addr3 }" />
						</c:if>
						<c:if test="${memberInfo.u_addr1 == null}">
							<tr class="line">
								<td class="fixed_join">주소</td>
								<td><input type="text" id="zipcode" name="zipcode" size="5"
									value="${orderer.zipcode }"> <a
									href="javascript:execDaumPostcode()">우편번호검색</a> <br> 도로명
									주소:<br> <input type="text" id="roadAddress"
									name="roadAddress" size="50" value="${orderer.roadAddress }" />
									
									<br>
								<br> 나머지 주소: <input type="text" id="namujiAddress"
									name="namujiAddress" size="50" value="" /> 
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
						<tr>
						<input type="radio" id="deliver_method" name="deliver_method"/>
					 새벽배송
					 <input type="radio" id="deliver_method" name="deliver_method"/>
					일반택배
						</tr>
						</tboby>
				</table>
			</div>
			<div>
				<h2>3.주문고객</h2>
				<table>
					<tbody>
						<tr class="line">
							<td><h4>이름</h4></td>
							<td><input type="text" value="${memberInfo.u_name }"
								size="15" /></td>
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
							<td><h3>보유 마일리지 ${memberInfo.u_mile}원</h3></td>
						</tr>
						<tr>
							<td>마일리지 사용</td>
							<td><input class="underline" id="o_useMile" name="o_useMile" type="number"
								size="10" min = "0" max="${memberInfo.u_mile}"oninput="MaxInput()"/>원&nbsp;&nbsp;
								<button>모두 사용하기</button></td>
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
						<td id="">
							<p id="p_totalNum">${total_order_goods_qty}개</p> <input
							id="h_total_order_goods_qty" type="hidden"
							value="${total_order_goods_qty}" />
						</td>
						<td>
							<p id="p_totalPrice">${total_order_price}원</p> <input
							id="h_totalPrice" type="hidden" value="${total_order_price}" />
						</td>
						<td>
							<p id="p_totalDelivery">${total_delivery_price }원</p> <input
							id="h_totalDelivery" type="hidden"
							value="${total_delivery_price}" />
						</td>
						<td>
							<p id="p_totalSalesPrice">${total_mileage_use}원</p> <input
							id="total_mileage_use" type="hidden"
							value="${total_mileage_use}" />
						</td>
						<td>
							<p id="p_final_totalPrice">
								<font size="15">${final_total_order_price }원 </font>
							</p> <input id="h_final_total_Price" type="hidden"
							value="${final_total_order_price}" />
						</td>
					</tr>
				</tbody>
			</table>
			<br> <br> <br>
		</form>

		<br>
		<center>
			<input class='order' type='button' value='결제하기' onclick="fn_buyBTN()" />
			<button class="order">
				<a href="${contextPath}/main/main.do">메인으로 가기</a>
			</button>
		</center>
	</div>
</body>
</html>
