<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
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

.quickInfo-wrap{
width:82px;
height:230px;
background:#ffc0cf;
text-align:center;
border:1px solid #black;
}

.quickInfo-wrap > div.quickInfo{
width:100%
}
.quickInfo > button{
width:80px;
height:60px;
padding:0;
border:0;
}
.quickInfo img{
width:100%;
height:100%;
}
.quickInfo p{
font-size:5px;
}

</style>


</head>
<body>

<div class="quickInfo-wrap">

<div class="quickInfo">
<form id="quick-G" method="get" action="${contextPath }/main/goodsDetail.do" >
<strong>최근 상품</strong>
<button class="goodsLook" type="submit" ><img src="${contextPath }/resources/image/new1.png"></button>
<p> 이전 <span> N </span> 다음 </p>
</form>
</div>
<div class="quickInfo" >
<form id="quick-Z" method="get" action="${contextPath }/main/goodsDetail.do">
<strong>     찜</strong>
<button class="zzim" type="submit"><img src="${contextPath }/resources/image/new2.png"></button>
<p> 이전 <span> N </span> 다음 </p>
</form>
</div>


</div>


</body>
</html>