<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>
<style>
#change-container {
	text-align: left;
	width: 100%;
	height: 100%;
	color: black;
}

.change-table th{
background-color: #ffc0cb;
}

.change-table{
margin: auto;
}
#main-title {
text-align: center;
}
.box #id{
width: 294px;
}
.box #pwd{
width: 294px;
}
.box #pwtest{
width: 294px;
}
.box #name{
width: 294px;
}
.box #hp1{
width: 294px;
}
.box #hpA{
width: 294px;
}

.box #zipcode{
width: 294px;
}
#sbt input{
background-color: #ffc0cb;
border: 0px;
width: 100px;
height: 30px;
margin-top: 30px;
}

</style>
</head>
<body>
	<div id="change-container">
		<form id="modifybtn" name="frm" action="${contextPath}/member/updatemember.do" method="post">
			<table class="change-table">
			<div id= "main-title">
				<h1>회원정보 변경</h1>
				</div>
				<tr class="box">
					<th>아이디*</th>
					<td colspan="3"><input type="text" name="u_id" id="id" value="${memberInfo.u_id}"
						required="required" readonly/></td>
				</tr>
				<tr class="box">
					<th>비밀번호*</th>
					<td colspan="3"><input name="u_pw" id="pwd" type="password"
						placeholder="비밀번호" required="required" value="${memberInfo.u_pw}" /></td>
				</tr>
				<tr class="box">
					<th>비밀번호 확인*</th>
					<td colspan="3"><input name="pwtest" id="pwtest"
						type="password" placeholder="비밀번호 확인" required="required" value="${memberInfo.u_pw}"/></td>
				</tr>
				<tr class="box">
					<th>이름*</th>
					<td colspan="3"><input name="u_name" id="name" type="text" value="${memberInfo.u_name}"
						required="required" /></td>
				</tr>
				<tr class="box">
					<th>휴대폰*</th>
					<td><input type="tel" name="u_hp1" id="hp1" required="required" value="${memberInfo.u_hp1}" /></td>
				</tr>
				<tr class="box">
					<th>email*</th>
					<td><input type="text" name="u_email1" id="email" value="${memberInfo.u_email1}"
						required="required" />@<select name="u_email2" id="email3" value="${memberInfo.u_email2}" onChange="" title="${memberInfo.u_email2}">
						<option value="non">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="paran.com">paran.com</option>
						<option value="nate.com">nate.com</option>
						<option value="google.com">google.com</option>
						<option value="gmail.com">gmail.com</option>
					</select></td>
				</tr>
				<tr class="box">
					<th rowspan="3">주소*</th>
					<td id="zipcode"><input type="text" id="zipcode"
						name="u_addr1" id="zipcode" value="${memberInfo.u_addr1}"/></td>
					<td id="zipcode"><button  id="zipcode1">우편번호검색</button></td>
				</tr>
				<tr>
					<td id="road"><input type="text" id="zipcode" name="u_addr2" value="${memberInfo.u_addr2}"
						placeholder="도로명 주소"></td>
				</tr>
				<tr>
					<td id="detailzip"><input type="text" id="zipcode"
						name="u_addr3" value="${memberInfo.u_addr3}"></td>
				</tr>
			</table>
<center><div id = "sbt">
		<input type="submit" id="modifybtn"  value="정보수정">
		</div>
		</center>
				</form>
	</div>
	</body>
	</html>