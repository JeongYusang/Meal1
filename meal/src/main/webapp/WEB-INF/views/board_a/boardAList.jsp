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
	height: 800px;
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
    font-size: 20px;
    font-weight: 400;
}
td {
    border-bottom: 1px solid black;
}

.footer-wrap {
    margin-top: 10px;
}

td.fixed {
	text-align: center;
}

span#fa\ fa-star\ checked {
    float: left;
    color: aqua;
    width: 30px;
    height: 30px;
}

span#fa\ fa-star\ {
    float: left;
    width: 30px;
    height: 30px;
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
						name="tabmenu" id="tabmenu1"> <label for="tabmenu1"><br>이벤트
					</label>
						<div class="tabCon">
						<div class="main-container">
				<div class="table-container">
					<table id="stable-striped">
						<thead id="tap-head">
							<tr id="top-table">
								<th onclick="sortTable(0)" class="header" width="100px">작성번호</th>
								<th onclick="sortTable(1)" class="header" width="100px">작성자</th>
								<th onclick="sortTable(2)" class="header" width="700px">글 제목</th>
								<th onclick="sortTable(3)" class="header" width="180px">작성일자</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty boardAList}">
								<tr>
									<td colspan=7 class="fixed"><strong>등록된 게시물이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:when test="${not empty boardAList}">
								<c:forEach var="item" items="${boardAList}" begin="0" end="10">
								<c:if test="${item.cate == '이벤트' }">
									<tr class="border-bottom" onClick="location.href='${contextPath}/boardA/boardADetail.do?b_a_id=${item.b_a_id}&cate=이벤트'">
										<td>${item.b_a_id}</td>
										<td>${item.a_id}</td>
										<td>
											${item.title}
										</td>
										<td>${item.creDate}</td>
									</tr>
									</c:if>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
					<center>
						<div class="" id="pagination">
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/boardA/boardAList.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/boardA/boardAList.do?section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page == 10 }">
									<a
										href="${contextPath}/seller/sellerBoardMypage.do?section=${section}+1&pageNum=${section*10}+1">다음</a>
								</c:if>
							</c:forEach>
						</div>
					</center>

				</div>
			</div>
						</div></li>
					<li id="tab2" class="btnCon"><input type="radio"
							name="tabmenu" id="tabmenu2"> <label for="tabmenu2"><br>공지사항
						</label>
							<div class="tabCon">
							<div class="main-container">
				<div class="table-container">
					<table id="stable-striped">
						<thead id="tap-head">
							<tr id="top-table">
								<th onclick="sortTable(0)" class="header" width="100px">작성번호</th>
								<th onclick="sortTable(1)" class="header" width="100px">작성자</th>
								<th onclick="sortTable(2)" class="header" width="700px">글 제목</th>
								<th onclick="sortTable(3)" class="header" width="180px">작성일자</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty boardAList}">
								<tr>
									<td colspan=4 class="fixed"><strong>등록된 게시물이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:when test="${not empty boardAList}">
								<c:forEach var="item" items="${boardAList}" begin="0" end="10">
								<c:if test="${item.cate eq '공지사항'}">
									<tr class="border-bottom" onClick="location.href='${contextPath}/boardA/boardADetail.do?b_a_id=${item.b_a_id}&cate=공지사항'">
										<td>${item.b_a_id}</td>
										<td>${item.a_id}</td>
										<td>${item.title}</td>
										<td>${item.creDate}</td>
									</tr>
									</c:if>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
					<center>
						<div class="" id="pagination">
							<c:forEach var="page" begin="0" end="10" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/boardA/boardAList.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/boardA/boardAList.do?section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page == 10 }">
									<a
										href="${contextPath}/boardA/boardAList.do?section=${section}+1&pageNum=${section*10}+1">다음</a>
								</c:if>
							</c:forEach>
						</div>
					</center>

				</div>
			</div>
							</div></li>
					<li id="tab3" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu3"> <label for="tabmenu3"><br>자주묻는질문
					</label>
						<div class="tabCon">
						<div class="main-container">
				<div class="table-container">
					<table id="stable-striped">
						<thead id="tap-head">
							<tr id="top-table">
								<th onclick="sortTable(0)" class="header" width="100px">작성번호</th>
								<th onclick="sortTable(1)" class="header" width="100px">작성자</th>
								<th onclick="sortTable(2)" class="header" width="700px">글 제목</th>
								<th onclick="sortTable(3)" class="header" width="180px">작성일자</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty boardAList}">
								<tr>
									<td colspan=4 class="fixed"><strong>등록된 게시물이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:when test="${not empty boardAList}">
								<c:forEach var="item" items="${boardAList}" begin="0" end="10">
								<c:if test="${item.cate == '자주묻는질문' }">
									<tr class="border-bottom" onClick="location.href='${contextPath}/boardA/boardADetail.do?b_a_id=${item.b_a_id}&cate=자주묻는질문'">
										<td>${item.b_a_id}</td>
										<td>${item.a_id}</td>
										<td>
											${item.title}
										</td>
										<td>${item.creDate}</td>
									</tr>
									</c:if>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
					<center>
						<div class="" id="pagination">
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/boardA/boardAList.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
								</c:if>
								<a
									href="${contextPath}/boardA/boardAList.do?section=${section}&pageNum=${page}">${(section)*10 +page}
								</a>
								<c:if test="${page == 10 }">
									<a
										href="${contextPath}/boardA/boardAList.do?section=${section}+1&pageNum=${section*10}+1">다음</a>
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