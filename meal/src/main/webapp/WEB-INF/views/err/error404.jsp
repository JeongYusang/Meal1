<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.error-wrap{
width:1280px;
height:550px;
background:url("..../../resources/image/err.png") no-repeat
}

.error-head{
width:100%;
height:20%;
}
.error-button{
float:right;
width:70px;
height:70px;
}
.error-button ::after{
clear:both;

}
.error-button img{
width:100%;
height:100%;
}
.error-content{

width:100%;
height:100%;
text-align:center;
}
</style>

</head>
<body>
<div class="error-wrap">

<div class= "error-head">

		<a class="error-button" href = '${contextPath }/main/main.do'>
		<img src="${contextPath }/resources/image/siteMap_close.jpg" />
		</a>
</div>
<div class="error-content">
<h1><strong>JSP 타일작업을 다시하거나 <br>매핑 경로설정 다시해라 뒤지기싫으면<br>-3조-</strong></h1>
</div>
</div>
</body>
</html>