<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<c:set var="section" value="0" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<c:if test='${ not empty message}'>
	<script>
		window.onload = function() {
			result();
		}

		function result() {
			alert("${message}");
		}
	</script>
</c:if>
<script>
	function sortTable(n) {
		var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
		table = document.getElementById("stable-striped"); //테이블 명
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

<style>
#stable-striped {
	margin: 0 auto; /* 가로로 중앙에 배치 */
	text-align: center;
	background-color: white;
	font-size: 18px;
	border-collapse: collapse;
	color: black;
}

#stable-striped tr:nth-child(even) {
	background-color: #FFF6FA;
}

#stable-striped tr, td {
	padding: 20px;
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

#body-table {
	text-align: center;
}

tr.border-bottom td {
	border-bottom: 1px black;
}

#write a {
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

#tabletitle {
	margin: 10px;
	color: #FD6EB0;
	font-size: 32px;
}

.pagination {
	margin: 5px;
}

.pagination a {
	font-size: 22px;
	border: 1px solid #ddd;
	padding: 10px;
}

.center {
	text-align: center;
}

.checked {
	color: #ffc0cb;
}

#page {
	font-size: 24px;
	margin: 10px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div id="tabletitle">
		<h1>상품문의</h1>
	</div>
	<hr>
	<br>
	<br>

	<div class="table-container">
		<table id="stable-striped">
			<thead>
				<tr class="stable-striped">
					<th onclick="sortTable(0)" width="50px">번호</th>
					<th onclick="sortTable(1)" width="300px">상품</th>
					<th onclick="sortTable(2)" width="300px">제목</th>
					<th onclick="sortTable(3)" width="150px">날짜</th>
					<th onclick="sortTable(4)" width="150px">답변여부</th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${empty boardGq}">
					<tr>
						<td colspan=5 class="fixed"><strong>작성된 글이 없습니다.</strong></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${boardGq}">
						<label for="border-bottom"></label>
						<tr class="item">
									<td>${item.b_gq_id }</td>
									<td>${item.g_name}</td>
									<td><a href="${contextPath}/boardGq/gq_detail.do?b_gq_id=${item.b_gq_id}">${item.title}</a></td>
									<td>${item.creDate}</td>
									<td>${item.compare}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>



			</tbody>
		</table>
		<center>
			<div id="page">
				<c:choose>
					<c:when test="${memberVO != null }">
						<c:forEach var="page" begin="1" end="9" step="1">
							<c:if test="${section >0 && page==1 }">
								<a
									href="${contextPath}/boardGq/selectMyBoardGqList.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
							</c:if>
							<a
								href="${contextPath}/boardGq/selectMyBoardGqList.do?section=${section}&pageNum=${page}">${(section)*10 +page}
							</a>
							<c:if test="${page ==10 }">
								<a
									href="${contextPath}/boardGq/selectMyBoardGqList.do?section=${section}+1&pageNum=${section*10}+1">next</a>
							</c:if>
						</c:forEach>
					</c:when>
					<c:when test="${sellerVO != null }">
						<c:forEach var="page" begin="1" end="9" step="1">
							<c:if test="${section >0 && page==1 }">
								<a
									href="${contextPath}/boardGq/selectSellerBoardGqList.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
							</c:if>
							<a
								href="${contextPath}/boardGq/selectSellerBoardGqList.do?section=${section}&pageNum=${page}">${(section)*10 +page}
							</a>
							<c:if test="${page ==10 }">
								<a
									href="${contextPath}/boardGq/selectSellerBoardGqList.do?section=${section}+1&pageNum=${section*10}+1">next</a>
							</c:if>
						</c:forEach>
					</c:when>
					<c:when test="${adminVO != null }">
						<c:forEach var="page" begin="1" end="9" step="1">
							<c:if test="${section >0 && page==1 }">
								<a
									href="${contextPath}/boardGq/selectBoardGqList.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
							</c:if>
							<a
								href="${contextPath}/boardGq/selectBoardGqList.do?section=${section}&pageNum=${page}">${(section)*10 +page}
							</a>
							<c:if test="${page ==10 }">
								<a
									href="${contextPath}/boardGq/selectBoardGqList.do?section=${section}+1&pageNum=${section*10}+1">next</a>
							</c:if>
						</c:forEach>

					</c:when>
				</c:choose>
		</center>
	</div>


</body>
</html>