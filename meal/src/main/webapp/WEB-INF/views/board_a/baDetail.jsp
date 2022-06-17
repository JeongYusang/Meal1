
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

.board-b-wrap>input {
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

h1 #H1TITLE{
	text-align: center;
}

div #divTR {
	float: left;
}

</style>


</head>

<body>
	<div class='board-wrap'>
		<div class="board-b-wrap">

			<h1 id="H1TITLE">${boardAInfo.cate}</h1>
			<input type=button value="수정" onClick="fn_enable(this.form)" /> <input
				type=button value="삭제"
				onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})" />

			<input type=button value="목록" onClick="backToList(this.form)" /> <input
				type=button value="답글"
				onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})" />
		</div>
			<div class='table-wrap'>
				<c:choose>
					<c:when test="${boardAInfo.cate == '이벤트' }">
				<div id="divTBL">
					<div id="divTR">
						<div class="divTD">글번호</div>
						<div class="divTD2">${boardAInfo.b_a_id }
					</div>
					</div>
					<div id="divTR">
						<div class="divTD">제목</div>
						<div class="divTD2">${boardAInfo.title }</div>
					</div>
					<div id="divTR">
						<div class="divTD">작성자 아이디</div>
						<div class="divTD2">${boardAInfo.a_id }</div>
					</div>
					<div id="divTR">
						<div class="divTD">등록일자</div>
						<div class="divTD2">${boardAInfo.creDate}
						</div>
					</div>
					<div id="divTR">
						<div class="divTD">내용</div>
						<c:forEach var="item" items="${imgList}">
						<div class="divTD2">
							${boardInfo.content}
							<img src="${contextPath}/download3.do?b_a_id=${item.b_a_id}" >
						</div>
						</c:forEach>
					</div>
					</div>
					</c:when>
					</c:choose>
					<c:choose>
					<c:when test="${boardAInfo.cate == '공지사항' }">
					<div id="divTBL">
					<div id="divTR">
						<div class="divTD">글번호</div>
						<div class="divTD2">${boardAInfo.b_a_id }
					</div>
					</div>
					<div id="divTR">
						<div class="divTD">제목</div>
						<div class="divTD2">${boardAInfo.title }</div>
					</div>
					<div id="divTR">
						<div class="divTD">작성자 아이디</div>
						<div class="divTD2">${boardAInfo.a_id }</div>
					</div>
					<div id="divTR">
						<div class="divTD">등록일자</div>
						<div class="divTD2">"${boardAInfo.creDate}"
						</div>
					</div>
					<div id="divTR">
						<div class="divTD">내용</div>
						<div class="divTD2">
							<img src="${contextPath}/download3.do?b_a_id=${b_a_id}&cate=${cate}" >
						</div>
					</div>
					</div>
					</c:when>
					</c:choose>
					<c:choose>
					<c:when test="${boardAInfo.cate == '자주묻는질문' }">
					<div id="divTBL">
					<div id="divTR">
						<div class="divTD">글번호</div>
						<div class="divTD2">${boardAInfo.b_a_id }
					</div>
					</div>
					<div id="divTR">
						<div class="divTD">제목</div>
						<div class="divTD2">${boardAInfo.title }</div>
					</div>
					<div id="divTR">
						<div class="divTD">작성자 아이디</div>
						<div class="divTD2">${boardAInfo.a_id }</div>
					</div>
					<div id="divTR">
						<div class="divTD">등록일자</div>
						<div class="divTD2">${boardAInfo.creDate}
						</div>
					</div>
					<div id="divTR">
						<div class="divTD">내용</div>
						<div class="divTD2"><textarea rows="20" cols="70" name="content"
								id="content" disabled /> ${boardAInfo.content } </textarea></div>
					</div>
				</div>
					</c:when>
					</c:choose>
			</div>
	</div>
</body>

</html>
