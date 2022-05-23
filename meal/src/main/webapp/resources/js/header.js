

/*북마크*/

function bookmarkpop(){
	alert("북마크를 눌렀습니다.")
};

/*모달*/

$(".site-btn").click(function(){
   /*사이트맵버튼클릭시}*/
   $(".modal").fadeIn();
   $(".nav_ul").css( "display", "none");
   
});
$(".modal-close").click(function(){
   /*사이트맵닫기버튼*/
   $(".modal").fadeOut();
   $(".nav_ul").css( "display", "block");
})