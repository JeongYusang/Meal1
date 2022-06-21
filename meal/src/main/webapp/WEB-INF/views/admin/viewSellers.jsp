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
<title>회원 조회하기</title>
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
          shouldSwitch= true;
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
      switchcount ++;      
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
#top-table th {
cursor:pointer;
}
#top-table span {
	cursor: pointer;
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
	cursor: context-menu;
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

#pick-seller {
	width: 400px;
	height: 100px;
	background-color: #ffc0cf;
	margin: 0 auto;
	float: left;
	font-size: 32px;
	text-align: center;
	line-height: 100px;
}

#pick-seller a {
	color: white;
}

#pagination {
	margin: 30px;
}

#pick-user {
	width: 400px;
	height: 100px;
	margin: 0 auto;
	float: left;
	font-size: 32px;
	text-align: center;
	line-height: 100px;
	border: 1px solid;
}
</style>
</head>
<body>
<div class="main-container">
<div id= maintitle>회원관리</div>
<div id="pick">
				<div id= "pick-user"><a href = "${contextPath}/admin/selectAllMembers.do">일반회원</a></div>
				<div id="pick-seller"><a href = "${contextPath}/admin/selectAllSellers.do">판매자</a></div>
				</div>


	<div class="table-container">
		<table id="stable-striped">
			<thead>
				<tr id="top-table">
					<th onclick="sortTable(0)" width="100px">아이디</th>
					<th onclick="sortTable(1)" width="100px">이름</th>
					<th onclick="sortTable(2)" width="100px">사업자번호</th>
					<th onclick="sortTable(2)" width="100px">등록된 상품수</th>
					<th onclick="sortTable(3)" width="100px">판매수량</th>
					<th onclick="sortTable(4)" width="100px">매출액</th>
					<th onclick="sortTable(5)" width="30px">업종</th>
					<th onclick="sortTable(6)" width="100px">마지막 접속</th>
					<th onclick="sortTable(7)" width="50px">수정</th>
				</tr>
			</thead>	
			 <c:choose>
            <c:when test="${empty sellerlist}">
               <tr>
                  <td colspan=15 class="fixed"><strong>등록된 회원이 없습니다.</strong></td>
               </tr>
            </c:when>
            <c:otherwise>
            
			<c:forEach var="item" items="${sellerlist}">
				<label for="border-bottom"></label>
				<tr class="border-bottom">
					<td><a href="${contextPath }/seller/sellerMypage.do?s_id=${item.s_id}">${item.s_id}</a></td>
					<td><a href="${contextPath }/seller/sellerMypage.do?s_id=${item.s_id}">${item.s_Wname}</a></td>
					<td><a href="${contextPath }/seller/sellerMypage.do?s_id=${item.s_id}">${item.s_BL_Num}</a></td>
					<td><a href="${contextPath }/seller/sellerMypage.do?s_id=${item.s_id}">등록된 상품수</a></td>
					<td><a href="${contextPath }/seller/sellerMypage.do?s_id=${item.s_id}">판매수량</a></td>
					<td><a href="${contextPath }/seller/sellerMypage.do?s_id=${item.s_id}">매출액</a></td>
					<td>${item.s_cate}</td>
					<td>${item.s_lastLog}</td>
					<!-- <td><a href ="${contextPath }/updateForm" -->
				</tr>
			</c:forEach>
            </c:otherwise> 
         </c:choose>
           </table>
<center>
             <div class="" id = "pagination">
                 <c:forEach  var="page" begin="1" end="9" step="1" >
		          <c:if test="${section >0 && page==1 }">
		          <a href="${contextPath}/admin/selectAllSellers.do?section=${section}-1&pageNum=${(section-1)*10+1 }">preview</a>
		         </c:if> 
		          <a href="${contextPath}/admin/selectAllSellers.do?section=${section}&pageNum=${page}">${(section)*10 +page} </a>
		          <c:if test="${page ==10 }">
		          <a href="${contextPath}/admin/selectAllSellers.do?section=${section}+1&pageNum=${section*10}+1">next</a>
		         </c:if> 
	      		 </c:forEach> 
     </div>
     </center>
         
   </div>
   </div>
</body>
</html>