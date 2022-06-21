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
<script>
	function fn_delivUpdate(o_id,select_id) {
		var s_delivery_state = document.getElementById(select_id);
		var index = s_delivery_state.selectedIndex;
		var value = s_delivery_state[index].value;
		//console.log("value: "+value );

		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/admin/delivUpdate.do",
			data : {
				o_id : o_id,
				"delivery_state" : value
			},
			success : function(data, textStatus) {
				if (data.trim() == 'mod_success') {
					alert("배송 정보를 수정했습니다.");
					location.href = "${contextPath}/seller/sellerMypage.do";
				} else if (data.trim() == 'failed') {
					alert("다시 시도해 주세요.");
				}

			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다." + data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");

			}
		}); //end ajax		
	}
	
	function sortTable(n) {
		var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
		table = document.getElementById("stable-striped");
		switching = true;
		//Set the sorting direction to ascending:
		dir = "asc";
		/*Make a loop that will continue until
		no switching has been done:*/
		while (switching) {
			//start by saying: no switching is done:
			switching = false;
			rows = table.rows;
			/*Loop through all table rows (except the
			first, which contains table headers):*/
			for (i = 1; i < (rows.length - 1); i++) {
				//start by saying there should be no switching:
				shouldSwitch = false;
				/*Get the two elements you want to compare,
				one from current row and one from the next:*/
				x = rows[i].getElementsByTagName("TD")[n];
				y = rows[i + 1].getElementsByTagName("TD")[n];
				/*check if the two rows should switch place,
				based on the direction, asc or desc:*/
				if (dir == "asc") {
					if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
						//if so, mark as a switch and break the loop:
						shouldSwitch = true;
						break;
					}
				} else if (dir == "desc") {
					if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
						//if so, mark as a switch and break the loop:
						shouldSwitch = true;
						break;
					}
				}
			}
			if (shouldSwitch) {
				/*If a switch has been marked, make the switch
				and mark that a switch has been done:*/
				rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
				switching = true;
				//Each time a switch is done, increase this count by 1:
				switchcount++;
			} else {
				/*If no switching has been done AND the direction is "asc",
				set the direction to "desc" and run the while loop again.*/
				if (switchcount == 0 && dir == "asc") {
					dir = "desc";
					switching = true;
				}
			}
		}
	}
</script>
<style type="text/css">
.div1 {
	width: 1080px;
	height: 1250px;
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
    font-size: 45px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border: 5px solid #ffd3dd;
}

.div3 div {
	display: inline-flex;
}

.div3 .div3-1 {
	font-size: 30px;
}

.div3 .div3-2 {
	font-size: 15px;
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
	background: #ffd3dd;
	margin: 0 27px;
}

.div4 .tabmenu label {
	display: block;
	width: 100%;
	height: 100px;
	font-size: 35px;
}

.div4 .tabmenu #tabmenu1 {
	display: none;
}

.div4 .tabmenu #tabmenu2 {
	display: none;
}

.div4 .tabmenu #tabmenu3 {
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
	height: auto;
	border: 5px solid #ffc0cf;
}

.div4 .tabmenu input:checked ~ label {
	background: #ff69b45e;
}

.div4 .tabmenu input:checked ~ .tabCon {
	display: block;
}

tr.border-bottom {
    text-align: center;
}

thead#tap-head  {
	text-align: center;
}

th.header {
	padding-left: 6px;
	border-bottom: 5px solid #ffc0cf
}

.table-container {
    font-size: 14px;
    font-weight: 400;
}
td {
    border-bottom: 1px solid black;
    border-collapse: collapse;
}

.footer-wrap {
    margin-top: 10px;
}

td.fixed {
	text-align: center;
}

