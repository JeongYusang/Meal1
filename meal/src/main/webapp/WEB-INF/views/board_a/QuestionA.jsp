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
<title>자주묻는질문</title>
<style>
div#mainContainer {

}

ul#slider1 {
	padding-inline-start: 10px;
    border-bottom: 5px solid #ecd3fe;
    font-size: 20px;
    font-weight: 900;
}

div#maintitle {
    text-align: center;
    font-size: 40px;
    font-weight: 900;
    border-bottom: 5px solid #0000002e;
}
article#main {
    border: 10px solid #ecd3ff;
    border-radius: 10px;
}
</style>
</head>
<body>
<div id="mainContainer">
<div id=maintitle>자주묻는질문</div>
<c:choose>
	<c:when test="${empty boardAList }">
		<tr>
			<td colspan=7 class="fixed"><strong>등록된 게시물이 없습니다.</strong></td>
		</tr>
	</c:when>
	<c:when test="${not empty boardAList}">
			<c:forEach var="item" items="${boardAList}" begin="0" end="10">
				<div id="box11">
					<ul id="slider1">
						<li id="slider1-1">
							<span id="slide1-11">
								Q. &nbsp;&nbsp; ${item.title} 
							</span>
							<p>
								A. &nbsp;&nbsp; ${item.content}
							</p>
						</li>
					</ul>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
</div>
</body>
<script>
	$(document).ready(function() {
		$("p p").hide();
		// $("ul > li:first-child a").next().show();
		$("ul li span").click(function() {
			$(this).next().slideToggle(300);
			// $(this).next().slideDown(300);
			$("ul li span").not(this).next().slideUp(300);
			return false;
		});
		$("ul li span").eq(0).trigger("click");
	});
</script>
</html>