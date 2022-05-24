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
	width: 335px;
	height: 100px;
	background: #ffc0cf;
	text-align: center;
	font-size: 50px;
	line-height: 100px;
	margin-left: 33%;
	display: inline-block
}

.div2-1 {
	display: inline-block;
	float: right;
	margin-right: 10%;
	margin-top: 20px;
	font-size: 20px;
}

.div2-1 a {
	text-decoration: none;
	background: #ffc0cf;
	color: black;
	border: 3px solid gray;
}

.div3 {
	margin-top: 10px;
	margin-left: 10%;
	width: 80%;
	height: 100px;
	background: #ffC0cf;
	font-size: 45px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.div3 div {
	display: inline-flex;
}

.div3 .div3-1 {
	font-size: 30px;
}

.div3 .div3-3 {
	font-size: 15px;
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
	background: #ffc0cf;
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
	border: 5px solid #ffc0cf;
}

.div4 .tabmenu input:checked ~ label {
	background: hotpink;
}

.div4 .tabmenu input:checked ~ .tabCon {
	display: block;
}
</style>
</head>
<body>

	<div class="div1">
		<div class="div2">판매자정보</div>
				<div class="div2-1">
			<a href="${contextPath }/member/">수정</a><br>
			<br>
			<a href="#">삭제</a>
		</div>
		<div class="div3">
			<div class="div3-1" >등급(VIP) </div> <div class="div3-2">${sellerVO.s_Wname } </div> 
			<div class="div3-3">이번달 판매금액 <br> 총 판매 금액 </div>


		</div>

		<div class="div4">
			<div class="tabmenu">
				<ul>
					<li id="tab1" class="btnCon"><input type="radio" checked
						name="tabmenu" id="tabmenu1"> <label for="tabmenu1">N<br>상품개수
					</label>
						<div class="tabCon">내용물1</div></li>
					<li id="tab2" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu2"> <label for="tabmenu2">N<br>배송정보
					</label>
						<div class="tabCon">내용물2</div></li>
					<li id="tab3" class="btnCon"><input type="radio"
						name="tabmenu" id="tabmenu3"> <label for="tabmenu3">N<br>작성게시글
					</label>
						<div class="tabCon">내용물3</div></li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>