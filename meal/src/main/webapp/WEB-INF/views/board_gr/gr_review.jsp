<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
if(document.getElementById("input_check").checked) {
    document.getElementById("input_check_hidden").disabled = true;
}
function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function backToList(obj) {
		obj.action = "${contextPath}/board/listArticles.do";
		obj.submit();
	}
</script>
<title>새글 쓰기 창</title>
<style>
.board-wrap {
	width: 1000px;
	margin-left: 50px;
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

#in_content textarea {
	width: 800px;
	height: 400px;
	font-size: 20px;
}

#in_title input {
	width: 100%;
	height: 30px;
	width: 800px;
	border: none;
	resize: none;
	border: 1px solid;
}

#board_write {
	margin-left: 50px;
	width: 810px;
}

.bt button {
	float: right;
}

#text h4 {
	margin: 0;
}

#goods-info {
	margin-bottom: 30px;
}

#goods-info .imagegoods {
	float: left;
	height: 70px;
	width: 70px;
	height: 70px;
	margin-right: 10px;
}

#goodstext h3 {
	margin: 0px;
}

#goodstext p {
	margin: 0px;
}

.board-r-wrap>input {
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
	width: 80%;
	height: 80%;
	background: #ffc0cf;
	top: 30px;
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

.check-context .check-inner {
	width: 40%;
	height: 40%;
	top: 150px;
	position: absolute;
}

.checked {
	color: #ffc0cb;
	font-size: 60px;
}

#grHead {
	margin: 10px;
}

#grHead #title {
	font-size: 20px;
	float: left;
}

#grHead #date {
	float: right;
	margin: 5px;
}

#grHead #id {
	margin: 5px;
	float: right
}

#g_image {
	margin: 0 auto;
	width: 300px;
	height: 300px;
}

.board_main {
	border: 1px solid black;
}

#content {
	margin-left: 30px;
	font-size: 16px;
	color: black;
}

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
	border-radius: 4px;
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
	font-size: 15px;
	padding: 0;
	width: 80px;
	height: 40px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.table-wrap th.td1 {
	border-radius: 4px;
	width: 150px;
	align: center;
	background: #ffc0cf;
}

.table-wrap td.td2 {
	border-radius: 4px;
	border: 1px solid black;
}

.table-wrap textarea {
	width: 100%;
	border-radius: 4px;
}

.filecss {
	align: center;
}

#preview {
	width: 100%;
	height: 100%;
	border: 0;
}

.board-title>h1 {
	border-bottom: 3px solid #ffc0cf;
}

.table-wrap td.td2>.B_Uid {
	padding: 0;
	border-radius: 4px;
	display: inline-block;
	width: 350px;
}

.table-wrap td.td2>.B_Uid1 {
	padding: 0;
	border-radius: 4px;
	display: inline-block;
	float: right;
}

.table-wrap td.td3 {
	border-radius: 4px;
	border: 1px solid black;
}

.B.Uid1, .B.Uid2, .secret-wrap {
	display: inline-block;
}
</style>
</head>

<body>
	<c:if test='${not empty message }'>
		<script>
window.onload=function()
{
  result();
}

function result(){
	alert('${message}');
}
</script>
	</c:if>
	<div class='board-wrap'>
		<div class="board-b-wrap">

			<h1>리뷰 상세</h1>
		</div>
		<div id="goods-info">
			<br> <img class="imagegoods"src="${contextPath}/download1.do?g_id=${boardGrVO.g_id}&cate=main">
			<div id="goodstext">
				<h3>${boardGrVO.s_id}</h3>
				<h3>${boardGrVO.g_name}</h3>
				<c:choose>
					<c:when test="${boardGrVO.star == 5}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
					</c:when>
					<c:when test="${boardGrVO.star == 4}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
					</c:when>
					<c:when test="${boardGrVO.star == 3}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:when>
					<c:when test="${boardGrVO.star == 2}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:when>
					<c:otherwise>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<br>
		<div class="board_main">
			<div id="grHead">
				<div id="title">${boardGrVO.title}</div>
				<div id="date">${boardGrVO.creDate}</div>
				<div id="id">작성자:${boardGrVO.u_id}</div>
			</div>
			<br>
			<div id="content">
				<c:forEach var="imageList" items="${imageList}">
					<img id="g_image" width="300px" height="300px"
						src="${contextPath}/thumbnailsBoard.do?b_gr_id=${imageList.b_gr_id}">
				</c:forEach>
				<br> ${boardGrVO.content}
			</div>
			<br>
		</div>

		<c:choose>
			<c:when test="${not empty ReviewList }">

				<c:forEach var="review" items="${ReviewList}">
					<div class="board-r-wrap">

						<h1>답글입니다</h1>
						<input type=button value="수정"
							onClick="fn_update('${contextPath}/boardGr/boardGrUpdateform.do',${review.b_gr_id })" />
						<input type=button value="삭제"
							onClick="fn_remove_board('${contextPath}/boardGr/boardGrDelete.do',${review.b_gr_id })" />
						<input type=button value="목록"
							onClick="fn_return('${contextPath}/boardGr/selectBoardGrList.do')" />
						<input type=button value="답글"
							onClick="fn_review('${contextPath}/boardGr/boardGrReviewform.do', ${boardGrVO.b_gr_id})" />
					</div>

					<div class='table-wrap1'>
						<table>


							<tr>
								<th class="td1">제목</th>
								<td class="td2"><input type=text value="" name="title"
									id="i_title" disabled /></td>
							</tr>
							<tr>
								<th class="td1">내용</th>
								<td class="td2"><textarea rows="20" cols="70"
										name="content" id="i_content" disabled></textarea></td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	<div class='board-wrap'>
		<div class='board-title'>
			<h1>답변쓰기</h1>
		</div>
		<form name="frmArticle" method="post"
			action="${contextPath}/boardGr/boardGrinsert.do"
			enctype="multipart/form-data">
			<div class='table-wrap'>
				<table>

					<tr>
						<th class="td1">작성자 아이디</th>
						<td class="td3"><input class="B_Uid" type=hidden
							value="${boardGrVO.g_id}" name="g_id" /> <input class="B_Uid"
							type=text value="${boardGrVO.s_id }" name="_s_id" disabled /> <input
							type="hidden" value="${boardGrVO.s_id }" name="s_id"> <input
							type="hidden" value="seller" name="reg_id">
							<div class="secret-wrap">
								<input class="B_Uid1" type="checkbox" name="secret" value="Y"
									onclick="#">비밀글입니다.
							</div></td>
					</tr>
					<tr>
						<th class="td1">제목</th>
						<td class="td2"><input type=text placeholder = "제목를 작성해주세요" name="title"
							id="i_title" /><input type="hidden"
							value="${boardGrVO.b_gr_id }" name="parentNo"></td>

					</tr>
					<tr>
						<th class="td1">내용</th>
						<td class="td2"><textarea rows="20" cols="70" name="content"
								id="i_content"placeholder = "답변을 작성해주세요"></textarea></td>
					</tr>
					<tr height="200px">
						<th class="td1">이미지파일 첨부 <input class="filecss" type="file"
							name="imageFileName" onchange="readURL(this);" /></th>
						<td class='td2'><input type="image" id="preview" src="#"
							alt="이미지 출력창 입니다." /></td>
					</tr>
				</table>
			</div>
			<div class="board-b-wrap">
				<input type='submit' value="글쓰기" /> <input type=button value="목록"
					onClick="backToList(this.form)" />
			</div>

		</form>

	</div>
</body>
</html>
</body>
</html>