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
    font-size: 40px;
    color: #ffd3de;
    font-weight: 900;
    border: 6px solid;
    border-radius: 10px;
}

tr#top-table {
    height: 30px;
}

div .border-bottom {
    text-align: center;
    border: 5px solid #ffd3de;
}

div .lilili {
   margin: 0px 80px 0px 80px;
    height: 300px;
    display: inline-flex;
    align-items: center;
    flex-direction: column;
    justify-content: center;
}

img#imgID {
    padding: 2rem;
    width: 100px;
    height: 135px;
}

div#textID {
    font-size: 20px;
}

a#linkID {
    border: 5px solid #80808014;
    border-radius: 15px;
}


</style>
</head>
<body>
<div class="main-container">
            <div id=maintitle>상품관리</div>
            <c:choose>
            <c:when test="${empty boardAList}">
				<tr>
					<td class="fixed"><strong>등록된 이벤트가 없습니다.</strong></td>
				</tr>
			</c:when>
            <c:otherwise>
            <%-- <c:forEach var="img" items="${imgList}" begin="0" end="12"> --%>
            <div class="table-container">
               <div id="stable-striped">
                     <div class="border-bottom">
            			<c:forEach var="item" items="${boardAList}" begin="0" end="10">
                        <div class="lilili">
                           <a href="${contextPath}/baordA/boardAdetail.do?b_a_id=${item.b_a_id}" id="linkID">
                              <img src="${contextPath}/download3.do?b_a_id=${item.b_a_id}&cate=main" height="100px" id="imgID"/>
                           </a>
                           <div id="textID">
                           		${item.title}
                           </div>
                           <div>
                           		22.06.15~22.08.30
                           </div>
                        </div>
                        </c:forEach>
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
            <%-- </c:forEach> --%>
            </c:otherwise>
            </c:choose>
         </div>
</body>
</html>