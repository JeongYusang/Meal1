<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
		<div class='board-title'>
			<h1>새 글쓰기</h1>
		</div>
		<form name="frmArticle" method="post"
			action="${contextPath}/board1/board1insert.do"
			enctype="multipart/form-data">
			<div class='table-wrap'>
				<table>
					<c:choose>
						<c:when test="${not empty memberInfo }">
							<tr>
								<th class="td1">작성자 아이디</th>
								<td class="td3"><input class="B_Uid" type=text
									value="${ memberInfo.u_id}" name="_u_id" disabled /> <input
									type="hidden" value="${memberInfo.u_id }" name="u_id">
									<input type="hidden" value="user" name="reg_id">
									<div class="secret-wrap">
										<input class="B_Uid1" type="checkbox" value="Y" name="secret">비밀글입니다.</input>
									</div></td>
							</tr>
						</c:when>
						<c:when test="${not empty sellerInfo }">
							<tr>
								<th class="td1">작성자 아이디</th>
								<td class="td3"><input class="B_Uid" type=text
									value="${sellerInfo.s_id }" name="_s_id" disabled /> <input
									type="hidden" value="${sellerInfo.s_id }" name="s_id">
									<input type="hidden" value="seller" name="reg_id">
									<div class="secret-wrap">
										<input class="B_Uid1" type="checkbox" name="secret" value="Y"
											onclick="#">비밀글입니다.</input>
									</div></td>
							</tr>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${not empty adminInfo }">
							<tr>
								<th class="td1">작성자 아이디</th>
								<td class="td3"><input class="B_Uid" type=text
									value="${adminInfo.a_id }" name="_s_id" disabled /> <input
									type="hidden" value="${adminInfo.a_id }" name="a_id"> <input
									type="hidden" value="admin" name="reg_id">
									<div class="secret-wrap">
										<input class="B_Uid1" type="checkbox" name="secret" value="Y"
											onclick="#">비밀글입니다.</input>
									</div></td>
							</tr>
						</c:when>
					</c:choose>
					<tr>
						<th class="td1">제목</th>
						<td class="td2"><input type=text value="타이틀필드" name="title"
							id="i_title" /></td>
						<input type="hidden" value="0" name="parentNo">
					</tr>
					<tr>
						<th class="td1">내용</th>
						<td class="td2"><textarea rows="20" cols="70" name="content"
								id="i_content"> ${article.content } </textarea></td>
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