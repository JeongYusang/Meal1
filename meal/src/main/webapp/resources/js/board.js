function fnc() {
	$(".checkpw").click(function() {
		/*사이트맵버튼클릭시*/
		$(".check-context").fadeIn();
		$(".nav_ul").css("display", "none");
	});
}
function fnclose() {
	$(".check-close").click(function() {
		/*사이트맵닫기버튼*/
		$(".check-context").fadeOut();
		$(".nav_ul").css("display", "block");
	});
}

function fnc2() {
	$(".checkpw1").click(function() {
		/*사이트맵버튼클릭시}*/
		$(".check-context1").fadeIn();
		$(".nav_ul").css("display", "none");
	});
}
function fnclose2() {
	$(".check-close1").click(function() {
		/*사이트맵닫기버튼*/
		$(".check-context1").fadeOut();
		$(".nav_ul").css("display", "block");
	});
}