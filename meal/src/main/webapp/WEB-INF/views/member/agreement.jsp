<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의</title>
<link rel="stylesheet" href="${contextPath}/resources/css/agreement.css">
</head>
<body>
<h1 id="ag">너도 요리할 수 있어 약관동의</h1>
<div id=ag1>가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, <br>
각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.<br><br>

회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보<br><br>

만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호,<br>
  연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보<br><br>

단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위<br><br>
- 선택항목 : 대표 홈페이지, 대표 팩스번호<br>
  둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br><br>
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록<br>
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 <br>
해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.<br><br>
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, <br>
아래와 같은 정보들이 수집될 수 있습니다.<br>
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), <br>
아이핀 번호(아이핀 이용시), 내/외국인 정보<br><br>
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.<br>
- 신용카드 결제시 : 카드사명, 카드번호 등<br>
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등<br>
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호<br><br>
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.<br>
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청<br>
- 협력회사로부터의 제공<br>
- 생성정보 수집 툴을 통한 수집<br><br>
<br>
<a href="${contextPath }/main/memberForm.do"><input type="button" value="확인" class="confirm" id="confirm"></a>
</div>
</body>
</html>