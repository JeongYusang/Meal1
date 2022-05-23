<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재확인</title>
<style>
.checkform h3 {
	font-weight: normal;
	margin: 0px;
}

.checkform h1 {
	margin: 16px 0 0 0;
}

.checkform {
	color: black;
}

#checkpw {
	margin-left: auto;
	margin-right: auto;
	margin-top: 20px;
}

#sbt input {
	background-color: #ffc0cb;
	border: 0px;
	width: 100px;
	height: 30px;
	margin-top: 30px;
}
</style>
</head>
<body>
	<div class="checkform">
		<h1>비밀번호 재확인</h1>
		<h3>회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요</h3>
		<hr>
		<form id="checkForm" method='post'
			action="${contextPath}/member/checkpw.do">
			<table id="checkpw">
				<tr>
					<th><h1>비밀번호</h1></th>
					<td><input type="password" name="_u_pw" id="_u_pw"
						style="height: 22px; margin-top: 10px; margin-left: 10px;" /></td>
				</tr>
			</table>
			<center>
				<div id="sbt">
					<input type="submit" id="checkform" value="확인">
				</div>
			</center>
		</form>
	</div>
</body>
</html>