<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="section" value="0" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회하기</title>

<style type="text/css">
.div1 {
	width: 1080px;
	height: 1000px;
	position: relative;
	overflow: hidden;
}

.div2 {
	margin-left: 36%;
	width: 335px;
	height: 100px;
	background: rgba(196, 196, 196, 1);
	text-align: center;
	font-size: 50px;
	line-height: 100px;
	margin-bottom: 50px;
}

.div3 {
	margin-left: 10%;
	width: 80%;
	height: 100px;
	background: yellow;
	font-size: 45px;
}

.div3 .s1 {
	
}

.div3 .s2 {
	
}

.div3 .s3 {
	font-size: 30px;
}

.div4 {
	display: flex;
	background: white;
	height: 150px;
	width: 100%;
	flex-wrap: nowrap;
	justify-content: space-around;
}

.div4 ul {
	list-style: none;
	padding-inline-start: 0px;
}

.div4 .tabmenu {
	width: 100%;
	margin: 0 auto;
	position: relative;
	margin: 0 auto;
}

.div4 .tabmenu ul li {
	display: inline-block;
	width: 300px;
	height: auto;
	text-align: center;
	background: #f9f9f9;
	margin: 0 27px;
}

.div4 .tabmenu label {
	display: block;
	width: 100%;
	height: 100px;
	font-size: 35px;
}

.div4 .tabmenu input {
	display: none;
}

.div4 .tabCon {
	display: none;
	text-align: left;
	left: 0;
	top: 80%;
	position: absolute;
	box-sizing: border-box;
	width: 100%;
	height: 800px;
	background: brown;
	border: 0;
}

.div4 .tabmenu input:checked ~ label {
	background: #ccc;
}

.div4 .tabmenu input:checked ~ .tabCon {
	display: block;
}
</style>
</head>
<body>

	<div class="div1">
		<div class="div2">회원정보</div>
		<div class="div3">
			<span class="s1">등급(VIP) </span> <span class="s2">회원이름 </span> <span
				class="s3">마일리지: x원 </span>


		</div>

		<div class="div4">
			<div class="tabmenu">
				<ul>
					<li id="tab1" class="btnCon"><input type="radio" checked
						name="tabmenu" id="tabmenu1"> <label for="tabmenu1">1<br>결제완료
					</label>
						<div class="tabCon">내용물1</div></li>
					<li id="tab2" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu2"> <label for="tabmenu2">2<br>교/반/취
					</label>
						<div class="tabCon">내용물2</div></li>
					<li id="tab3" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu3"> <label for="tabmenu3">price<br>총
							구매액
					</label>
						<div class="tabCon">내용물3</div></li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>