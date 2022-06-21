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

.layout {
	width: 1280px;
	margin: 0 auto;
	padding-left: 60px;
	padding-right: 60px;
}

#header {
	position: relative;
	z-index: 200;
	background-color: #fff;
	box-shadow: 0 2px 2px rgb(0 0 0/ 10%);
}

.side-wrap {
	display: inline-block;
	width: 150px;
	height: 100%;
	position: relative;
	top:250px;
}

#side {
	position: relative;
	width: 100%;
	height: 100%;
}

.main-wrap {
	min-height:800px;
	max-width: 1280px;
	position: relative;
	display: flex;
	justify-content: space-between;
}

#main {
	width: 100%;
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
	border: 1px; solid;
	position: sticky;
	z-index: 300;
	left: 0;
	top: 0;
	opacity: 0.7;
	backdrop-filter: blur(30px);
	max-width: 1280px;
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
	font-size: 20px;
    font-weight: 900;
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
}

#nav .dropdown-content a:hover {
	background-color: #f1f1f1;
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
</style>
</head>
<body>
	<div class="layout">
		<header id="header">
			<div class= "e">
				<tiles:insertAttribute name="header" />
			</div>
		</header>
		<!--nav  -->
		<nav id="nav">
			<div id="nav-wrap">
				<div class="nav-menu">
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
			<div class="side-wrap">
				<article id="side">
					<tiles:insertAttribute name="side" />
				</article>
			</div>

			<article id="main">
				<tiles:insertAttribute name="body" />
			</article>

<div class ="f">

</div>




		</div>
		<footer id="footer">
		<div class="g">
			<tiles:insertAttribute name="footer" />
		</div>
		</footer>
	</div>




</body>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${contextPath }/resources/js/side.js"> 
</script>

</html>