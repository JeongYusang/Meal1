
$("#agree3").click(function() {
	/*사이트맵버튼클릭시}*/
	$(".agree-context").fadeIn();
	$(".nav_ul").css("display", "none");

});
$(".agree-close").click(function() {
	/*사이트맵닫기버튼*/
	$(".agree-context").fadeOut();
	$(".nav_ul").css("display", "block");
})

$("#agree2").click(function() {
	/*사이트맵버튼클릭시}*/
	$(".agree-context1").fadeIn();
	$(".nav_ul").css("display", "none");

});
$(".agree-close1").click(function() {
	/*사이트맵닫기버튼*/
	$(".agree-context1").fadeOut();
	$(".nav_ul").css("display", "block")
})

/*
var agree3 = document.getElementsByID("agree3");
var agree_close = document.getElementsByClassName("agree-close");
var agreecontext = document.getElementsByClassName("agreecontext");
var nav_ul = document.getElementByClassName("nav_ul");
agree3.onclick= function(){
	agreecontext.style.display ="block";
	nav_ul.style.display ="none";
}
agree_close.onclick = function(){
	agreecontext.style.display = "none";
	nav_ul.style.display ="block";
}*/

