<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너도 요리할 수 있어</title>
<script>
	/* 비밀번호 일치창 */
	function success() {
		var form = document.getElementById("pwChange");
		var pw = document.getElementById("pw1");
		var _pw = document.getElementById("pw2");

		if (pw.value == "") {
			alert("비밀번호를 입력하세요");
			pw.focus();
			return false;
		}
		if (pw.value !== _pw.value) {
			alert("비밀번호가 일치하지 않습니다.");
			_pw.focus();
			return false;
		} else {
			return true;
		}

	}
</script>
<style>
#pwd01 {
	max-width: 100%;
	text-align: center;
}

#pwd01 table#PWtable {
	margin-left: auto;
	margin-right: auto;
	border-collapse: separate;
	border-spacing: 0px 50px;
	text-align: end;
}

#pwd01 td.name1 {
	height: 50px;
	font-size: x-large;
	border-top: none;
	border-bottom: 1px solid #00000040;
	border-left: none;
	border-right: 1px solid #00000040;
	vertical-align: inherit;
	text-align: center;
	background-color: aliceblue;
	border-radius: 4px;
}

#pwd01 td.name2 {
	height: 50px;
	font-size: x-large;
	border-top: none;
	border-bottom: none;
	border-left: none;
	border-right: none;
	border-radius: 4px;
}

#pwd01 td.ID1 {
	height: 50px;
	font-size: x-large;
	border-top: none;
	border-bottom: 1px solid #00000040;
	border-left: none;
	border-right: 1px solid #00000040;
	vertical-align: inherit;
	text-align: center;
	background-color: aliceblue;
	border-radius: 4px;
}

#pwd01 td.ID2 {
	height: 50px;
	font-size: x-large;
	border-top: none;
	border-bottom: none;
	border-left: none;
	border-right: none;
	border-radius: 4px;
}

#pwd01 td.click1 input#pub1 {
	width: 150px;
	font-size: larger;
	background-color: rgb(152 251 152/ 37%);
	border: 1px outset;
	border-radius: 4px;
}

#pwd01 td.click2 input#pub2 {
	width: 150px;
	font-size: larger;
	background-color: rgb(152 251 152/ 37%);
	border: 1px outset;
	border-radius: 4px;
}

#pwd01 input {
	width: 300px;
	height: 45px;
}
</style>
</head>
<body>
	<form name="pwChange" action="${contextPath}/Email/FindPwLastResult.do"
		method="post" onsubmit="success()">
		<div id="pwd01">
			<h2>비밀번호 변경하기</h2>
			<table id="PWtable">
				<c:choose>
					<c:when test="${not empty memberVO}">
						<tr>
							<td class="name1">아이디</td>
							<td class="name2"><input type="text" name="id"
								value="${memberVO.u_id }" required="required" /></td>
						</tr>
					</c:when>
					<c:when test="${not empty sellerVO }">
						<tr>
							<td class="name1">아이디</td>
							<td class="name2"><input type="text" name="id"
								value="${sellerVO.s_id }" required="required" /></td>
						</tr>
					</c:when>
				</c:choose>
				<tr>
					<td class="pw">비밀번호창</td>
					<td class="pw"><input type="password" id="pw1" name="pw"
						required></td>
				</tr>
				<tr>
					<td class="pw">비밀번호 확인창.</td>
					<td class="pw"><input type="password" id="pw2" name="_pw"
						required></td>
				</tr>
				<tr>
					<td class="click1"><input type="submit" value="비밀번호 변경하기"
						 id="pub1" /></td>
					<td class="click2"><input type="button" value="뒤로가기"
						onclick="location.href='loginForm.do'" id="pub2" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>