
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>게시물</title>

<script>
function fn_remove_board(url,b_1_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "get");
	 form.setAttribute("action", url);
   var articleNOInput = document.createElement("input");
   articleNOInput.setAttribute("type","hidden");
   articleNOInput.setAttribute("name","b_1_id");
   articleNOInput.setAttribute("value", b_1_id);
	 
   form.appendChild(articleNOInput);
   document.body.appendChild(form);
   form.submit();

}
function fn_return(url){
	var form = document.createElement("form");
	form.setAttribute("method","get");
	form.setAttribute("action",url);
	document.body.appendChild(form);
	form.submit();
}
function fn_update(url,b_1_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "get");
	 form.setAttribute("action", url);
  var articleNOInput = document.createElement("input");
  articleNOInput.setAttribute("type","hidden");
  articleNOInput.setAttribute("name","b_1_id");
  articleNOInput.setAttribute("value", b_1_id);
	 
  form.appendChild(articleNOInput);
  document.body.appendChild(form);
  form.submit();

}
function fn_review(url,b_1_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "get");
	 form.setAttribute("action", url);
 var articleNOInput = document.createElement("input");
 articleNOInput.setAttribute("type","hidden");
 articleNOInput.setAttribute("name","b_1_id");
 articleNOInput.setAttribute("value", b_1_id);
	 
 form.appendChild(articleNOInput);
 document.body.appendChild(form);
 form.submit();

}
/* function fn_update(){
	${board1.u_id},${memberInfo.u_id },${sellerInfo.s_id },${adminInfo.a_id }
	var u_id = ${board1.u_id};
	var u_id2 = ${memberInfo.u_id};
	var s_id = ${board1.s_id};
	var s_id2 = ${sellerInfo.s_id};
	var a_id = ${adminInfo.a_id}
	if (u_id.equals(u_id2) || s_id.equals(s_id2) || a_id != null){
	fnc();		
		
	}
} */

</script>
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

.table-wrap th.td1 {
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

.table-wrap1 th.td1 {
	border-radius: 4px;
	width: 150px;
	align: center;
	background: #ffc0cf;
}

.table-wrap1 textarea {
	width: 100%;
	border-radius: 4px;
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
</style>


</head>

<body>


	<div class="check-context">

		<!-- Modal content -->
		<div class="check-inner">


			<div class="checkform">
				<h1>비밀번호 재확인</h1>
				<h3>회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요</h3>
				<hr>
				<form id="checkForm" method='post'
					action="${contextPath}/member/checkpw.do">
					<table id="checkpw">
						<tr>
							<th><h1>비밀번호</h1></th>
							<td><input type="password" name="_u_pw" id="_u_pw"
								style="height: 22px; margin-top: 10px; margin-left: 10px;" /></td>
						</tr>
					</table>
					<center>
						<button class="pwcheck" type="submit">전송하기</button>
						<button class="check-close" type="button">돌아가기</button>
					</center>
				</form>
			</div>
		</div>
	</div>
	<div class='board-wrap'>
		<div class="board-b-wrap">

			<h1>상품 문의 게시판</h1>
			<c:if test="${board1Info.u_id == memberInfo.u_id or board1Info.s_id == sellerInfo.s_id or not empty adminInfo  }">
				<input type=button value="수정"
				onClick="fn_update('${contextPath}/board1/board1Updateform.do',${board1Info.b_1_id })" />
			<input type=button value="삭제"
				onClick="fn_remove_board('${contextPath}/board1/board1Delete.do',${board1Info.b_1_id })" />
			</c:if>
			<input type=button value="목록"
				onClick="fn_return('${contextPath}/board1/selectBoard1List.do')" />
			<c:if test="${not empty adminInfo}">
				<input type=button value="답글"
					onClick="fn_review('${contextPath}/board1/board1Reviewform.do', ${board1Info.b_1_id})" />
			</c:if>
		</div>

		<form name="frmArticle" method="get" action="${contextPath}"
			enctype="multipart/form-data">
			<div class='table-wrap'>
				<table>
					<tr>
						<th class="td1">글번호</th>
						<td class="td2"><input type="text"
							value="${board1Info.b_1_id}" disabled /> <input type="hidden"
							name="b_1_id" value="${board1Info.b_1_id}" /></td>
					</tr>
					<c:choose>
						<c:when test="${not empty board1Info.u_id }">
							<tr>
								<th class="td1">작성자</th>
								<td class="td2"><input type=text value="${board1Info.u_id}"
									name="u_id" disabled /></td>
							</tr>
						</c:when>
						<c:when test="${not empty board1Info.s_id }">
							<tr>
								<th class="td1">작성자</th>
								<td class="td2"><input type=text value="${board1Info.s_id}"
									name="s_id" disabled /></td>
							</tr>
						</c:when>

						<c:when test="${not empty board1Info.a_id }">
							<tr>
								<th class="td1">작성자</th>
								<td class="td2"><input type=text value="${board1Info.a_id}"
									name="a_id" disabled /></td>
							</tr>
						</c:when>
					</c:choose>
					<tr>
						<th class="td1">제목</th>
						<td class="td2"><input type=text value="${board1Info.title}"
							name="title" id="i_title" disabled /></td>
					</tr>
					<tr>
						<th class="td1">내용</th>
						<td class="td2"><textarea rows="20" cols="70" name="content"
								id="i_content" disabled> ${board1Info.content} </textarea></td>
					</tr>

					<tr>
						<th class="td1">등록일자</th>
						<td class="td2"><input type=text
							value="${board1Info.creDate}" disabled /></td>
					</tr>
				</table>
			</div>
		</form>
		<c:choose>
			<c:when test="${not empty ReviewList }">

				<c:forEach var="review" items="${ReviewList}">


					<div class='table-wrap1'>
						<div class="board-r-wrap">

							<h1>답글입니다</h1>
							<c:if test="${not empty adminInfo}">
								<input type=button value="수정"
									onClick="fn_update('${contextPath}/board1/board1Updateform.do',${review.b_1_id })" />
								<input type=button value="삭제"
									onClick="fn_remove_board('${contextPath}/board1/board1Delete.do',${review.b_1_id })" />
							</c:if>
							<input type=button value="목록"
								onClick="fn_return('${contextPath}/board1/selectBoard1List.do')" />
						</div>
						<table>

							<c:choose>
								<c:when test="${not empty review.s_id }">
									<tr>
										<th class="td1">작성자</th>
										<td class="td2"><c:out value="${review.s_id }" /></td>
									</tr>
								</c:when>
								<c:when test="${not empty review.a_id }">
									<tr>
										<th class="td1">작성자</th>
										<td class="td2"><c:out value="${review.a_id }" /></td>
									</tr>
								</c:when>
							</c:choose>
							<tr>
								<th class="td1">제목</th>
								<td class="td2"><input type=text value="${review.title }"
									name="title" id="i_title" disabled /></td>
							</tr>
							<tr>
								<th class="td1">내용</th>
								<td class="td2"><textarea rows="20" cols="70"
										name="content" id="i_content" disabled> ${review.content }</textarea></td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
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
</body>

</html>
