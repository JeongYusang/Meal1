<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script>
	var array_index = 0;
	var SERVER_URL = "${contextPath}/download1.do";

	function fn_show_next_goods() {
		var img_sticky = document.getElementById("img_sticky");
		var text_sticky = document.getElementById("text_sticky");
		var cur_goods_num = document.getElementById("cur_goods_num");
		var _h_g_id = document.frm_sticky.h_g_id;
		var _h_g_name = document.frm_sticky.h_g_name;
		if (array_index < _h_g_id.length - 1)
			array_index++;

		var g_id = _h_g_id[array_index].value;
		var g_name = _h_g_name[array_index].value;

		img_sticky.src = SERVER_URL + "?g_id=" + g_id + "&cate=main";
		text_sticky.value = g_name;
		cur_goods_num.innerHTML = array_index + 1;
	}

	function fn_show_previous_goods() {
		var img_sticky = document.getElementById("img_sticky");
		var cur_goods_num = document.getElementById("cur_goods_num");
		var _h_g_id = document.frm_sticky.h_g_id;
		var _h_g_name = document.frm_sticky.h_g_name;

		if (array_index > 0)
			array_index--;

		var g_id = _h_g_id[array_index].value;
		var g_name = _h_g_name[array_index].value;
		img_sticky.src = SERVER_URL + "?g_id=" + g_id + "&cate=main";
		text_sticky.value = g_name;
		cur_goods_num.innerHTML = array_index + 1;
	}

	function goodsDetail() {
		var cur_goods_num = document.getElementById("cur_goods_num");
		arrIdx = cur_goods_num.innerHTML - 1;

		var img_sticky = document.getElementById("img_sticky");
		var h_g_id = document.frm_sticky.h_g_id;
		var len = h_g_id.length;

		if (len > 1) {
			g_id = h_g_id[arrIdx].value;
		} else {
			g_id = h_g_id.value;
		}

		var formObj = document.createElement("form");
		var i_g_id = document.createElement("input");

		i_g_id.name = "g_id";
		i_g_id.value = g_id;

		formObj.appendChild(i_g_id);
		document.body.appendChild(formObj);
		formObj.method = "get";
		formObj.action = "${contextPath}/goods/goodsDetail.do?g_id=" + g_id;
		formObj.submit();

	}
	
	function fn_show_next_zzim() {
		var img_sticky = document.getElementById("zzim_img_sticky");
		var text_sticky = document.getElementById("zzim_text_sticky");
		var cur_goods_num = document.getElementById("zzim_cur_goods_num");
		var _h_g_id = document.frm_zzim.h_g_id;
		var _h_g_name = document.frm_zzim.h_g_name;
		if (array_index < _h_g_id.length - 1)
			array_index++;

		var g_id = _h_g_id[array_index].value;
		var g_name = _h_g_name[array_index].value;

		img_sticky.src = SERVER_URL + "?g_id=" + g_id + "&cate=main";
		text_sticky.value = g_name;
		cur_goods_num.innerHTML = array_index + 1;
	}

	function fn_show_previous_zzim() {
		var img_sticky = document.getElementById("zzim_img_sticky");
		var cur_goods_num = document.getElementById("zzim_cur_goods_num");
		var _h_g_id = document.frm_zzim.h_g_id;
		var _h_g_name = document.frm_zzim.h_g_name;

		if (array_index > 0)
			array_index--;

		var g_id = _h_g_id[array_index].value;
		var g_name = _h_g_name[array_index].value;
		zzim_img_sticky.src = SERVER_URL + "?g_id=" + g_id + "&cate=main";
		zzim_text_sticky.value = g_name;
		zzim_cur_goods_num.innerHTML = array_index + 1;
	}

	function zzimDetail() {
		var cur_goods_num = document.getElementById("zzim_cur_goods_num");
		arrIdx = cur_goods_num.innerHTML - 1;

		var img_sticky = document.getElementById("zzim_img_sticky");
		var h_g_id = document.frm_zzim.h_g_id;
		var len = h_g_id.length;

		if (len > 1) {
			g_id = h_g_id[arrIdx].value;
		} else {
			g_id = h_g_id.value;
		}

		var formObj = document.createElement("form");
		var i_g_id = document.createElement("input");

		i_g_id.name = "g_id";
		i_g_id.value = g_id;

		formObj.appendChild(i_g_id);
		document.body.appendChild(formObj);
		formObj.method = "get";
		formObj.action = "${contextPath}/goods/goodsDetail.do?g_id=" + g_id;
		formObj.submit();
	}
