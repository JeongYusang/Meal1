
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

<script>
function fn_remove_board(url,b_gr_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "get");
	 form.setAttribute("action", url);
   var articleNOInput = document.createElement("input");
   articleNOInput.setAttribute("type","hidden");
   articleNOInput.setAttribute("name","b_gr_id");
   articleNOInput.setAttribute("value", b_gr_id);
	 
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
function fn_update(url,b_gr_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "get");
	 form.setAttribute("action", url);
  var articleNOInput = document.createElement("input");
  articleNOInput.setAttribute("type","hidden");
  articleNOInput.setAttribute("name","b_gr_id");
  articleNOInput.setAttribute("value", b_gr_id);
	 
  form.appendChild(articleNOInput);
  document.body.appendChild(form);
  form.submit();

}
function fn_review(url,b_gr_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "get");
	 form.setAttribute("action", url);
 var articleNOInput = document.createElement("input");
 articleNOInput.setAttribute("type","hidden");
 articleNOInput.setAttribute("name","b_gr_id");
 articleNOInput.setAttribute("value", b_gr_id);
	 
 form.appendChild(articleNOInput);
 document.body.appendChild(form);
 form.submit();

}


/* function fn_update(){
	${boardGr.u_id},${memberInfo.u_id },${sellerInfo.s_id },${adminInfo.a_id }
	var u_id = ${boardGr.u_id};
	var u_id2 = ${memberInfo.u_id};
	var s_id = ${boardGr.s_id};
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
	margin: 10px;
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
	resize: none;
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
	margin: 60px;
	width: 300px;
	height: 300px;
}

#content {
	margin-left: 30px;
	font-size: 16px;
	color: black;
}
#goods-info{
height: 100px;
}
#goods-info img {
width: 100px;
height: 100px;
float: left;
margin-right: 10px;
}
#goodstext{
font-size: 20px;
color: black;
}
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
	
	<div id="goods-info">
			<br> <img src="${contextPath}/download1.do?g_id=${boardGrInfo.g_id}&cate=main" />
			<div id="goodstext">
				<b>판매자:</b> ${boardGrInfo.s_id}<br>
				<b>상풍명:</b> ${boardGrInfo.g_name}<br>
				<c:choose>
					<c:when test="${boardGrInfo.star == 5}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
					</c:when>
					<c:when test="${boardGrInfo.star == 4}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
					</c:when>
					<c:when test="${boardGrInfo.star == 3}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:when>
					<c:when test="${boardGrInfo.star == 2}">
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


	<div class='board-wrap'>
		<div class="board-b-wrap">
			<h1>리뷰 상세</h1>
			<c:choose>
				<c:when test="${memberInfo.u_id eq boardGrInfo.u_id}">
					<input type=button value="수정"
						onClick="fn_update('${contextPath}/boardGr/boardGrUpdateform.do',${boardGrInfo.b_gr_id })" />
					<input type=button value="삭제"
						onClick="fn_remove_board('${contextPath}/boardGr/boardGrDelete.do',${boardGrInfo.b_gr_id })" />
				</c:when>



				<c:when test="${sellerInfo.s_id eq boardGrInfo.s_id}">
					<input type=button value="답글"
						onClick="fn_review('${contextPath}/boardGr/boardGrReviewform.do', ${boardGrInfo.b_gr_id})" />
					<input type=button value="목록"
						onClick="fn_return('${contextPath}/boardGr/selectBoardGrList.do')" />

				</c:when>
				<c:otherwise>
					<input type=button value="목록"
						onClick="fn_return('${contextPath}/boardGr/selectBoardGrList.do')" />
				</c:otherwise>
			</c:choose>

		</div>

	
		<br>
		<div id="grHead">
			<div id="title">${boardGrInfo.title}</div>
			<div id="date">${boardGrInfo.creDate}</div>
			<div id="id">작성자:${boardGrInfo.u_id}</div>
		</div>
		<br>
		<br>
		<div class="board_main">
			<br>
			<div id="content">
				<c:forEach var="imageList" items="${imageList}">
					<img id="g_image" width="300px" height="300px"
						src="${contextPath}/thumbnailsBoard.do?b_gr_id=${imageList.b_gr_id}&fileName=${imageList.fileName}">
				</c:forEach>
				<br> ${boardGrInfo.content}
			</div>
			<br>
		</div>

		<c:choose>
			<c:when test="${not empty ReviewList}">
				<c:forEach var="review" items="${ReviewList}">
					<div class="board-b-wrap">
						<h1>답변</h1>
						<c:if test="${sellerInfo.s_id eq boardGrInfo.s_id}">
							<input type=button value="수정"
								onClick="fn_update('${contextPath}/boardGr/boardGrReviewUpdateform.do',${review.b_gr_id})" />
							<input type=button value="삭제"
								onClick="fn_remove_board('${contextPath}/boardGr/boardGrDelete.do',${review.b_gr_id })" />
						</c:if>


					</div>
					<div id="grHead">
						<div id="title">${review.title}</div>
						<div id="date">${review.creDate}</div>s
						<div id="id">작성자:${review.s_id}</div>
					</div>

					<div class="board_main">
						<div id="content">
						<c:if test="${imageList != null}">
							<c:forEach var="imageList" items="${imageList}">
								<img id="g_image" width="300px" height="300px"
									src="${contextPath}/thumbnailsBoard.do?b_gr_id=${review.b_gr_id}&fileName=${imageList.fileName}">
							</c:forEach>
							</c:if>
							<br><br> ${review.content}
						</div>
						<br>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>

</body>

</html>
