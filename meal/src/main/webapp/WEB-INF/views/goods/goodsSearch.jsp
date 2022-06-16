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
<script>
function delOk() {
	if(!confirm('삭제하면 복구할 수 없습니다. 삭제하시겠습니까?')) {
		return true;
	} else {
		return false;
	}
}
</script>
<style>
#stable-striped {
	width: 100%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	text-align: center;
	background-color: white;
	font-size: 16px;
	border-collapse: collapse;
	color: black;
	border: 1px solid;
}

#top-table {
	color: black;
	text-align: center;
	border-collapse: collapse;
	background-color: #FFF0F0s;
}

#top-table tr, ths {
	padding: 20px;
}

#top-table {
	border-bottom: 1px solid black;
}

}
#body-table {
	text-align: center;
}

tr.border-bottom td {
	border-bottom: 1px solid black;
	padding: 0px;
}

#tabletitle {
	margin: 10px;
	color: #FD6EB0;
	font-size: 32px;
}

#pagination a {
	font-size: 22px;
	margin: 20px;
}

#maintitle {
	font-size: 48px;
	background-color: #ffc0cf;
	margin: 10px 0 10px 0;
}

.main-container {
	margin-left: 10px;
}

#pick {
	display: flex;
	margin-top: 20px;
	margin-bottom: 20px;
}

#pick-user {
	width: 400px;
	height: 100px;
	background-color: #ffc0cf;
	margin: 0 auto;
	float: left;
	font-size: 32px;
	text-align: center;
	line-height: 100px;
}
#pick-user a{
color: white;
}

#pagination{
margin: 30px;
}
	
#pick-seller {
	width: 400px;
	height: 100px;
	margin: 0 auto;
	float: left;
	font-size: 32px; text-align: center;
	line-height: 100px;
	border: 1px solid;
}

.check-context {
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.7);
	z-index: 500;
	display: none;
}

.check-context .check-inner {
	width: 80%;
	height: 80%;
	background: #ffc0cf;
	top: 30px;
	left: 50%;
	transform: translateX(-50%);
	position: absolute;
	text-align: center;
	box-sizing: border-box;
	padding: 20px;
	font-size: 20px;
}

.check-context .check-inner {
	width: 30px;
	height: 27px;
	border: 0;
	position: absolute;
	right: 35%;
	top: 10px;
	background: #ffc0cf;
	/* 백그라운드는 이너와 맞춰줄것 */
}

.check-context .check-inner  {
	width: 100%;
	height: 100%;
	position: absolute;
}
</style>
</head>
<body>
<form action="url" method="post" enctype="multipart/form-data">
			<div class="main-container">
				<div id=maintitle>상품관리</div>
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
								
								<c:forEach var="item" items="${goodsList}">
									<label for="border-bottom"></label>
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
							<c:forEach var="page" begin="1" end="9" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/goods/selectGoodsPage.do?section=${section}-1&pageNum=${(section-1)*12+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/goods/selectGoodsPage.do?section=${section}&pageNum=${page}">${(section)*12 +page}
								</a>
								<c:if test="${page ==10 }">
									<a
										href="${contextPath}/goods/selectGoodsPage.do?section=${section}+1&pageNum=${section*12}+1">next</a>
								</c:if>
							</c:forEach>
						</div>
					</center>

				</div>
			</div>
	</form>
</body>
</html>