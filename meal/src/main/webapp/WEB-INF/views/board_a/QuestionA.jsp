<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${empty boardGqList}">
		<tr class="border-bottom asdf">
		<td colspan=5 class="fixed"><strong>등록된 게시물이
			없습니다.</strong></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${boardASPList}" begin="0" end="10">
										<c:choose>
											<c:when
												test="${empty item.secret or not empty item.secret and item.a_id == memberInfo.u_id or not empty item.secret and item.s_id == sellerInfo.s_id or not empty adminInfo}">
												<ul id="slider1">
													<li id="slider1-1"><span id="slide1-11">${item.title}<input
															type="text" id="title_Reviewwriter"
															value=" 작성자: ${item.u_id}" readonly></span>
														<p id=Pcontent>
															<c:if test="${item.u_id == memberInfo.u_id }">
																<input id="buttons" type=button value="수정"
																	onClick="fn_update('${contextPath}/boardGq/boardGqUpdateform.do',${item.b_gq_id })" />
																<input id="buttons" type=button value="삭제"
																	onClick="fn_remove_board('${contextPath}/boardGq/boardGqDelete.do',${item.b_gq_id })" />
															</c:if>
															<c:if test="${item.s_id == sellerInfo.s_id }">
																<input id="buttons" type=button value="답글"
																	onClick="fn_review('${contextPath}/boardGq/boardGqReviewform.do', ${item.b_gq_id})" />
															</c:if>
															<c:if test="${not empty adminInfo }">
																<input id="buttons" type=button value="삭제"
																	onClick="fn_remove_board('${contextPath}/boardGq/boardGqDelete.do',${item.b_gq_id })" />
															</c:if>
															<br> <img id="p_img"
																src="${contextPath}/thumbnailsBoardGq.do?b_gq_id=${item.b_gq_id}"
																onerror="this.style.display='none';" />
															<textarea readonly>${item.content}</textarea>
															<c:forEach var="boardGqReviewList"
																items="${boardGqReviewList}">
																<c:choose>
																	<c:when
																		test="${boardGqReviewList.parentNo == item.b_gq_id and empty boardGqReviewList.secret or not empty boardGqReviewList.secret and item.u_id == memberInfo.u_id or not empty boardGqReviewList.secret and item.s_id == sellerInfo.s_id or not empty adminInfo}">
																		<br>
																		<input id="answer" type="text" value="답변">
																		<br>
																		<br>
																		<input type="text" id="Reviewtitle"
																			value="${boardGqReviewList.title}" readonly>
																		<br>
																		<input type="text" id="Reviewwriter"
																			value=" 작성자: ${boardGqReviewList.s_id}" readonly>
																		<br>



																		<c:if
																			test="${boardGqReviewList.s_id == sellerInfo.s_id }">
																			<input id="buttons" type=button value="수정"
																				onClick="fn_update('${contextPath}/boardGq/boardGqUpdateform.do',${boardGqReviewList.b_gq_id })" />
																			<input id="buttons" type=button value="삭제"
																				onClick="fn_remove_board('${contextPath}/boardGq/boardGqDelete.do',${boardGqReviewList.b_gq_id })" />
																			<br>
																		</c:if>
																		<c:if test="${not empty adminInfo }">
																			<input id="buttons" type=button value="삭제"
																				onClick="fn_remove_board('${contextPath}/boardGq/boardGqDelete.do',${boardGqReviewList.b_gq_id })" />
																			<br>
																		</c:if>
																		<img id="p_img"
																			src="${contextPath}/thumbnailsBoardGq.do?b_gq_id=${boardGqReviewList.b_gq_id}"
																			onerror="this.style.display='none';" />
																		<br>
																		<textarea readonly>${boardGqReviewList.content}</textarea>
																	</c:when>

																	<c:when
																		test="${boardGqReviewList.parentNo == item.b_gq_id and not empty boardGqReviewList.secret and item.u_id != memberInfo.u_id and item.s_id != sellerInfo.s_id and empty adminInfo}">
																		<br>
																		<input id="answer" type="text" value="답변">
																		<br>
																		<br>
																		<input type="text" id="Reviewtitle" value="비밀글입니다"
																			readonly>
																		<br>
																		<input type="text" id="Reviewwriter"
																			value=" 작성자: ****" readonly>
																		<br>

																		<img id="p_img"
																			src="${contextPath}/resources/image/lock.png"
																			onerror="this.style.display='none';" />
																		<br>
																		<textarea readonly>비밀글입니다</textarea>

																	</c:when>
																</c:choose>
															</c:forEach>
														</p></li>
												</ul>
											</c:when>
											<c:when
												test="${not empty item.secret and item.u_id != memberInfo.u_id and item.s_id != sellerInfo.s_id and empty adminInfo}">
												<ul id="slider1">
													<li id="slider1-1"><span id="slide1-11">비밀글입니다<input
															type="text" id="title_Reviewwriter" value=" 작성자: ****"
															readonly></span></li>
												</ul>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
</body>
<script>
	$(document).ready(function() {
		$("p p").hide();
		// $("ul > li:first-child a").next().show();
		$("ul li span").click(function() {
			$(this).next().slideToggle(300);
			// $(this).next().slideDown(300);
			$("ul li span").not(this).next().slideUp(300);
			return false;
		});
		$("ul li span").eq(0).trigger("click");
	});
</script>
</html>