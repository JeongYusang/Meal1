<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String id = (String) request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#frmResult {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	font-size: x-large;
}

#frmResult input.confirm {
	background-color: rgba(255, 192, 207, 0.7);
	border-radius: 4px;
	width: 150px;
	height: 44px;
}
</style>

</head>
<body>


	<section>
		<form id="frmResult" name="frmResult" method="post" action="#">
			<div id="container">

	

				<c:choose>
					<c:when test="${ isLogOn == false or empty isLogOn}">
							<c:choose>
								<c:when test="${not empty MemberInfo.u_id }">
									<p>${MemberInfo.u_name }님의가입을환영합니다.</p>
									<p>아이디는${MemberInfo.u_id } 입니다.</p>
									<p>언제나 좋은 서비스를 제공할 수 있도록 최선을 다하겠습니다.</p>

								</c:when>
								<c:when test="${not empty SellerInfo.s_id }">
									<p>${SellerInfo.s_name }님의가입을환영합니다.</p>
									<p>아이디는${SellerInfo.s_id }입니다.</p>
									<p>언제나 좋은 서비스를 제공할 수 있도록 최선을 다하겠습니다.</p>
								</c:when>
							</c:choose>
							<a href="${contextPath }/main/loginForm.do"><input type="button"
							value="메인페이지로 이동" class="confirm" id="confirm"></a>
</c:when>
					<c:when test="${isLogOn == true}">


						<c:choose>
							<c:when test="${not empty memberInfo.u_id }">
								<p>${memberInfo.u_name }님의회원변경이완료되었습니다.</p>
								<p>아이디는${memberInfo.u_id } 입니다.</p>


								<p>언제나 좋은 서비스를 제공할 수 있도록 최선을 다하겠습니다.</p>

							</c:when>
							<c:when test="${not empty sellerInfo.s_id }">
								<p>${sellerInfo.s_name }님의회원변경이완료되었습니다.</p>
								<p>아이디는${sellerInfo.s_id }입니다.</p>
								<p>언제나 좋은 서비스를 제공할 수 있도록 최선을 다하겠습니다.</p>
							</c:when>
						</c:choose>
						<a href="${contextPath }/main/main.do"><input type="button"
							value="메인페이지로 이동" class="confirm" id="confirm"></a>
					</c:when>
				</c:choose>
			</div>
		</form>
	</section>
</body>
</html>