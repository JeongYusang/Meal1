
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

.td2>input {
	width: 100%;
	padding: 0;
	border-radius:4px;
}

.board-b-wrap {
	height: 30px;
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

.table-wrap th.td1 {
border-radius:4px;
	width: 150px;
	align: center;
	background: #ffc0cf;
}

.table-wrap textarea {
	width: 100%;
	border-radius:4px;
}

</style>


</head>

<body>
	<div class='board-wrap'>
	<div class='board-title'>
	<h1> 상품 문의 게시판 </h1>
	</div>
		<form name="frmArticle" method="post" action="${contextPath}"
			enctype="multipart/form-data">
			<div class='table-wrap'>
				<table>
					<tr>
						<th class="td1">글번호</th>
						<td class="td2"><input type="text"
							value="${article.articleNO }" disabled /> <input type="hidden"
							name="articleNO" value="${article.articleNO}" /></td>
					</tr>
					<tr>
						<th class="td1">작성자 아이디</th>
						<td class="td2"><input type=text value="${article.id }"
							name="writer" disabled /></td>
					</tr>
					<tr>
						<th class="td1">제목</th>
						<td class="td2"><input type=text value="${article.title }"
							name="title" id="i_title" disabled /></td>
					</tr>
					<tr>
						<th class="td1">내용</th>
						<td class="td2"><textarea rows="20" cols="70" name="content"
								id="i_content" disabled /> ${article.content } </textarea></td>
					</tr>

					<c:if
						test="${not empty article.imageFileName && article.imageFileName!='null' }">
						<tr>
							<th class="td1" rowspan="2">이미지</th>
							<td class="td2"><input type="hidden" name="originalFileName"
								value="${article.imageFileName }" /> <img
								src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}"
								id="preview" /><br></td>
						</tr>
						<tr>
							<th class="td1"><input type="file" name="imageFileName "
								id="i_imageFileName" disabled onchange="readURL(this);" /></th>
						</tr>
					</c:if>
					<tr>
						<th class="td1">등록일자</th>
						<td class="td2"><input type=text
							value="<fmt:formatDate value="${article.writeDate}" />" disabled />
						</td>
					</tr>
				</table>
			</div>
			<div class="board-b-wrap">


				<input type=button value="수정" onClick="fn_enable(this.form)" /> <input
					type=button value="삭제"
					onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})" />

				<input type=button value="목록" onClick="backToList(this.form)" /> <input
					type=button value="답글"
					onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})" />
			</div>

		</form>
	</div>
</body>

</html>