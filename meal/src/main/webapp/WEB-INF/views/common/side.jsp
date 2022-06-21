<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	
</script>

<style type="text/css">
.side-nav-wrap ul, .side-list {
	border: 1px solid #bcbcbc;
}
.side-nav-wrap ul, .side-list, .side-list ul.sidebar-content, .side-list ul.sidebar-content li
	{
	display: block;
	text-align: left;
	padding-inline-start: 0px;
}
.side-list ul.sidebar-content li a {
	display: block;
	text-align: left;
	padding-inline-start: 10px;
}
.checkpw, .checkpw1 {
	background: white;
	margin-left: 9px;
	padding: 0;
	border: 0;
	cursor: pointer;
	font-size: 13px;
}
/*  */
.check-context {
	z-index: 50;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.7);
	z-index: 500;
	display: none;
}
.check-context .check-inner {
	width: 40%;
	height: 40%;
	background: #ffc0cf;
	top: 150px;
	left: 50%;
	transform: translateX(-50%);
	position: absolute;
	text-align: center;
	box-sizing: border-box;
	padding: 20px;
	font-size: 20px;
}
.check-context .check-inner>btn {
	z-index: 300px;
	width: 30px;
	height: 27px;
	border: 0;
	position: absolute;
	right: 35%;
	top: 10px;
	background: #ffc0cf;
	/* 백그라운드는 이너와 맞춰줄것 */
}
/*  */
.check-context1 {
	z-index: 50;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.7);
	z-index: 500;
	display: none;
}
.check-context1 .check-inner1 {
	width: 40%;
	height: 40%;
	background: #ffc0cf;
	top: 150px;
	left: 50%;
	transform: translateX(-50%);
	position: absolute;
	text-align: center;
	box-sizing: border-box;
	padding: 20px;
	font-size: 20px;
}
.check-context1 .check-inner1>btn {
	z-index: 300px;
	width: 30px;
	height: 27px;
	border: 0;
	position: absolute;
	right: 35%;
	top: 10px;
	background: #ffc0cf;
	/* 백그라운드는 이너와 맞춰줄것 */
}
.check-inner1>.pw {
	boackground: #ffc0cf;
}
h2.adminLiName {
    margin: 0px;
}
</style>

