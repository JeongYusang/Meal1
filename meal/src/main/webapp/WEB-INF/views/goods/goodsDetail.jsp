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
   height: 1260px;
}

.detail1 {
   text-align: center;
   display: inline-block;
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
	text-align:center;
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

         if (hm.value < 0) {
            hm.value = 0;
         }
         sum.value = parseInt(hm.value) * sell_price;
      }
   </script>
   <div id="main-wrap">
      <div class="container">
         <img src="${contextPath}/download1.do?g_id=${goodsInfo.g_id}&cate=main" width="500px"
            height="500px" id="titleimg"/>
         <div style="display: block; vertical-align: top;">
            <br> <br> <br> 
            <b style="font-size: 52px">${goodsInfo.g_name}</b>

            <h1>${goodsInfo.g_price }원</h1>
            <br> 
            <div id="text">
               <h4>${goodsInfo.g_detail1 }</h4>
               <h4>
                  <b>유통기한</b> : ${goodsInfo.g_eatDate }
               </h4>
               <h4>판매단위 : ${goodsInfo.g_inbun }</h4>
               <h4>알레르기 정보 : ${goodsInfo.g_allergy_M }</h4>
            </div>
            <div id="price">
               <form name="form" method="get" enctype="multipart/form-data">

                  <b>수량 : &nbsp;<input type="button" value=" + "
                     onclick="add();"> <input type=hidden name="sell_price"
                     value="${goodsInfo.g_price }"> <input type="text" name="amount" value="1"
                     size="1" onchange="change();"> <input type="button"
                     value=" - " onclick="del();"><br> <br> 금액 : <input
                     type="text" name="sum" size="8"
                     style="width: 100px; height: 30px; font-size: 30px; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">원
                  </b>
               </form>
            </div>
            <br> <a href="./products.jsp" class="button">찜하기</a> 
            <a href="${contextPath}/order/OrderForm.do?g_id=${goodsInfo.g_id}&o_goods_qty=1" class="button"> 구매하기</a> 
            <a href="${contextPath }/main/cart.do" class="button">장바구니담기</a>
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
            <h1>상품상세정보</h1>
            <div class="detail">
               <iframe width="100%" height="600px;"
                  src="https://www.youtube.com/embed/nWHeZkrQix0?&loop=1">
               </iframe>
               

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
                  	<c:when test="${empty boardGRInfo }">
                     <tr class="border-bottom">
                     	<td colspan=5 class="fixed"><strong>등록된 상품이 없습니다.</strong></td>
                     </tr>
                    </c:when>
                    <c:when test="${not empty boardGRInfo }">
                  <c:forEach var="item" items="${boardGRInfo}" begin="0" end="10">
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
                  <span class="fa fa-star" style="color: grey;"></span>
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
            </c:choose>
                     <ul id="slider1">
                        <li id="slider1-1">
                        	<span id="slide1-11">${item.title}                               </span>

                        	<p><img src="${contextPath}/thumbnailsBoard.do?b_gr_id=${item.b_gr_id}&fileName=${item.fileName }"/><br>
                        		${item.content}
                        	</p>
                        	<p class="pDDAK">${item.creDate}
                        	</p>
                        </li>
                     </ul>
                     </div>
                     </c:forEach>
                    
                     </c:when>
                     </c:choose>
                  </tbody>
               </table>
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
                  	<c:when test="${empty board21 }">
                     <tr class="border-bottom">
                     	<td colspan=5 class="fixed"><strong>등록된 게시물이 없습니다.</strong></td>
                     </tr>
                    </c:when>
                    <c:when test="${not empty board21 }">
                    <c:forEach var="item" items="${board21}" begin="0" end="10">
                     <ul id="slider1">
                        <li id="slider1-1">
                        	<span id="slide1-11">${item.title} ${item.u_id} </span>
                        	<p>${item.content} </p>
                        	<p class="pDDAK">${item.creDate}
                        	</p>
                        </li>
                     </ul>
                     </c:forEach>
                     </c:when>
                     </c:choose>
                  </tbody>
               </table>
            </div>
         </div>
         <div id="tab-4" class="tab-content">
            <div class="detail">
               <table class="review-table">
                  <tr>
                  <td>
                    <img src="/meal/resources/image/delivery.jpg" height="1250px" width="100%">
                  </td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
   </div>
</body>
<script>
$(document).ready(function(){
	  $("p p").hide();
	  // $("ul > li:first-child a").next().show();
	  $("ul li span").click(function(){
	    $(this).next().slideToggle(300);
	    // $(this).next().slideDown(300);
	    $("ul li span").not(this).next().slideUp(300);
	    return false;
	  });
	  $("ul li span").eq(0).trigger("click");
	});
</script>
</html>