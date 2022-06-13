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
	height: 1000px;
	position: relative;
	overflow: hidden;
}

.div2 {
	width: 335px;
	height: 100px;
	background: #ffc0cf;
	text-align: center;
	font-size: 50px;
	line-height: 100px;
	margin-left: 33%;
	display: inline-block
}

.div2-1 {
	display: inline-block;
	float: right;
	margin-right: 10%;
	margin-top: 20px;
	font-size: 20px;
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

.div4 .tabmenu {
	width: 100%;
	margin: 0 auto;
	position: relative;
	margin: 0 auto;
}

.div4 .tabmenu ul li {
	display: inline-block;
	width: 300px;
	height: auto;
	text-align: center;
	background: #ffc0cf;
	margin: 0 27px;
}

.div4 .tabmenu label {
	display: block;
	width: 100%;
	height: 100px;
	font-size: 35px;
}

.div4 .tabmenu input {
	display: none;
}

.div4 .tabCon {
	display: none;
	text-align: left;
	left: 0;
	top: 80%;
	position: absolute;
	box-sizing: border-box;
	width: 100%;
	height: 800px;
	border: 5px solid #ffc0cf;
}

.div4 .tabmenu input:checked ~ label {
	background: hotpink;
}

.div4 .tabmenu input:checked ~ .tabCon {
	display: block;
}
</style>
</head>
<body>
<form action="url" method="post" enctype="multipart/form-data">
	<div class="div1">
		<div class="div3">
			<div class="div3-1" >${sellerVO.s_Wname } </div> <div class="div3-2">${sellerVO.s_id } </div> 
			<div class="div3-3">이번달 판매금액 <br> 총 판매 금액 </div>
		</div>
		<div class="div4">
			<div class="tabmenu">
				<ul>
					<li id="tab1" class="btnCon"><input type="radio" checked
						name="tabmenu" id="tabmenu1"> <label for="tabmenu1">N<br>등록된 상품
					</label>
						<div class="tabCon">
						<div class="main-container">
				<div class="table-container">
					<table id="stable-striped">
						<thead>
							<tr id="top-table">
								<th onclick="sortTable(0)" width="80px">상품ID</th>
								<th onclick="sortTable(1)" width="60px">상품명</th>
								<th onclick="sortTable(2)" width="40px">카테고리</th>
								<th onclick="sortTable(3)" width="100px">수량</th>
								<th onclick="sortTable(4)" width="100px">가격</th>
								<th onclick="sortTable(5)" width="120px">등록상태</th>
								<th onclick="sortTable(6)" width="70px">할인</th>
								<th onclick="sortTable(7)" width="100px">할인기간</th>
								<th onclick="sortTable(8)" width="100px">인분수</th>
								<th onclick="sortTable(9)" width="100px">보관방법</th>
								<th onclick="sortTable(10)" width="70px">등록날짜</th>
								<th>수정 및 삭제</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty goodsList}">
								<tr>
									<td colspan=5 class="fixed"><strong>등록된 상품이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:when test="${not empty goodsList}">
								
								<c:forEach var="item" items="${goodsList}" begin="0" end="15">
									<tr class="border-bottom">
										<td>${item.g_id}</td>
										<td>${item.g_name}</td>
										<td>${item.g_cate2}</td>
										<td>${item.g_amount}</td>
										<td>${item.g_price}</td>
										<td>${item.g_state}</td>
										<!-- 추후 표기방식 변경 예정 -->
										<td>${item.g_saleWon}, ${item.g_salePer}</td>
										<td>
											<fmt:formatDate value="${item.g_saleDate1}" type="Date" dateStyle="short"/> ~ 
											<fmt:formatDate value="${item.g_saleDate2}" type="Date" dateStyle="short"/>
										</td>
										<td>${item.g_inbun}</td>
										<td>${item.g_bang}</td>
										<td><fmt:formatDate value="${item.g_creDate}" type="Date" dateStyle="short" /></td>
										<td>
											<a href="${contextPath}/goods/updateGoodsForm.do?g_id=${item.g_id}">수정하기</a>
											<br>
											<br>
											<a href="${contextPath}/goods/deleteGoods.do?g_id=${item.g_id}" onClick="delOk()">삭제하기</a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
					<center>
						<div class="" id="pagination">
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/seller/sellerMypage.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/seller/sellerMypage.do?section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page == 10 }">
									<a
										href="${contextPath}/seller/sellerMypage.do?section=${section}+1&pageNum=${section*10}+1">다음</a>
								</c:if>
							</c:forEach>
						</div>
					</center>

				</div>
			</div>
						</div></li>
					<li id="tab2" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu2"> <label for="tabmenu2">N<br>배송정보
					</label>
						<div class="tabCon">내용물2</div></li>
					<li id="tab3" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu3"> <label for="tabmenu3">N<br>작성게시글
					</label>
						<div class="tabCon">내용물3</div></li>
				</ul>
			</div>
		</div>

	</div>
</form>
</body>
</html>