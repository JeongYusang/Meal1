<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너도 요리할 수 있어!</title>
<link rel="stylesheet" href="${contextPath}/resources/css/personalAgree.css">
</head>
<body>
<h1 id="personal">개인정보 수집 및 이용 동의</h1>
<div id="personal1">
Ⅰ. 개인정보의 수집 및 이용 동의서<br>
 - 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.<br>
① 개인정보 수집 항목 및 수집·이용 목적<br>
 가) 수집 항목 (필수항목)<br><br>
- 성명(국문), 주민등록번호, 주소, 전화번호(자택, 휴대전화), 사진, 이메일, 나이, 재학정보, 병역사항,<br>
외국어 점수, 가족관계, 재산정도, 수상내역, 사회활동, 타 장학금 수혜현황, 요식업 종사 현황 등 지원<br>
신청서에 기재된 정보 또는 신청자가 제공한 정보<br>
 나) 수집 및 이용 목적<br><br>
 ② 개인정보 보유 및 이용기간<br>
 - 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성할 때까지<br>
 ③ 동의거부관리<br>
 - 귀하께서는 본 안내에 따른 개인정보 수집, 이용에 대하여 동의를 거부하실 권리가 있습니다. 다만,<br>
귀하가 개인정보의 수집/이용에 동의를 거부하시는 경우에 장학생 선발 과정에 있어 불이익이 발생할 수<br>
있음을 알려드립니다.<br><br><br>

Ⅱ. 고유식별정보 처리 동의서<br><br>
① 고유식별정보 수집 항목 및 수집·이용 목적<br>
 가) 수집 항목 (필수항목)<br>
- 주민등록번호<br>
 나) 수집 및 이용 목적<br>
 ② 개인정보 보유 및 이용기간<br>
 - 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성할 때까지<br>
 ③ 동의거부관리<br>
 - 귀하께서는 본 안내에 따른 개인정보 수집, 이용에 대하여 동의를 거부하실 권리가 있습니다. 다만,<br>
귀하가 개인정보의 수집/이용에 동의를 거부하시는 경우에 장학생 선발 과정에 있어 불이익이 발생할 수<br>
있음을 알려드립니다<br><br>
<a href="${contextPath }/main/memberForm.do"><input type="button" value="확인" class="confirm" id="confirm"></a>
</div>
</body>
</html>