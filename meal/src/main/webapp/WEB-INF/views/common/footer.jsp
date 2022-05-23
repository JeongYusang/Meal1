<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
footer{
  position:relative;
  background-color: #ffc0cf;
  border-top: 3px solid #ffc0cf;
  border-left: 3px solid #ffc0cf;
}
footer>.list ul, footer>.list ul li{
padding-inline-start: 0px;
 display: inline-flex;
 
}
</style>

</head>
<body>

	<footer>
<div class="logo-wrap">
<a href="#" >
<img src="${contextPath }/resources/image/Chef.jpg" height="120px" width="150px">
</a>
</div>
<div class="list">
<ul>
<li><a href="#">회사소개 |</a></li>
<li><a href="#"> 이용약관 |</a></li>
<li><a href="#"> 개인정보처리방침 |</a></li>
<li><a href="#"> 이용안내 </a></li>
</ul>
<p> 상호: 주식회사 너도할수있어 대표 :3조 사업자번호: 000-12-123456 통신판매번호: 제2022-대전-0123호<br>
대표번호 :1234-0000 팩스번호 :012-345-6789 입점 문의 : cancook@gmail.com 참고 마케팅 문의 : cancook@gmail.com<br>
주소 : 대전광역시 서구 123층 개인정보관리자 : 3조 고객센터 : 1234-0000
</div>
    </footer>


</body>
</html>