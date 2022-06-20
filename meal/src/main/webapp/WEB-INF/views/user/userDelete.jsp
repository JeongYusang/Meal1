<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored='false'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴하기</title>
<style>
#delete-container table {
	margin: auto;
	border: solid 1px;
}

#deltable {
	margin: auto;
	border: solid 1px;
}

#delbtn {
	width: 65px;
	height: 30px;
	padding: 0px;
}

.box textarea {
	width: 907px;
	height: 135px;
	resize: none;
}

.deltbl {
	width: 1000px;
}

.deltbl, td, th {
	border: 1px solid gray;
	border-collapse: collapse;
}

#bottom-content {
	margin: 20px;
}

.delbtn input {
	border: 0px;
}
</style>
<c:if test='${not empty message }'>
	<script>
window.onload=function()
{
  result(${message});
}

</script>
</c:if>
<script>
function a(){
   var pw = document.getElementByClass("pw").value();
   if(pw !=null && pw != null){
      return true;
   }
   alert("비밀번호를 입력해주세요.");
   
   return false;
   
}

</script>

</head>
<body>
<div>

	<c:choose>
		<c:when test="${not empty memberInfo }">
	
			<div id="delete-container">
				<form id="delForm" method='post'
					action="${contextPath }/member/deleteMember.do" onsubmit="return a()">
					<h1 style="text-align: center">회원탈퇴</h1>
					
					<table class="deltbl">
						<tr class="box">
							<th>회원탈퇴 사유</th>
							<td>
								<div id="form-div">
									<input type="radio" id="formradio" name="why" value="배송 불만족"> 
									<label for="cate2">배송 주문 불만족</label> 
									<input type="radio" value="사이트 이용 불편" id="formradio" name="why"> 
									<label for="cate2">사이트 이용 불편</label>
									 <input type="radio" id="formradio" name="why" value="상품품질 불만족"> 
									 <label	for="cate2">상품품질 불만족</label> 
									 <input type="radio" id="formradio" name="why" value="서비스 불만족"> 
									 <label for="cate2">서비스 불만족</label> 
									 <label for="cate2">
									 <input type="radio" id="formradio" name="why" value="기타"> 기타</label>
									 	<input type="hidden" name="reg_id" value="user">
								</div>
							</td>
						</tr>
						<tr class="box">
							<th>내용</th>
							<td><textarea name="reason"> </textarea></td>
						</tr>
					</table>

					<div id="main-content">
						<center>

							<div id="bottom-content">
								<b>비밀번호</b>:<input type="password" name="pw" class="pw" /><br>
							</div>
							회원탈퇴 시 회원님의 주문내역, 마일리지 등 정보가 즉시 삭제되어 복구가 불가능하며,탈퇴일로부터 90일 내 재가입이
							제한됩니다.<br> <input type="checkbox" name="deletecb" value=""
								required />예, 정보삭제 및 재가입 제한에 동의합니다.<br>
							<br>
							<div class="delbtn">
		
								<button class="submit" type="submit">전송하기</button>
								<button type= "button" onclick="location.href='/main/main'" ></button>
							</div>
						</center>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${not empty sellerInfo }">
			
			<div id="delete-container">
				<form id="delForm" method='post'
					action="${contextPath }/seller/deleteSeller.do">
						
					<h1 style="text-align: center">판매자탈퇴</h1>
					<table class="deltbl">
						<tr class="box">
							<th>회원탈퇴 사유</th>
							
							<td>
								<div id="form-div">
									<input type="radio" id="formradio" name="why" value="배송 불만족"> 
									<label for="cate2">배송 주문 불만족</label> 
									<input type="radio" value="사이트 이용 불편" id="formradio" name="why"> 
									<label for="cate2">사이트 이용 불편</label>
									 <input type="radio" id="formradio" name="why" value="상품품질 불만족"> 
									 <label	for="cate2">상품품질 불만족</label> 
									 <input type="radio" id="formradio" name="why" value="서비스 불만족"> 
									 <label for="cate2">서비스 불만족</label> 
									 <label for="cate2">
									 <input type="radio" id="formradio" name="why" value="기타"> 기타</label>
									 <input type="hidden" name="reg_id" value="seller">
								</div>
							</td>
						</tr>
						<tr class="box">
							<th>내용</th>
							<td><textarea name="reason"> </textarea></td>
						</tr>
					</table>

					<div id="main-content">
						<center>

							<div id="bottom-content">
								<b>비밀번호</b>:<input type="password" name="pw" class="pw" /><br>
							</div>
							회원탈퇴 시 회원님의 주문내역, 마일리지 등 정보가 즉시 삭제되어 복구가 불가능하며,탈퇴일로부터 90일 내 재가입이
							제한됩니다.<br> <input type="checkbox" name="deletecb" value=""
								required />예, 정보삭제 및 재가입 제한에 동의합니다.<br>
							<br>
							<div class="delbtn">
	
								<button class="submit" type="submit">전송하기</button>
							</div>
						</center>
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>
	</div>
</body>
</html>