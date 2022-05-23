

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너도 요리할 수 있어</title>
<style>
.PW1 {
display: inline-block;
text-align: center;
}
.PW1 input.loginhagi {
width: 150px;
font-size: larger;
background-color: rgb(152 251 152 / 37%);
border: 1px outset;
border-radius: 4px;
}
.PW > article{
display:block;
text-align=center;
}
</style>
</head>
<body>
   <div class="PW1">
      <h1>비밀번호 찾기 결과</h1>

   <article>
      <p style="font-size: x-large;">비밀번호는 입니다.</p><br><br>
      <a href="${contextPath}/main/loginForm.do">
      <input type="button" value="로그인창으로" class="loginhagi"></a>       
   </article>
   </div>
</body>
</html>