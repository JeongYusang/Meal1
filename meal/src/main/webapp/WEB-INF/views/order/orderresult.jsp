<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div module="Order_result" unroll=1>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<style>
body{
background: white;
}
#main-wrap{
    background: #efefef;
}
</style>
</head>
<body>
<div id="main-wrap">
    <div class="orderInfo">
        <p>
            <strong>고객님의 주문이 완료 되었습니다.</strong>
            주문내역 및 배송에 관한 안내는 <a href="/myshop/order/list.html">주문조회</a> 를 통하여 확인 가능합니다.
        </p>
        <ul>
            <li>주문번호 : <strong>100000</strong></li>
            <li>주문일자 : <span>2022/04/11</span></li>
        </ul>
    </div>
    <div class="orderArea">
        <div class="title">
            <h3>결제정보</h3>
        </div>
        <div class="boardView">
            <table border="1" summary="">
            <caption>결제정보</caption>
            <tbody>
                <tr>
                    <th scope="row">최종결제금액</th>
                    <td class="price">
                        <span>29,000원</span>
                    </td>
                </tr>
                <tr>
                    <th scope="row">결제수단</th>
                    <td>
                        <strong>카드결제</strong>
                        <p>
                            
                            일시불
                            
                        </p>
                       
                    </td>
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
        <table border="1" summary="" class="boardList {$normal_display|display}" nspace="normal">
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
            <tfoot>
                <tr>
                    <td colspan="7"><strong class="type">(포크찹 스테이크)20000원 + (볼케이노순두부찌개)10000원 - (마일리지)1000포인트 = 총 금액: 29,900</td>
                </tr>
            </tfoot>
            <tbody module="Order_normalresultlist">
                <tr> 
                    <td><a href="/product/detail.html{$param}"><img src=""${contextPath}/resources/image/new1.png" width="100px"
					height="100px" onerror="this.src='http://img.echosting.cafe24.com/thumb/img_product_small.gif';" alt="" /></a></td>
                    <td class="product">
                        <a href="/product/detail.html{$param}"><strong>포크찹 스테이크</strong></a>
                        <ul class="option" module="Order_optionSet">
                            <li>2개</li>
                        </ul>
                    </td>
                    <td class="price">10000원</div></td>
                    <td class="quantity">1개</td>
                    <td class="mileage">100포인트</td>
                    <td class="total">10000원 * 1개 = 10000원</div></td>
                </tr>
                <tr>
                    <td class="thumb"><a href="/product/detail.html{$param}"><img src="" onerror="this.src='http://img.echosting.cafe24.com/thumb/img_product_small.gif';" alt="" /></a></td>
                    <td class="product">
                        <a href="/product/detail.html{$param}"><strong>포크찹 스테이크</strong></a>
                        <ul class="option" module="Order_optionSet">
                            <li>2개</li>
                        </ul>
                       
                    </td>
                    <td class="price">10000원</div></td>
                    <td class="quantity">1개</td>
                    <td class="mileage">100포인트</td>
                    <td class="total">10000원 * 2개 = 20000원</td>
                    </tr>
                     
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
                    <th scope="col"><span>총 주문 금액</span><a href="#none" onclick="{$total_order_layer_on}" class="more"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif" alt="내역보기" /></a></th>
                    <th scope="col" class="{$total_sale_display|display}">사용 마일리지</span></th>
                    <th scope="col">총 결제금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="{$total_sale_css}"><div class="box">주문 총액: 10000원 + 배송비: 3000원 = 13000원</div></td>
                    <td class="option {$total_sale_display|display}"><div class="box">1000포인트</div></td>
                    <td class="total"><div class="box">주문 총액: 13000원 - 마일리지 1000 = 12000원</div></td>
                </tr>
            </tbody>
            </table>
        </div>
            <div class="{$total_mileage_summary_display|display}">
                <table border="1" summary="">
                <caption>적립예정 내역</caption>
                <tbody>
                    <tr class="total">
                        <th scope="row">총 적립예정 마일리지</th>
                        <td>100포인트</td>
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
                    <td>한태상</td>
                </tr>
                <tr>
                    <th scope="row">우편번호</th>
                    <td>12345}</td>
                </tr>
                <tr>
                    <th scope="row">주소</th>
                    <td>대전 서구 둔산동 8-21 303호</td>
                </tr>
                <tr>
                    <th scope="row">일반전화</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">휴대전화</th>
                    <td>01029127989</td>
                </tr>
                <tr>
                    <th scope="row">배송메시지</th>
                    <td>택배 경비실에 맡겨주세요</td>
                </tr>
                <tr class="{$hope_date_display|display}">
                    <th scope="row">희망배송일</th>
                    <td><strong>2022-04-15</strong></td>
                </tr>
                <tr class="{$sc_display|display}">
                    <th scope="row">배송업체</th>
                    <td>cj</td>
                </tr>
            </tbody>
            </table>
        </div>
    </div>
   <br>
    <div class="btnArea">
    
        <span class="center">
            <a href="${contextPath}/main/main.do"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_ing.gif" alt="쇼핑계속하기" /></a>
            <a href="/myshop/order/list.html"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_check.gif" alt="주문확인하기" /></a>
        </span>
    </div>
    <!-- 이용안내 -->
    <div class="help">
        <h3>이용안내</h3>
        <div class="content">
            <ul>
                <li class="item2">배송은 결제완료 후 지역에 따라 1일 ~ 3일 가량이 소요됩니다. </li>
                <li class="item3">상품별 자세한 배송과정은 주문조회를 통하여 조회하실 수 있습니다.</li>
                <li class="item4">주문의 취소 및 환불, 교환에 관한 사항은 이용안내의 내용을 참고하십시오.</li>
            </ul>
        </div>
    </div>
    </div>
</body>
</html>