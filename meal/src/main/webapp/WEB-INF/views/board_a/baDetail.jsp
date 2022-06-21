
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>replit</title>

<style>
.board-wrap {
	width: 800px;
}

.table-wrap table {
	width: 100%;
}

.board-wrap>tr {
	width: 100%;
}

.divTD2>input {
	width: 100%;
	padding: 0;
	border-radius: 4px;
}

.board-b-wrap {
	height: 40px;
	border-bottom: 3px solid #ffc0cf;
}

input[type="button"] {
	float: right;
	display: inline-block;
	background-color: #ffc0cf;
	border-radius: 5px;
	border: 4px #cccccc;
	color: black;
	font-size: 8px;
	padding: 0;
	width: 35px;
	height: 20px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.table-wrap th.divTD {
	border-radius: 4px;
	width: 150px;
	align: center;
	background: #ffc0cf;
}

.table-wrap textarea {
	width: 100%;
	border-radius: 4px;
}

.table-wrap1 {
	margin-top: 30px;
	border-top: 3px solid #ffc0cf;
	padding-top: 30px;
}

.table-wrap1 table {
	width: 100%;
}

.table-wrap1 div #divTD {
	border-radius: 4px;
	width: 150px;
	height: 150px;
	align: center;
	background: #ffc0cf;
}

.table-wrap1 textarea {
	width: 100%;
	border-radius: 4px;
}

h1#H1TITLE{
	text-align: center;
}

img#eventIMG {
	width:100%;
	height: 100%;
}

div#divNO2 {
	float: left;
	text-align: center;
	margin-left: 50px;
}
div#divTITLE2 {
	float: left;
	text-align: center;
	margin-left: 50px;
}
div#divID2 {
	float: left;
	text-align: center;
	margin-left: 50px;
}
div#divDATE2 {
	float: left;
	text-align: center;
	margin-left: 50px;
}

div#divNO1 {
    text-align: center;
}
div#divTITLE1 {
    text-align: center;
}
div#divID1 {
    text-align: center;
}
div#divDATE1 {
    text-align: center;
}
img#contentID {
    width: 100%;
}

a.atagID {
    float: right;
    display: inline-block;
    background-color: #ffc0cf;
    border-radius: 5px;
    border: 4px #cccccc;
    color: black;
    font-size: 8px;
    padding: 0;
    width: 35px;
    height: 20px;
    transition: all 0.5s;
    cursor: pointer;
    margin: 5px;
    line-height: 210%;
    text-align: center;
}

</style>


</head>

<body>
	<div class='board-wrap'>
		<div class="board-b-wrap">
			<h1 id="H1TITLE">
				${boardAInfo.cate}
			</h1>
			<c:choose>
				<c:when test="${adminInfo ne null }">
				<div id="adminBTN">
					<a href="${contextPath}/boardA/UpdateBAform.do?b_a_id=${boardAInfo.b_a_id}&cate=이벤트" class="atagID">수정</a> 
					<a href="${contextPath}/boardA/deleteBA.do?b_a_id=${boardAInfo.b_a_id}" class="atagID">삭제</a>
				</div>
				</c:when>
			</c:choose> 
					<input type=button value="목록" onClick="window.history.back();" />
		</div>
			<div class='table-wrap'>
				<c:choose>
					<c:when test="${boardAInfo.cate == '이벤트' }">
				<div id="divTBL">
					<div id="divNO2">
						<div class="divNO">글번호</div>
						<div class="divNO1">${boardAInfo.b_a_id }
					</div>
					</div>
					<div id="divTITLE2">
						<div class="divTITLE">제목</div>
						<div class="divTITLE1">${boardAInfo.title }</div>
					</div>
					<div id="divID2">
						<div class="divID">작성자 아이디</div>
						<div class="divID1">${boardAInfo.a_id }</div>
					</div>
					<div id="divDATE2">
						<div class="divDATE">등록일자</div>
						<div class="divDATE1">${boardAInfo.creDate}
						</div>
					</div>
					</div>
					<div id="divCONTENT2">
						<c:forEach var="item" items="${imgList}">
						<div class="divCONTENT1">
							${boardInfo.content}
							<img src="${contextPath}/download3.do?b_a_id=${item.b_a_id}&cate=${item.cate}" id="eventIMG"/>
						</div>
						</c:forEach>
					</div>
					</c:when>
					</c:choose>
					<c:choose>
					<c:when test="${boardAInfo.cate == '공지사항' }">
					<div id="divTBL">
					<div id="divNO2">
						<div class="divNO">글번호</div>
						<div class="divNO1">${boardAInfo.b_a_id }
					</div>
					</div>
					<div id="divTITLE2">
						<div class="divTITLE">제목</div>
						<div class="divTITLE1">${boardAInfo.title }</div>
					</div>
					<div id="divID2">
						<div class="divID">작성자 아이디</div>
						<div class="divID1">${boardAInfo.a_id }</div>
					</div>
					<div id="divDATE2">
						<div class="divDATE">등록일자</div>
						<div class="divDATE1">"${boardAInfo.creDate}"
						</div>
					</div>
					</div>
					<c:forEach var="item" items="${imgList}">
						<div class="divCONTENT1">
							<img src="${contextPath}/download3.do?b_a_id=${item.b_a_id}&cate=${item.cate}" id="contentID">
						</div>
					</c:forEach>
					</c:when>
					</c:choose>
					<c:choose>
					<c:when test="${boardAInfo.cate == '자주묻는질문' }">
					<div id="divTBL">
					<div id="divNO2">
						<div class="divNO">글번호</div>
						<div class="divNO1">${boardAInfo.b_a_id }
					</div>
					</div>
					<div id="divTITLE2">
						<div class="divTITLE">제목</div>
						<div class="divTITLE1">${boardAInfo.title }</div>
					</div>
					<div id="divID2">
						<div class="divID">작성자 아이디</div>
						<div class="divID1">${boardAInfo.a_id }</div>
					</div>
					<div id="divDATE2">
						<div class="divDATE">등록일자</div>
						<div class="divDATE1">${boardAInfo.creDate}
						</div>
					</div>
					<div id="divCONTENT2">
						<div class="divCONTENT">내용</div>
						<div class="divCONTENT1">${boardAInfo.content }</div>
					</div>
				</div>
					</c:when>
					</c:choose>
			</div>
	</div>
</body>

</html>
