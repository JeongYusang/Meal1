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
		obj.action = "${contextPath}/boardA/listArticles.do";
		obj.submit();
	}
</script>
<title>새글 쓰기 창</title>
<style>
.board-wrap {
	width: 800px;
}

.table-wrap table {
    width: 80%;
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
    display: flex;
    justify-content: flex-end;
    width: 638px;
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
	border-radius: 4px;
    width: 120px;
	align: center;
	background: #ffc0cf;
}

.table-wrap td.td2 {
	border-radius: 4px;
	border: 1px solid black;
}

.table-wrap th.fileboxhead {
	border-radius: 4px;
	width: 120px;
	align: center;
	background: #ffc0cf;
}

.table-wrap td.fileboxbody {
	border-radius: 4px;
	border: 1px solid black;
}

.table-wrap textarea {
	width: 100%;
	border-radius: 4px;
}

#preview {
	width: 100%;
	height: 100%;
	border: 0;
}

.board-title>h1 {
	border-bottom: 3px solid #ffc0cf;
    text-align: center;
    width: 640px;
}

td #preview {
	width: 30px;
	height:30px;
}
</style>
</head>

<body>
	<div class='board-wrap'>
		<div class='board-title'>
			<h1>새 글쓰기</h1>
		</div>
		<form name="frmArticle" method="post" action="${contextPath}/boardA/boardAinsert.do"
			enctype="multipart/form-data">
			<div class='table-wrap'>
				<table>

					<tr>
						<th class="td1">작성자 아이디</th>
						<td class="td2"><input type=text value="${adminInfo.a_id }"
							disabled /><input type="hidden" value="${adminInfo.a_id }" name="a_id"></td>
					</tr>
					<tr>
						<th class="td1">제목</th>
						<td class="td2"><input type=text value="제목입력" name="title"
							id="title" /></td>
					</tr>
					<tr>
						<th class="td1">카테고리</th>
						<td class="td2"><select name="cate" id="cate" title="cate"
							onChange="">
								<option value="공지사항">공지사항</option>
								<option value="이벤트">이벤트</option>
								<option value="자주묻는질문">자주묻는질문</option>
						</select></td>
					</tr>
					<tr>
						<th class="td1">내용</th>
						<td class="td2"><textarea rows="20" cols="30" name="content"
								id="content"> ${article.content } </textarea></td>
					</tr>
					<tr class="filebox">
						<th class="fileboxhead">이미지추가</th>
						<td class="fileboxbody"><input type="file" name="main" />
						<a href="#this" id="delete" class="btn" name="delete">삭제</a>
						<a href="#this" id="addFile" class="btn">추가</a>
						</td>
				</table>
			</div>
			<div class="board-b-wrap">
				<input type='submit' value="글쓰기" /> <input type=button value="목록"
					onClick="backToList(this.form)" />
			</div>

		</form>

	</div>
</body>
<script>
	var gfv_count = 1;
	$(document).ready(function() {
		$("#addFile").on("click", function(e) { //파일 추가 버튼
			e.preventDefault();
			fn_addFile();
		});

		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});

	function fn_addFile() {
		var str = "<p><input type='file' name='main" + (gfv_count++)
				+ "'><a href='#this' class='btn' name='delete'>삭제</a></p>";
		$(".fileboxbody").append(str);
		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
</script>
</html>
