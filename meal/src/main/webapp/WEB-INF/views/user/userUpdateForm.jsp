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
width: 800px;
font-size: 20px;
border: solid 1px black;
}
.change-table th{
width: 70px;
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${contextPath }/resources/js/memberForm.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//Daum 주소 API
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("zipcode").value = data.zonecode;
            document.getElementById("roadAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("ex_detailAddress").focus();
        }
    }).open();
}

$(function() {
	$('#select').change(function() {
		if ($('#select').val() == 'directly') {
			$('#u_email2').attr("disabled", false);
			$('#u_email2').val("");
			$('#u_email2').focus();
		} else {
			$('#u_email2').val($('#select').val());
		}
	})
});
</script>
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
					<td colspan="3"><input type="text" name="u_id" id="id" value="${memberVO.u_id}"
						required="required" readonly/></td>
				</tr>
				<c:if test="${adminInfo == null }">
				<tr class="box">
					<th>비밀번호*</th>
					<td colspan="3"><input name="u_pw" id="pwd" type="password"
						placeholder="비밀번호" required="required" value="${memberVO.u_pw}" /></td>
				</tr>
				<tr class="box">
					<th>비밀번호 확인*</th>
					<td colspan="3"><input name="pwtest" id="pwtest"
						type="password" placeholder="비밀번호 확인" required="required" value="${memberVO.u_pw}"/></td>
				</tr>
				</c:if>
				<tr class="box">
					<th>이름*</th>
					<td colspan="3"><input name="u_name" id="name" type="text" value="${memberVO.u_name}"
						required="required" /></td>
				</tr>
				<tr class="box">
					<th>휴대폰*</th>
					<td><input type="tel" name="u_hp1" id="hp1" required="required" value="${memberVO.u_hp1}" /></td>
				</tr>
				<tr class="box">
					<th>email*</th>
					<td><input type="text" name="u_email1" id="u_email1"
							style="width: 70px" value = "${memberVO.u_email1}"> @ <input type="text" name="u_email2"
							id="u_email2" style="width: 70px;" value="${memberVO.u_email2}"> <select
							style="width: 100px; margin-right: 10px" title="u_email2"
							id="select">
								<option value="${memberVO.u_email2}">기존 이메일</option>
								<option value="directly" id="u_email2">직접 입력하기</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="empas.com">empas.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="korea.com">korea.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmir.com">hanmir.com</option>
								<option value="paran.com">paran.com</option>

						</select></td>
				</tr>
				<tr class="box">
						<th rowspan="3">주소*</th>
						<td id="zipcode33"><input type="text" name="u_addr1"
							id="zipcode" placeholder="우편번호" value = "${memberVO.u_addr1}"></td>
						<td id="zipcode22"><input type="button" value="우편번호 찾기"
							id="zipcode1" onclick="execDaumPostcode()"></td>
					</tr>
					<tr class="box">
						<td id="road" colspan="2"><input type="text" id="roadAddress"
							name="u_addr2" placeholder="도로명 주소" value = "${memberVO.u_addr2}"></td>
					</tr>
					<tr class="box" colspan="2">
						<td id="detailzip"><input type="text" id="ex_detailAddress" name="u_addr3"
							class="detail" placeholder="상세주소" value = "${memberVO.u_addr3}"></td>
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