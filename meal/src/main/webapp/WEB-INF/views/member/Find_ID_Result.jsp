<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너도 요리할 수 있어</title>
<style>

#IDResult h2{
font-weight: 400;
}

#IDResult input#bback {
width: 150px;
font-size: larger;
background-color: rgb(152 251 152 / 37%);
border: 1px outset;
border-radius: 4px;
}
</style>
</head>
<body>
	<form>
		<table id="IDResult" align="center">
				<tr align='center'><td>
				<h1>아이디 찾기 검색결과</h1>
				</td></tr>
				<tr align='center'>
				<td><h2>아이디는 입니다</h2>
				<br><br>
				<a href="${contextPath}/main/loginForm.do"><input type="button" value="뒤로가기" id="bback"></a>
			</td></tr>
		</table>		
	</form>
</body>
</html>