#stable-striped {
border-bottom: 1px solid black;
    border-collapse: collapse;

}
</style>
</head>
<body>
<form action="url" method="post" enctype="multipart/form-data">
	<div class="div1">
		<div class="div4">
			<div class="tabmenu">
				<ul>
					<li id="tab1" class="btnCon"><input type="radio" checked
						name="tabmenu" id="tabmenu1"> <label for="tabmenu1"><br>등록된 상품
					</label>
						<div class="tabCon">
						<div class="main-container">
				<div class="table-container">
					<table id="stable-striped">
						<thead id="tap-head">
							<tr id="top-table">
								<th onclick="sortTable(0)" class="header" width="70px">상품ID</th>
								<th onclick="sortTable(1)" class="header" width="70px">상품명</th>
								<th onclick="sortTable(2)" class="header" width="50px">카테고리</th>
								<th onclick="sortTable(3)" class="header" width="60px">수량</th>
								<th onclick="sortTable(4)" class="header" width="70px">가격</th>
								<th onclick="sortTable(5)" class="header" width="60px">등록상태</th>
								<th onclick="sortTable(6)" class="header" width="80px">할인</th>
								<th onclick="sortTable(7)" class="header" width="120px">할인기간</th>
								<th onclick="sortTable(8)" class="header" width="80px">인분수</th>
								<th onclick="sortTable(9)" class="header" width="100px">보관방법</th>
								<th onclick="sortTable(10)" class="header" width="100px">등록날짜</th>
								<th class="header">수정 및 삭제</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty GoodsList}">
								<tr>
									<td colspan=15 class="fixed"><strong>등록된 상품이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:when test="${not empty GoodsList}">
								
								<c:forEach var="item" items="${GoodsList}">
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
										href="${contextPath}/order/selectAllorders.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/order/selectAllorders.do?section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page == 10 }">
									<a
										href="${contextPath}/order/selectAllorders.do?section=${section}+1&pageNum=${section*10}+1">다음</a>
								</c:if>
							</c:forEach>
						</div>
					</center>

				</div>
			</div>
						</div></li>
					<li id="tab2" class="btnCon"><input type="radio"
							name="tabmenu" id="tabmenu2"> <label for="tabmenu2"><br>주문정보
						</label>
							<div class="tabCon">
								<div class="main-container">
									<div class="table-container">
										<table id="stable-striped">
											<thead id="tap-head">
												<tr id="top-table">
													<th onclick="sortTable(0)" class="header" width="70px">주문번호</th>
													<th onclick="sortTable(1)" class="header" width="150px">상품명</th>
													<th onclick="sortTable(2)" class="header" width="100px">가격</th>
													<th onclick="sortTable(3)" class="header" width="70px">수량</th>
													<th onclick="sortTable(4)" class="header" width="60px">구매자</th>
													<th onclick="sortTable(5)" class="header" width="200px">배송주소</th>
													<th onclick="sortTable(6)" class="header" width="120px">주문상태</th>
													<th class="header" width="210px">수정</th>
												</tr>
											</thead>
											<c:choose>
												<c:when test="${empty OrderList}">
													<tr>
														<td colspan=8 class="fixed"><strong>등록된
																주문내역이 없습니다.</strong></td>
													</tr>
												</c:when>
												<c:when test="${not empty OrderList}">
												<c:forEach var="item" items="${OrderList }">
														<tr class="border-bottom">
															<td>${item.o_id}</td>
															<td>${item.g_name}</td>
															<td>${item.o_goods_price}</td>
															<td>${item.o_goods_qty}</td>
															<td>${item.u_name}</td>
															<td>${item.receiver_addr1},
																${item.receiver_addr2}, ${item.receiver_addr3}</td>
															<td>${item.delivery_state}</td>
																<td><select name="s_delivery_state"  id="s_delivery_state">
																	<c:choose>
																		<c:when test="${item.delivery_state == '결제완료' }">
																			<option value="결제완료" selected>결제완료</option>
																			<option value="배송중">배송중</option>
																			<option value="배송완료">배송완료</option>
																		</c:when>
																		<c:when test="${item.delivery_state == '배송중' }">
																			<option value="결제완료">결제완료</option>
																			<option value="배송중" selected>배송중</option>
																			<option value="배송완료">배송완료</option>
																		</c:when>
																		<c:when test="${item.delivery_state == '배송완료' }">
																			<option value="결제완료">결제완료</option>
																			<option value="배송중">배송중</option>
																			<option value="배송완료" selected>배송완료</option>
																		</c:when>
																	</c:choose>
															</select> 
															<input type="button" value="배송수정" onClick="fn_delivUpdate('${item.o_id}','s_delivery_state')" />														
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
															href="${contextPath}/order/selectAllorders.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
													</c:if>
													<a
														href="${contextPath}/order/selectAllorders.do?section=${section}&pageNum=${page}">${(section)*10 +page}
													</a>
													<c:if test="${page == 10 }">
														<a
															href="${contextPath}/order/selectAllorders.do?section=${section}+1&pageNum=${section*10}+1">다음</a>
													</c:if>
												</c:forEach>
											</div>
										</center>

									</div>
								</div>
							</div></li>
					<li id="tab3" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu3"> <label for="tabmenu3"><br>취소,교환,반품내역
					</label>
						<div class="tabCon">
								<div class="main-container">
									<div class="table-container">
										<table id="stable-striped">
											<thead id="tap-head">
												<tr id="top-table">
													<th onclick="sortTable(0)" class="header" width="70px">주문번호</th>
													<th onclick="sortTable(1)" class="header" width="200px">상품명</th>
													<th onclick="sortTable(2)" class="header" width="150px">가격</th>
													<th onclick="sortTable(3)" class="header" width="100px">수량</th>
													<th onclick="sortTable(4)" class="header" width="160px">구매자</th>
													<th onclick="sortTable(5)" class="header" width="250px">배송주소</th>
												</tr>
											</thead>
											<c:choose>
												<c:when test="${empty CancledOrderList}">
													<tr>
														<td colspan=15 class="fixed"><strong>등록된
																주문내역이 없습니다.</strong></td>
													</tr>
												</c:when>
												<c:when test="${not empty CancledOrderList}">
												<c:forEach var="item" items="${CancledOrderList }">
														<tr class="border-bottom">
															<td>${item.o_id}</td>
															<td>${item.g_name}</td>
															<td>${item.o_goods_price}</td>
															<td>${item.o_goods_qty}</td>
															<td>${item.u_name}</td>
															<td>${item.receiver_addr1},
																${item.receiver_addr2}, ${item.receiver_addr3}</td>
														</tr>
														</c:forEach>
												</c:when>
											</c:choose>
										</table>
										<center>
											<div class="" id="pagination">
												<c:forEach var="page" begin="1" end="10" step="1">
													<c:if test="${section >0 && page==1 }">
														<a href="${contextPath}/order/selectAllorders.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
													</c:if>
													<a href="${contextPath}/order/selectAllorders.do?section=${section}&pageNum=${page}">${(section)*10 +page}
													</a>
													<c:if test="${page == 10 }">
														<a href="${contextPath}/order/selectAllorders.do?section=${section}+1&pageNum=${section*10}+1">다음</a>
													</c:if>
												</c:forEach>
											</div>
										</center>

									</div>
								</div>
							</div></li>
				</ul>
			</div>
		</div>

	</div>
</form>
</body>
</html>