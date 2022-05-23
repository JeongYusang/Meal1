<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<c:choose>
	<c:when test="${result=='loginFailed' }">
		<script>
			window.onload = function() {
				alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
			}
		</script>
	</c:when>
</c:choose>
<style>
#section-login {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 30%;
}

#frmLogin {
	/* display:block; */
	width: 360px;
	height: 485px;
	text-align: center;
	margin: 25% auto;
	max-height: 1000000px;
}

#frmLogin button#kakao-login-btn {
	background: #ffffff;
	border: none;
	border-radius: 2px;
	height: 40px;
	width: 300px;
	color: black;
	font-size: 10px;
	cursor: pointer;
}

#frmLogin button#naver-login-btn {
	background: #ffffff;
	border: none;
	border-radius: 2px;
	height: 40px;
	width: 300px;
	color: white;
	font-size: 10px;
	line-height: 50%;
	margin-top: 10px;
}

#frmLogin input {
	box-sizing: border-box;
	border-top: none;
	border-left: none;
	border-right: none;
	padding: 10px;
	width: 350px;
	height: 50px;
	font-size: 20px;
}

#frmLogin a {
	font-size: 19px;
}

#frmLogin p {
	font-size: 15px;
	text-align: left;
	margin-left: 14%;
	color: black;
	font-weight: bold;
}

#frmLogin button#pagee {
	background-color: rgb(152, 251, 152);
	color: white;
	width: 350px;
	height: 50px;
	font-size: 25px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

#frmLogin img.kakao {
	width: 7cm;
	HEIGHT: 60px;
}

#noid {
font-size: 14px;
}

#noid a{
font-size: 16px;
}
</style>

</head>

<body>
	<section class="section-login">
		<form id="frmLogin" name="frmLogin" method="post" action="#">
			<input type="text" name="id" placeholder="아이디"><br> <br>
			<input type="password" name="pwd" placeholder="비밀번호"><br>
			<br>
			<button type="button" id="pagee" class="page-login"
				onclick="document.location.href='./main.do'">로그인</button>
			<br> <br> <a href="${contextPath}/main/memberFormS.do">회원가입</a>
			| <a href="${contextPath}/main/FindID.do">아이디찾기</a> | <a
				href="${contextPath}/main/FindPW.do">비밀번호찾기</a><br> <br>
			<p>간편로그인</p>
			<div class="btbtbt">
				<button type="button" id="kakao-login-btn"
					class="btn_start-btn_kakao">
					<a href="#"><img class="kakao"
						src="${contextPath }/resources/image/kakao.png"></a>
				</button>
				<button type="button" id="naver-login-btn"
					class="btn_start-btn_naver">
					<a href="#"><img class="kakao"
						src="${contextPath }/resources/image/naver.png"></a>
				</button>
			</div>
			<br> <br> 
			<div id="noid">
			<b>비회원으로 주문하시겠습니까?</b> &nbsp; <a href="#">비회원으로 주문하기</a>
			</div>
		</form>
	</section>
	<br>
	<br>
</body>
</html>