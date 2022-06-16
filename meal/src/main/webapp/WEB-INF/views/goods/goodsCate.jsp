<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="section" value="0" />
<!DOCTYPE html>
<html>
<head>
<title>검색결과</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<script type="text/javascript">
function fnc_checked(){
	
    var g_allergy_M = '';
    $('input[type="checkbox"]:checked').each(function (index) {
        if (index != 0) {
           g_allergy_M += '/';
     
        }       
        g_allergy_M += $(this).val();
       
    });
    document.getElementById("g_allergy_M").value = g_allergy_M;
    return true;
}


</script>

<style>
.maingoodslist {
	width: 1280px;
	position: relative;
	text-align: center;
	height: 1300px;
}

.maingoodslist span {
	text-align: center;
	padding-right: 10px;
}

.maingList {
	width: 100%;
	display: flex;
	align-items: flex-start;
	justify-content: center;
	height: 800px;
}

#searchDetailWrap {
	width: 100%;
	height: 130px	;
	border-top: 2px solid #5f0080;
	border-bottom: 1px solid #5f0080;
	display: flex;
	align-content: center;
	align-items: center;
	justify-content: center;
}

#searchDetailWrap #searchText {
	width: 500px;
	height: 30px;
	padding-left: 10px;
	height: 30px;
}

#searchBTN {
	height: 30px;
	margin-left: 20px;
}

.maingList .ul li a {
	display: inline-block;
}

.maingList .ul li, .maingList .ol li {
	display: inline-block;
	text-align: center;
	height: 320px;
}

#main-wrap1 .img {
	display: inline-block;
	margin: 0 10px 0 10px;
}

#main-wrap1 a {
	color: black;
}

#main-wrap1 .b {
	margin-left: 40px;
	text-align: center;
}

.main-wrap1 {
	width: 1280px;
}

.w3-bar {
	margin-left: 50px;
}

.goodsPrice {
	text-decoration: line-through
}
#allergyInfo{
width: 1000px;
margin-bottom : 20px;
}

#pagination{
display: inline-block;
height: 100px;
}
</style>
</head>
<body>

	<div id="main-wrap1">

		<div class="maingoodslist">
			<h1>${cate}</h1>
			<div id="searchDetailWrap">
				<form action="${contextPath }/search/CateSearchGoods.do" name = "searchForm" onsubmit="return fnc_checked()">
			<div id="allergyInfo">
			<span>제외 성분</span>
			<br>
			<input type="checkbox" value="갑각류" id="g_allergy_M1" >갑각류
         	<input type="checkbox" value="견과류" id="g_allergy_M2" >견과류
         	<input type="checkbox" value="대두" id="g_allergy_M3" >대두
         	<input type="checkbox" value="유제품" id="g_allergy_M4" >유제품
         	<input type="checkbox" value="계란류" id="g_allergy_M5" >계란류
         	<input type="checkbox" value="밀" id="g_allergy_M6" >밀
         	<input type="hidden" id="g_allergy_M" name="g_allergy_M" value="">
         	</div>
         	<div>
					<span>검색조건 </span> 
					<input type="text" name="text" id="searchText" placeholder="검색조건을 기입해주세요."> 
					<input type="hidden" name="cate" id="searchText" value = "${goodsList[0].g_cate2}"> 
						<input type="submit" id="searchBTN" value="검색하기">
						</div>
				</form>
			</div>
			<br>
			<div class="w3-bar">
			<c:if test="${not empty goodsList}">
				<a href="#" class="w3-bar-item">가격낮은순</a> <a href="#"
					class="w3-bar-item">가격높은순</a> <a href="#" class="w3-bar-item">신상품순</a>
				<a href="#" class="w3-bar-item">평점높은순</a>
				</c:if>
			</div>
			<div class="maingList">
				<!--썸네일 메소드를 이용한것  -->
				<ul class="ul">
				<c:choose>
				<c:when test="${empty goodsList}">
				<h1>검색된 상품이 없습니다.</h1>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${goodsList}">
						<li>
						<div>
						<a href="${contextPath }/goods/goodsDetail.do?g_id=${item.g_id }"><img
								src="${contextPath}/download1.do?g_id=${item.g_id }&cate=main"
								width="250px" height="250px"></a>
								 <br>${item.g_name } <br>
							</div>
							<div>
							<c:if test="${empty item.g_saleprice or item.g_saleprice eq 0 }">
									<br> 
								가격: ${item.g_price }원
								</c:if> <c:if test="${not empty item.g_saleprice and item.g_saleprice ne 0}">
									<span class="goodsPrice">가격 : ${item.g_price }원</span>
									<br> 할인 가격 : ${item.g_saleprice }원
								</c:if> 
							</div></li>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<c:if test="${not empty goodsList}">
			<center>
						<div class="pagination" id="pagination">
							<c:forEach var="page" begin="1" end="9" step="1">
								<c:if test="${section >0 && page==1 }">
									<a
										href="${contextPath}/search/CateSearchGoods.do?cate=${cate}&section=${section}-1&pageNum=${(section-1)*10+1 }&text=${text}">preview</a>
								</c:if>
								<a
									href="${contextPath}/search/CateSearchGoods.do?cate=${cate}&section=${section}&pageNum=${page}&text=${text}">${(section)*10 +page}
								</a>
								<c:if test="${page ==10 }">
									<a
										href="${contextPath}/search/CateSearchGoods.do?cate=${cate}&section=${section}+1&pageNum=${section*10}+1&text=${text}">next</a>
								</c:if>
							</c:forEach>
						</div>
					</center>
					</c:if>
			
		</div>
	</div>


</body>
</html>