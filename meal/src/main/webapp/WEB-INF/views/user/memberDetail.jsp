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
	margin: 10px;
	display: inline-block;
	float: right;
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

#myinfo-wrap {
	display: inline;
}

#myinfo-wrap img {
	width: 150px;
	heigth: 150px;
	display: inline;
	float: left;
}
.texts {
	color: white;
	font-size: 34px;
	line-height: 150px;
	background: #ffc0cf;
}

.texts b {
	text-transform: capitalize;
	font-size: 40px;
}
</style>
</head>
<body>

	<div class="div1">
		<div class="div2-1">
			<a href="${contextPath }/member/">수정</a>
			<a href="#">삭제</a>
		</div>
		<div id="main-wrap1">
		<div id="myinfo-wrap">
			<div>
				<c:if test="${memberInfo.u_rank == 'gold'}">
					<img src="${contextPath}/resources/image/gold-medal.png" />
				</c:if>
				<c:if test="${memberInfo.u_rank == 'silver'}">
					<img src="${contextPath}/resources/image/silver-medal.png" />
				</c:if>
				<c:if test="${memberInfo.u_rank == 'bronze'}">
					<img src="${contextPath}/resources/image/bronze-medal.png" />
				</c:if>
				<ul class="texts">
					<li class="name">&nbsp;<b>[${memberInfo.u_rank}]</b>&nbsp;${memberInfo.u_name}님 환영합니다<span
						class="milage"> 마일리지:${memberInfo.u_mile}&nbsp;</span></li>
				</ul>
			</div>
		</div>


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
						name="tabmenu" id="tabmenu3"> <label for="tabmenu3">N<br>작성게시글
					</label>
						<div class="tabCon">내용물3</div></li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>