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
<style>

div#maintitle {
    text-align: center;
}

tr#top-table {
    height: 30px;
}

div .border-bottom {
    text-align: center;
}

div .lilili {
	margin: 0px 80px 0px 80px;
    height: 300px;
    display: inline-flex;
    align-items: center;
    flex-direction: column;
    justify-content: center;
}

</style>
</head>
<body>
<div class="main-container">
				<div id=maintitle>상품관리</div>
				<%-- <c:choose>
				<c:when test="${boardASPList.cate == '이벤트'}">
				<c:forEach var="item" items="${boardASPList}" begin="0" end="4"> --%>
				<div class="table-container">
					<div id="stable-striped">
							<div class="border-bottom">
								<div class="lilili">
									<%-- <a href="${contextPath}/baordA/boardASPList.do?b_a_id=${item.b_a_id}&cate=이벤트"> --%>
										<img src="${contextPath}/resources/image/BANG.png" height="100px" />
									<!-- </a> -->
								</div>
								<div class="lilili">
									<a href="">
										<img src="${contextPath}/resources/image/BANG.png" height="100px" />
									</a>
								</div>
								<div class="lilili">
									<a href="">
										<img src="${contextPath}/resources/image/BANG.png" height="100px" />
									</a>
								</div>
								<div class="lilili">
									<a href="">
										<img src="${contextPath}/resources/image/BANG.png" height="100px" />
									</a>
								</div>
								<div class="lilili">
									<a href="">
										<img src="${contextPath}/resources/image/BANG.png" height="100px" />
									</a>
								</div>
							</div>
					</div>
					<center>
						<div class="" id="pagination">
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/boardA/selectGoodsPage.do?section=${section}-1&pageNum=${(section-1)*12+1 }">preview</a>
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
				<%-- </c:forEach>
				</c:when>
				</c:choose> --%>
			</div>
</body>
</html>