</script>
<style>
.quickInfo-wrap {
	width: 150px;
	height: 320px;
	background: #ffc0cf;
	text-align: center;
	border: 1px solid #black;
}

.quickInfo img {
	width: 80px;
	height: 80px;
}
.quickInfo input {
border: none; 
background: transparent;
text-align: center;
width: 140px;
}
.quickInfo-wrap ul {
padding: 0px;
}

.quickInfo p {
font-size: 5px;
margin: 0px;
}
</style>

<body>
	<div id="sticky">
		<div class="quickInfo-wrap">
			<div class="quickInfo">
				<strong>최근 상품</strong>
				<ul>
					<!--   상품이 없습니다. -->

					<c:choose>
						<c:when test="${ empty quickGoodsList }">
							<strong>상품이 없습니다.</strong>
						</c:when>
						<c:otherwise>
							<form name="frm_sticky">
								<c:forEach var="item" items="${quickGoodsList}" varStatus="itemNum">
									<c:choose>
										<c:when test="${itemNum.count==1 }">
											<a href="javascript:goodsDetail();"> <img id="img_sticky"
												src="${contextPath}/download1.do?g_id=${item.g_id}&cate=main">
											</a>
											<a href="javascript:goodsDetail();"> <input type="text"
												id="text_sticky" value="${item.g_name}" readonly>
											</a>
											<input type="hidden" name="h_g_id" value="${item.g_id}" />
											<input type="hidden" name="h_g_name" value="${item.g_name}" />
										</c:when>
										<c:otherwise>
											<input type="hidden" name="h_g_id" value="${item.g_id}" />
											<input type="hidden" name="h_g_name" value="${item.g_name}" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<div id="paging">
								<c:choose>
									<c:when test="${ empty quickGoodsList }">
										<h5>&nbsp; &nbsp; &nbsp; &nbsp; 0/0 &nbsp;</h5>
									</c:when>
									<c:otherwise>
										<p>
											<a href='javascript:fn_show_previous_goods();'> 이전 </a>
											&nbsp; <span id="cur_goods_num">1</span>/${quickGoodsListNum}
											&nbsp; <a href='javascript:fn_show_next_goods();'> 다음 </a>
										</p>
									</c:otherwise>
								</c:choose>
								</div>
							</form>
						</c:otherwise>
					</c:choose>
				</ul>

			</div>
			<c:if test="${not empty memberInfo }">
				<div class="quickInfo">
				<strong><a href="${contextPath}/cart/myZzimList.do">찜 목록</a></strong>
				<ul>
					<!--   상품이 없습니다. -->

					<c:choose>
						<c:when test="${ empty quickZzimList }">
							<strong>상품이 없습니다.</strong>
						</c:when>
						<c:otherwise>
							<form name="frm_zzim">
								<c:forEach var="quickZzimList" items="${quickZzimList}" varStatus="itemNum">
									<c:choose>
										<c:when test="${itemNum.count==1 }">
											<a href="javascript:zzimDetail();"> <img id="zzim_img_sticky"
												src="${contextPath}/download1.do?g_id=${quickZzimList.g_id}&cate=main">
											</a>
											<a href="javascript:zzimDetail();"> <input type="text"
												id="zzim_text_sticky" value="${quickZzimList.g_name}" readonly>
											</a>
											<input type="hidden" name="h_g_id" value="${quickZzimList.g_id}" />
											<input type="hidden" name="h_g_name" value="${quickZzimList.g_name}" />
										</c:when>
										<c:otherwise>
											<input type="hidden" name="h_g_id" value="${quickZzimList.g_id}" />
											<input type="hidden" name="h_g_name" value="${quickZzimList.g_name}" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<div id="paging">
								<c:choose>
									<c:when test="${ empty quickZzimList }">
										<h5>&nbsp; &nbsp; &nbsp; &nbsp; 0/0 &nbsp;</h5>
									</c:when>
									<c:otherwise>
										<p>
											<a href='javascript:fn_show_previous_zzim();'> 이전 </a>
											&nbsp; <span id="zzim_cur_goods_num">1</span>/${quickZzimListNum}
											&nbsp; <a href='javascript:fn_show_next_zzim();'> 다음 </a>
										</p>
									</c:otherwise>
								</c:choose>
								</div>
							</form>
						</c:otherwise>
					</c:choose>


				</ul>

			</div>
			</c:if>


		</div>
	</div>
</body>
</html>

