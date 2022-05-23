<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>취소/반품/교환 내역</title>
<style>
#cancelmain-wrap{
display: block;
margin-left: 50px;

}

#cancelmain-wrap .cancel-table{
width:100%;
text-align: center;
font-size: 20px;
border-collapse: collapse;
background-color: white;

}
.imagegoods{
width:200px;
height:200px;
}
#cancelmain-wrap .cancel-table tr {
border-bottom: 1px solid black;
}

tr.cancellist td {
	border-bottom: 1px solid gray;
}
#cancelmain-wrap .cancel-table th {
background-color: #B1D5FF;
color: white;
}
#cancelmain-wrap .cancel-table #state{
background-color: #B1D5FF;
color: white;
}
#maintitle{
text-align: center;
background-color: #278bff;
font-size: 50px;	
color: white;
padding: 10px;
margin:10px;

}
</style>
</head>
<body>
<div id="cancelmain-wrap">
<h1 id= "maintitle">취소/반품/교환 내역</h1>
<br>

					<table class="cancel-table">
						<thead>
							<tr id="top-table">
								<th width="100px">상품이미지</th>
								<th width="200px">상품이름</th>
								<th width="100px">갯수/가격</th>
								<th width="150px">취소일</th>
								<th width="150px">취소상태</th>
							</tr>
						</thead>

						<tr class="cancellist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원</td>
							<td>2022-04-13</td>
							<td><b id="state">취소대기</b><br> <a href="#">취소상세</a></td>
						</tr>
							<tr class="cancellist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원</td>
							<td>2022-04-13</td>
							<td><b id="state">취소중</b><br> <a href="#">취소상세</a></td>
						</tr>
							<tr class="cancellist">
							<td><a href="${contextPath }/main/goodsDetail.do"><img
									class="imagegoods"
									src="${contextPath}/resources/image/new1.png"></a></td>
							<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
							<td>1개<br>10000원</td>
							<td>2022-04-13</td>
							<td><b id="state">환불완료</b><br> <a href="#">취소상세</a></td>
						</tr>
						</table>
						</div>	
</body>
</html>