</head>
<body>

	<!-- 회원/판매자 수정 관련 모달  -->
	<div class="check-context">

		<!-- Modal content -->
		<div class="check-inner">


			<div class="checkform">
				<h1>비밀번호 재확인</h1>
				<h3>회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요</h3>
				<hr>
				<form id="checkForm" method='post' action="${contextPath}/member/MemberUpdateForm.do?u_id=${memberInfo.u_id}">
					<table class="pw">
						<tr>
							<th><h1>비밀번호</h1></th>
							<td><input type="password" name="pw" class="pw"
								style="height: 22px; margin-top: 10px; margin-left: 10px;" /></td>
						</tr>
					</table>
					<center>
						<button class="submit" type="submit">전송하기</button>
						<button class="check-close" type="button">돌아가기</button>
					</center>
				</form>
			</div>
		</div>
	</div>
	<!-- 회원/판매자 삭제 관련 모달 -->
	<div class="check-context1">

		<!-- Modal content -->
		<div class="check-inner1">


			<div class="checkform1">
				<h1>비밀번호 재확인</h1>
				<h3>회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요</h3>
				<hr>
				<form id="checkForm" method='post'
					action="${contextPath}/member/deleteForm.do">
					<table class="pw">
						<tr>
							<th><h1>비밀번호</h1></th>
							<td><input type="password" name="pw2" class="pw2"
								style="height: 22px; margin-top: 10px; margin-left: 10px;" /></td>
						</tr>
					</table>
					<center>
						<button class="submit" type="submit">전송하기</button>
						<button class="check-close1" type="button">돌아가기</button>
					</center>
				</form>
			</div>
		</div>
	</div>

	<!-- 본문의 사이드 -->
	<nav class="side-nav-wrap">
		<ul>
			<c:choose>
			
				<c:when test="${not empty sellerInfo}">
					<!-- sellerMode -->
				
					<li class="side-list">
						<h2>상품정보</h2> <br>
						<ul class="sidebar-content">
							<li><a href="${contextPath }/goods/goodsForm.do">상품등록</a></li>
							<li><a href="${contextPath }/goods/selectGoodsPage.do">상품관리</a></li>
						</ul>
					</li>
						<ul class="side-list">
							<li><H2><a href="${contextPath }/seller/sellerMypage.do">주문내역</a></H2></li>
						</ul>
					<li class="side-list">
						<ul class="side-list">
							<li><h2><a href="${contextPath}/seller/sellerBoardMypage.do">게시판 활동</a></h2></li> 
						</ul>
					</li>
					<li class="side-list">
						<h2>판매자 정보</h2> <br>
						<ul class="sidebar-content">
							<li><button type="button" class="checkpw">회원수정</button></li>
							<li><button type="button" class="checkpw1">회원탈퇴</button></li>
						</ul>
					</li>
				</c:when>
				
				<c:when test="${not empty adminInfo}">
				
				<!-- adminMode -->
				
					<li class="side-list">
						<H2 class="adminLiName">회원관리</H2> <br>
						<ul class="sidebar-content">
							<li><a href="${contextPath}/admin/selectAllMembers.do">회원조회</a></li>
							<li><a href="${contextPath }/admin/selectAlladmins.do">관리자 조회</a></li>
						</ul>
					</li>

					<li class="side-list">
						<ul class="side-list">
							<li><H2><a href="${contextPath}/admin/selectAllorders.do">주문내역</a></H2></li>
						</ul>
					</li>
					<li class="side-list">
						<h2 class="adminLiName">게시판관리</h2> <br>
						<ul class="sidebar-content">
							<li><a href="${contextPath}/boardGq/selectBoardGqList.do">상품문의관리</a></li>
							<li><a href="${contextPath}/boardGr/selectBoardGrList.do">상품리뷰관리</a></li>
							<li><a href="${contextPath}/board1/selectBoard1List.do">1대1문의관리</a></li>
							<li><a href="${contextPath}/boardA/boardAList.do">관리자 게시판</a></li>
						</ul>
					</li>
					<li class="side-list">
						<h2 class="adminLiName">정보내역</h2> <br>
						<ul class="sidebar-content">
							<li><button type="button" class="checkpw">회원수정</button></li>
							<li><button type="button" class="checkpw1">회원탈퇴</button></li>
						</ul>
					</li>
				</c:when>
			
				<c:when test="${not empty memberInfo}">
               <!-- 일반회원모드 -->
               <li class="side-list">
                  <H2>구매정보</H2>
                  <ul class="sidebar-content">
                  <li><a href="${contextPath}/member/memberDetail.do?u_id=${memberInfo.u_id}">회원정보보기</a></li>
                     <li><a href="${contextPath}/order/selectUserOrders.do">구매내역</a></li>
                     <li><a href="${contextPath}/order/selectCanceledOrders.do">취소/반품/교환내역</a></li>
                  </ul>
               </li>

               <li class="side-list">
                  <h2>MY활동</h2>
                  <ul class="sidebar-content">
                     <li><a href="${contextPath}/cart/myCartList.do">장바구니</a></li>
                     <li><a href="${contextPath}/cart/myZzimList.do">찜한 상품</a></li>
                     <li><a href="${contextPath}/member/myMileage.do">마일리지</a></li>
                     <li><a href="${contextPath}/board1/selectMyBoard1.do">나의 1대1 문의</a></li>
                     <li><a href="${contextPath}/boardGq/selectMyBoardGqList.do">나의 상품 문의</a></li>
                     <li><a href="${contextPath}/boardGr/selectMyBoardGrList.do">나의 상품 후기</a></li>

                  </ul>
               </li>

               <li class="side-list">
                  <h2>MY정보</h2>
                  <ul class="sidebar-content">
                     <li><button type="button" class="checkpw">회원수정</button></li>
                     <li><button type="button" class="checkpw1">회원탈퇴</button></li>
                  </ul>
               </li>

            </c:when>
            <c:otherwise>
            	<h2><a href="${contextPath}/main/loginForm.do">로그인</a>후 이용가능 합니다.</h2>
            </c:otherwise>
			</c:choose>
		</ul>
	</nav>

</body>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${contextPath }/resources/js/side.js">
	
</script>
<script>
	$(".checkpw").click(function() {
		/*사이트맵버튼클릭시}*/
		$(".check-context").fadeIn();
		$(".nav_ul").css("display", "none");
	});
	$(".check-close").click(function() {
		/*사이트맵닫기버튼*/
		$(".check-context").fadeOut();
		$(".nav_ul").css("display", "block");
	});
	$(".checkpw1").click(function() {
		/*사이트맵버튼클릭시}*/
		$(".check-context1").fadeIn();
		$(".nav_ul").css("display", "none");
	});
	$(".check-close1").click(function() {
		/*사이트맵닫기버튼*/
		$(".check-context1").fadeOut();
		$(".nav_ul").css("display", "block");
	});
</script>
</html>