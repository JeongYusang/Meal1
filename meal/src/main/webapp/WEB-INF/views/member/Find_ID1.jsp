<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#tab {
max-width: 100%;
text-align: center;
}

#tab div#dadada{
display: inline-block;
}

#tab div.tabcontent{
width:100%;
display: inline-block;
}

#tab ul.tabnav {
list-style: none;
display:inline-block;
width: 100%;
padding-left: 0%;
margin-bottom: 10%;
}

#tab li {
width: 150px;
float: left;
text-align: center;
border-bottom: 1px outset #00000040;
font-size: xx-large;
}

#tab a.active {
 text-decoration: none;
 color: violet;
}

#tab a{
text-decoration: none;
color: black;

}


#tab table#table {
margin-left: auto;
margin-right: auto;
border-collapse: separate;
border-spacing: 0px 50px;
text-align: end;
}


#tab td.name1{
height: 50px;
font-size: x-large;
border-top: none;
border-bottom: 1px solid #00000040;
border-left: none;
border-right: 1px solid #00000040;
vertical-align: inherit;
text-align: center;
background-color: aliceblue;
border-radius: 4px;
}

#tab td.name2{
height: 50px;
font-size: x-large;
border-top: none;
border-bottom: none;
border-left: none;
border-right: none;
border-radius: 4px;
}

#tab td.email1{
height: 50px;
font-size: x-large;
border-top: none;
border-bottom: 1px solid #00000040;
border-left: none;
border-right: 1px solid #00000040;
vertical-align: inherit;
text-align: center;
background-color: aliceblue;
border-radius: 4px;
}

#tab td.email2{
height: 50px;
font-size: x-large;
border-top: none;
border-bottom: none;
border-left: none;
border-right: none;
border-radius: 4px;
}


#tab td.hp1{
height: 50px;
font-size: x-large;
border-top: none;
border-bottom: 1px solid #00000040;
border-left: none;
border-right: 1px solid #00000040;
vertical-align: inherit;
text-align: center;
background-color: aliceblue;
border-radius: 4px;
}

#tab td.hp2{
height: 50px;
font-size: x-large;
border-top: none;
border-bottom: none;
border-left: none;
border-right: none;
border-radius: 4px;
}


#tab td.click1 input#pub1{
width: 150px;
font-size: larger;
background-color: rgb(152 251 152 / 37%);
border: 1px outset;
border-radius: 4px;
}

#tab td.click2 input#pub2{
width: 150px;
font-size: larger;
background-color: rgb(152 251 152 / 37%);
border: 1px outset;
border-radius: 4px;
}



#tab input {
width: 300px;
height: 45px;
}
</style>
</head>
<body>
<form action="${contextPath}/member/FindIDResult2.do" method="post" method="post">
  <div id="tab">
  	<div id="dadada">
  	<h1>아이디 찾기</h1>
    <ul class="tabnav">
      <li class="list1"><a href="${contextPath}/member/FindID.do">이메일</a></li>
      <li class="list2"><a href="${contextPath }/member/FindID1.do">전화번호</a></li>
    </ul>
    </div>
    <div class="tabcontent">

      <div id="tab02">
	  		<table id="table">
				<tr>
					<td class="name1">이름</td>
					<td class="name2"><input class="" type="text" placeholder="이름을 입력하세요" name="name" required></td>			
				</tr>
				<tr>
					<td class="hp1">전화번호</td>
					<td class="hp2"><input class="" type="text" placeholder="전화번호를 - 없이 입력하세요" name="hp1" required></td>
				</tr>
				<tr>
					<td class="click1"><input type="submit" id="pub1" value="찾기"></td>
					<td class="click2"><input type="button" onclick="history.go(-1);" id="pub2" value="취소"></td>
				</tr>
			</table>
	  </div>
    </div>
  </div>
   </form>
</body>
</html>