<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.header-layout {
	position: relative;
	margin: 0;
	border: 0;
	box-size: border-box;
	font-size: 13px;
	line-height: 1.4;
	font-weight: 400;
	color: #666;
}

.layout_header img {
	max-width: 100%;
	border: none;
	outline: none;
}

.layout_header a {
	color: #444;
	text-decoration: none;
	border: none;
	outline: none;
}

#layout_header {
	position: relative;
	z-index: 200;
	background-color: #fff;
	box-shadow: 0 2px 2px rgb(0 0 0/ 10%);
}

.layout_header .util_wrap {
	display: relative;
	height: 39px;
	background: #fff;
	color: #949494;
	border-bottom: 1px #f0f0f0 solid;
	overflow: hidden;
}

.layout_header .resp_wrap {
	position: relative;
	max-width: 1260px;
	margin: 0 auto;
	padding-left: 40px;
	padding-right: 40px;
}

.layout_header .bookmark_wrap a {
	display: inline-block float:left;
}

.layout_header .right-wrap-menu {
	margin: 0;
	padding: 0, 0, 0, 0;
	float: right;
	font-size: 13px;
	font-weight: 300;
	padding-right: 42px;
	text-align: right;
	overflow: hidden;
}

.layout_header .right-wrap-menu li {
	display: inline-block;
	height: auto;
}

.layout_header .right-wrap-menu li:hover {
	box-shadow: 0 3px 15px rgba(f1, f1, f1, 0.7);
}

.layout_header .right-wrap-menu li a {
	height: auto;
	font-size: 8px;
}

.layout_header .right-wrap-menu li a:hover {
	text-shadow: 0 3px 15px rgba(f1, f1, f1, 0.7);
}

.layout_header .right-wrap-menu::after {
	clear: both;
}

.layout_header .logo_wrap {
	text-align: center;
	height: 80px;
	zoom: 1;
	padding: 1.5rem 0;
	padding-bottom: 0px;
}

.layout_header .logo_area {
	text-align: center;
	font-size: inherit;
}

.layout_header .logo {
	display: inline-block;
	justify-content: center;
	z-index: 1;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.layout_header {
	top: calc(50% - 9px);
	z-index: 99;
}

.layout_header .resp_top_juso {
	position: absolute;
	top: 50%;
	right: 40px;
	margin-top: -12px;
	font-size: 15px;
	text-align: right;
}

.layout_header .dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 20px;
	z-index: 1;
	text-align: right;
	overflow: hidden;
}

.layout_header .dropdown-content a:hover {
	background-color: #f1f1f1;
	text-shadow: 0 3px 15px rgba(f1, f1, f1, 0.7);
}

.layout_header .dropdown:hover .dropdown-content {
	display: block;
	box-shadow: 0 3px 15px rgba(0, 0, 0, 0.2);
}

.layout_header .dropdown-content a {
	color: black;
	height: auto;
	font-size: 5px;
	text-decoration: none;
	display: block;
	text-align: right;
	overflow: hidden;
}

.layout_header .dropbtn1 {
	display: inline-block;
	color: black;
	text-align: right;
	text-decoration: none;
}

.site-wrap {
	display: inline-block;
	padding-inline-start: 0px;
}

.book-wrap {
	display: inline-block;
	padding-inline-start: 0px;
}

.header_wrap ul {
	display: inline-block;
}

.header_wrap button {
	display: inline-block;
	width: 100%;
	margin: 0;
	border: 0;
	padding: 0;
}

.header_wrap button:hover {
	box-shadow: 0 3px 15px rgba(0, 0, 0, 0.2);
}

/* 모달 */
.modal {
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.7);
	z-index: 500;
	display: none;
}

.modal .modal-inner {
	width: 100%;
    height: 500px;
    background: #f1f1f1;
    top: 30px;
    left: 50%;
    transform: translateX(-50%);
    position: absolute;
    text-align: center;
    box-sizing: border-box;
    padding: 20px;
    font-size: 20px;
    display: flex;
    align-items: flex-start;
    justify-content: space-evenly;
}

.modal .modal-inner ul.modal-menu {
	line-height: 2;
	display: inline-block;
}

.modal .modal-inner .modal-close {
	width: 30px;
    height: 27px;
    border: 0;
    position: absolute;
    right: 10%;
    top: 10px;
    background: #f1f1f1;
	/* 백그라운드는 이너와 맞춰줄것 */
}

.modal .modal-inner .modal-close img {
	width: 100%;
	height: 100%;
	position: absolute;
}

.modal-menu li.first-list {
	background-color: #f3f3f3;
}
</style>

