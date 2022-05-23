<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>취소/반품/교환 내역</title>
<style type="text/css">
#cancelmain-wrap {
	width: 100%;
	margin: auto;
}

#cancelmain-wrap .cancel-table {
	width: 100%;
	text-align: center;
	font-size: 20px;
	border: 1px solid;
	border-collapse: collapse;
	background-color: white;
	margin: auto;

}

#cancelmain-wrap .cancelinfo {
	text-align: left;
	font-size: 20px;
	background-color: white;
	margin-bottom: 50px;
	margin-left: 30px;
	border-collapse: collapse;
	float: left;
	display: inline;
	border: 1px solid;
}

#cancelmain-wrap .cancelinfo2 {
	text-align: left;
	font-size: 20px;
	background-color: white;
	margin-bottom: 50px;
	border-collapse: collapse;
	float: left;
	display: inline;
	border: 1px solid;
}

.tableholder {
	margin-bottom: auto;
}

.imagegoods {
	width: 200px;
	height: 200px;
}

#listback {
	width: 200px;
	height: 70px;
	margin: auto;
	display: block;
}

#tableholder {
	font-size: 40px;
	margin-bottom: 100px;
}
</style>
</head>
<body>
	<div id="cancelmain-wrap">
		<h1 id="maintitle">취소/반품/교환 내역</h1>
		<br>
		<h3>주문일: 2022-04-13 주문번호:1000001000</h3>
		<table class="cancel-table">
			<thead>
				<tr id="top-table">
					<th width="300px">상품이미지</th>
					<th width="200px">상품이름</th>
					<th width="200px">금액</th>
					<th width="200px">진행상태</th>
				</tr>

				<tr class="cancellist">
					<td><a href="${contextPath }/main/goodsDetail.do"><img
							class="imagegoods" src="${contextPath}/resources/image/new1.png"></a></td>
					<td id="title"><a href="${contextPath }/main/goodsDetail.do"">볼케이노순두부찌개</a></td>
					<td>1개<br>10000원
					</td>
					<td><b id="state">취소완료</b></td>
				</tr>
			</thead>
		</table>
		<div id="table-wrap">
			<h1>상세정보</h1>

			<table class="cancelinfo">
				<tr id="top-table">
					<th width="130px">취소접수일자:</th>
					<th width="400px">2022-04-11</th>

				</tr>
				<tr>
					<td>취소접수번호:</td>
					<td>1000001000</td>
				</tr>
				<tr>
					<td>취소 완료일:</td>
					<td>2022-04-13</td>
				</tr>
			</table>
			<table class="cancelinfo2">
				<tr id="top-table">
					<th width="100px">환불 수단:</th>
					<th width="400px">카드</th>
				</tr>

				<tr>
					<td>환불 금액:</td>
					<td>10000워</td>
				</tr>
				<tr>
					<td>상세 이유:</td>
					<td>변심</td>
				</tr>
			</table>
		</div>

	
	<button id="listback">
		<a href="#">목록</a>
	</button>
	</div>
</body>
</html>