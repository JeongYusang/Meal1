<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>



<style type="text/css">
ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: black;
}

a:link, a:visited, a:active {
	color: black;
}

a:hover {
	font-weight: border;
}

input {
	cursor: point;
}

.layout {
	max-width: 1280px;
	margin: 0 auto;
	padding-left: 60px;
	padding-right: 60px;
	over-flow-x: hidden;
}

#header {
	position: relative;
	z-index: 200;
	background-color: #fff;
	box-shadow: 0 2px 2px rgb(0 0 0/ 10%);
}

.main-wrap {
	min-height:800px;
	max-width: 1280px;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

#main {
	display: inline-flex;
	justify-content: center;
	align-items: center;
}

#quick-wrap {
	display: inline-block;
	float: right;
}

#quick {
	position: fixed;
	top: 50%;
	right: 5%;
	margin: 10px, 10px, 10px, 10px;
	background: rgba(31, 31, 31, 0.8);
	display: inline-block;
	float: right;
}

#quick::after {
	clear: both;
}

#footer {
	max-height: 100px;
	position: relative;
	border: 0px solid #bcbcbc;
	margin-top: 100px;
}

/* nav */
#nav {
	position: sticky;
	z-index: 300;
	left: 0;
	top: 0;
	opacity: 0.7;
	backdrop-filter: blur(30px);
	max-width: 1280px;
	display: block;
}

#nav ul.nav_ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #ffc0cf;
}

#nav .cate1 {
	float: left;
	display: inline-block;
    font-size: 20px;
    font-weight: 900;
}

#nav li a, .dropbtn {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	overflow: hidden;
}

#nav li a:hover, .dropdown:hover .dropbtn {
	background-color: red;
}

#nav li.dropdown {
	display: inline-block;
}

#nav .dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

#nav .dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	z-index: 400;
}

#nav .dropdown-content a:hover {
	background-color: red;
}

#nav .dropdown:hover .dropdown-content {
	display: block;
}

.search {
	display: inline-block;
	float: right;
	padding: 12px 16px;
	margin-right: 2px;
}

.search::after {
	clear: both;
}

body {
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

.layout_header .util_wrap_menu1 {
	margin: 0;
	padding: 0, 0, 0, 0;
	float: right;
	font-size: 13px;
	font-weight: 300;
	padding-right: 42px;
	text-align: right;
	overflow: hidden;
}

.layout_header .util_wrap_menu1 li {
	display: inline-block;
	height: auto;
}

.layout_header .util_wrap_menu1 li a {
	height: auto;
	font-size: 5px;
}

.layout_header .util_wrap_menu1::after {
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

.layout_header .resp_top_hamburger {
	top: calc(50% - 9px);
	z-index: 99;
}

.layout_header .resp_top_hamburger a {
	margin-top: 20px;
	display: inline-block;
	left: 0px;
	width: 30px;
	height: 30px;
	background-size: contain;
	overflow: hidden;
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
	background-color: rgba(f1, f1, f1, 0.7);
}

.layout_header .dropdown:hover .dropdown-content {
	display: block;
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

.layout_header  .site-ul, .layout_header  .site-ul li {
	display: inline-block;
	padding-inline-start: 0px;
}
</style>
</head>
<body>
	<div class="layout">


		<header id="header">
			<div>
				<tiles:insertAttribute name="header" />
			</div>
		</header>
		<!--nav  -->
		<nav id="nav">
			<div id="nav-wrap">
				<div class="menu">
					<ul class="nav_ul">
						<li class="dropdown cate1"><a href="javascript:void(0)"
							class="dropbtn">카테고리▼</a>
							<div class="dropdown-content">
								<a href="${contextPath }/search/CateSearchGoods.do?text=&cate=찌개/탕/찜">찌개/탕/찜</a> <a href="${contextPath }/search/CateSearchGoods.do?text=&cate=식사/안주">식사/안주</a> <a href="${contextPath }/search/CateSearchGoods.do?text=&cate==죽">죽</a> 
								<a href="${contextPath }/search/CateSearchGoods.do?text=&cate=고기">고기</a><a href="${contextPath }/search/CateSearchGoods.do?text=&cate=간편식">간편식</a><a href="${contextPath }/search/CateSearchGoods.do?text=&cate=기타">기타</a>
							</div></li>
						<li class="cate1"><a href="${contextPath }/boardA/boardASPList.do?cate=이벤트">이벤트</a></li>
						<li class="cate1"><a href="${contextPath }/boardA/boardASPList.do?cate=공지사항">공지사항</a></li>
						<li class="search">
							<form action="${contextPath }/search/SearchGoods.do">
								<input type="search" name = "text" placeholder="상품검색" aria-label="상품검색">
								<button class="search_btn" type="submit">검색하기</button>
							</form>
						</li>
					</ul>

				</div>
			</div>
		</nav>

		<!-- nav끝 -->

		<div class="main-wrap">
			<article id="main">
				<tiles:insertAttribute name="body" />
			</article>

			<div id="quick-wrap">
				<aside id="quick">
					<tiles:insertAttribute name="quickMenu" />
				</aside>
			</div>
		</div>


		<div class="footer-wrap">
			<footer id="footer">


				<tiles:insertAttribute name="footer" />

			</footer>
		</div>
	</div>


</body>
</html>