</head>
<body class="header-layout">

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-inner">
			<ul class="modal-menu">
				<li class="first-list">상품 분류</li>
				<li><a href="${contextPath }/search/CateSearchGoods.do?text=&cate=찌개/탕/찜">찌개/탕/찜</a></li>
				<li><a href="${contextPath }/search/CateSearchGoods.do?text=&cate=고기">고기</a></li>
				<li><a href="${contextPath }/search/CateSearchGoods.do?text=&cate=죽">죽</a></li>
				<li><a href="${contextPath }/search/CateSearchGoods.do?text=&cate=식사/안주">식사/안주</a></li>
				<li><a href="${contextPath }/search/CateSearchGoods.do?text=&cate=간편식">간편식</a></li>
				<li><a href="${contextPath }/search/CateSearchGoods.do?text=&cate=기타">기타</a></li>
			</ul>

			<ul class="modal-menu">
				<li class="first-list">일반 게시판</li>
				<li><a href="${contextPath }/boardGr/selectBoardGrList.do">상품후기</a></li>
				<li><a href="${contextPath }/boardGq/selectBoardGqList.do">상품문의</a></li>
				<li><a href="${contextPath }/board1/selectBoard1List.do">1대1게시판</a></li>
			</ul>
			<ul class="modal-menu">
				<li class="first-list">관리 게시판</li>
				<li><a href="${contextPath }/boardA/boardASPList.do?cate=공지사항">공지사항</a></li>
				<li><a href="${contextPath }/boardA/boardASPList.do?cate=이벤트">이벤트</a></li>
				<li><a href="${contextPath }/boardA/boardASPList.do?cate=자주묻는질문">자주묻는질문</a></li>
			</ul>

			<ul class="modal-menu">
				<li class="first-list">나의 정보</li>
				<c:choose>
				<c:when test="${memberInfo != null }">
				<li><a href="${contextPath }/user/mypagehome.do">마이페이지</a></li>
				</c:when>
				<c:when test="${sellerInfo != null }">
				<li><a href="${contextPath }/seller/sellerMypage.do">마이페이지</a></li>
				</c:when>
				<c:when test="${adminInfo != null }">
				<li><a href="${contextPath}/admin/selectAllMembers.do">마이페이지</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="#">마이페이지</a></li>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${memberInfo != null }">
				<li><a href="${contextPath }/cart/myCartList.do">장바구니</a></li>
				</c:when>
				<c:when test="${sellerInfo != null }">
				<li><a href="#">장바구니</a></li>
				</c:when>
				<c:when test="${adminInfo != null }">
				<li><a href="#">장바구니</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="#">장바구니</a></li>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${memberInfo != null }">
				<li><a href="${contextPath }/cart/myZzimList.do">찜목록</a></li>
				</c:when>
				<c:when test="${sellerInfo != null }">
				<li><a href="#">찜목록</a></li>
				</c:when>
				<c:when test="${adminInfo != null }">
				<li><a href="#">찜목록</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="#">찜목록</a></li>
				</c:otherwise>
				</c:choose>
			</ul>



			<button class="modal-close">
				<img src="${contextPath }/resources/image/siteMap_close.jpg" />
			</button>
		</div>

	</div>
	<div id="layout_header" class="layout_header">

		<div class="utilwrap">
			<div class="logo-wrap">
				<h1 class="logo_area">
					<a class="logo" href="${contextPath }/main/main.do"> <img
						src="${contextPath }/resources/image/Chef.jpg" width="155">
					</a>
				</h1>
			</div>
			<div class="header_wrap">

				<div class="site-wrap">
					<button class="site-btn">
						<img src="${contextPath}/resources/image/s.JPG" height="20px" />
					</button>

				</div>

				<div class="book-wrap">
					<button id="bookmark-btn" onclick="bookmarkpop();">
						<img src="${contextPath}/resources/image/b.JPG" height="20px" />
					</button>
				</div>


				<!--  조건문 ID세션가지고 놀것 -->
				<ul class="right-wrap-menu">
					<c:choose>
						<c:when test="${isLogOn==true and not empty memberInfo}">
							<li><c:out value="${memberInfo.u_name}님 반갑습니다" /></li>
							<li><a href="${contextPath}/member/logout.do">로그아웃 |</a></li>
							<li><a href="${contextPath }/order/selectUserOrders.do">마이페이지 |
							</a></li>
							<li><a href="${contextPath }/cart/myCartList.do">장바구니</a></li>
						</c:when>
						<c:when test="${isLogOn==true and not empty sellerInfo }">
							<li><c:out value="${sellerInfo.s_name}님 반갑습니다" /></li>
							<li><a href="${contextPath }/goods/goodsForm.do">상품등록 |</a></li>
							<li><a href="${contextPath }/goods/selectGoodsPage.do">상품관리 |</a></li>
							<li><a href="${contextPath }/seller/logout.do">로그아웃 |</a></li>
							<li><a href="${contextPath }/seller/sellerMypage.do">마이페이지 |
							</a></li>
						</c:when>
							<c:when test="${isLogOn==true and not empty adminInfo }">
							<li><c:out value=" 어드민 ${adminInfo.a_name}님 반갑습니다" /></li>
							<li><a href="${contextPath }/admin/logout.do">로그아웃 |</a></li>
							<li><a href="${contextPath}/admin/selectAllMembers.do">관리페이지 |</a></li>
							<li><a href="${contextPath}/boardA/boardAWrite.do">글쓰기
							</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${contextPath }/main/loginForm.do">로그인 | </a></li>
							<li><a href="${contextPath }/main/memberFormS.do">회원가입 |
							</a></li>
						</c:otherwise>
					</c:choose>

					<li class="dropdown"><a href="javascript:void(0)"
						class="dropbtn1">고객센터▼</a>
						<div class="dropdown-content">
							 <a href="${contextPath}/board1/selectBoard1List.do">1대1문의게시판</a> 
						</div></li>
				</ul>
			</div>
		</div>
		<div class="logo_wrap">
			<!--  추후 일반회원 로그인시 출력되게끔 할것 -->
			<div class="resp_top_juso">
				<c:choose>
					<c:when test="${isLogOn==true and not empty memberInfo.u_addr1 }">
						<c:out value="${memberInfo.u_addr2} ${memberInfo.u_addr3}" />
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${contextPath }/resources/js/header.js">
	
</script>



</html>