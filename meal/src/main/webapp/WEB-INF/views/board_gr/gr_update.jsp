<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="result" value="${param.result }" />
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	if (document.getElementById("input_check").checked) {
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
		obj.action = "${contextPath}/boardGr/selectBoardGrList.do";
		obj.submit();
	}
</script>
<title>리뷰 수정하기</title>
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

.checked {
	color: #ffc0cb;
}
</style>
</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body>
	<c:if test='${not empty message }'>
		<script>
			window.onload = function() {
				result();
			}

			function result() {
				alert('${message}');
			}
		</script>
	</c:if>
	<div class='board-wrap'>
		<div class='board-title'>
			<h1>리뷰 수정</h1>
		</div>
		<form name="frmArticle" method="post"
			action="${contextPath}/boardGr/boardGrUpdate.do"
			enctype="multipart/form-data">
			<div class='table-wrap'>
				<table>
					<tr>
						<th class="td1">작성자 아이디</th>
						<td class="td3"><input class="B_Uid" type=text
							value="${boardGrVO.u_id}" name="_u_id" disabled /> <input
							type="hidden" value="${boardGrVO.u_id }" name="u_id"> <input
							type="hidden" value="user" name="reg_id"> 
							<c:choose>
								<c:when test="${not empty boardGrVO.secret}">
									<div class="secret-wrap">
										<input class="B_Uid1" type="checkbox" value="Y" name="secret"
											checked>비밀글입니다.
									</div>
								</c:when>
								<c:otherwise>
									<div class="secret-wrap">
										<input class="B_Uid1" type="checkbox" value="Y" name="secret">비밀글입니다.
									</div>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<th class="td1">별점</th>
						<td><c:choose>
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
							</c:choose></td>
					<tr>
						<th class="td1">제목</th>
						<td class="td2"><input type="text" value="${boardGrVO.title}"
							name="title" id="i_title" /> <input type="hidden"
							value="${boardGrVO.parentNo}" name="parentNo"> <input
							type="hidden" value="${boardGrVO.b_gr_id}" name="b_gr_id"></td>
					</tr>
					<tr>
						<th class="td1">내용</th>
						<td class="td2"><textarea rows="20" cols="70" name="content"
								id="i_content"> ${boardGrVO.content} </textarea></td>
					</tr>
					<tr>
						<th class="td1">사진</th>
						<td class="td2"><c:forEach var="imageList"
								items="${imageList}">
								<img id="g_image" width="300px" height="300px"
									src="${contextPath}/thumbnailsBoard.do?b_gr_id=${imageList.b_gr_id}&${imageList.fileName}">
							</c:forEach></td>
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
				<input type='submit' value="수정하기" /> <input type=button value="목록"
					onClick="backToList(this.form)" />
			</div>

		</form>

	</div>
</body>

</html>
</body>
</html>