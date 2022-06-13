<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
  function fn_add_new_goods(obj){
       fileName = $('#f_main_image').val();
       if(fileName != null && fileName != undefined){
          obj.submit();
       }else{
          alert("메인 이미지는 반드시 첨부해야 합니다.");
          return;
       }
       
   } 
$(document).ready(function() {
    $('#test').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 2000)");
 
        if($(this).val().length > 2000) {
            $(this).val($(this).val().substring(0, 2000));
            $('#test_cnt').html("(2000 / 2000)");
        }
    });
})



//추후 변경할 예정
function fn_overlapped(){
    var _g_name=$("#_g_name").val();

    if(_g_name != null && _g_name != ""){
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/goods/goodsoverlapped.do",
       dataType:"text",
       data: {g_name:_g_name},
       success:function (data,textStatus){
          if(data=='false'){
              alert("사용할 수 있는 상품명입니다.");
              $('#btnOverlapped').prop("disabled", true);
              $('#g_name').val(_g_name); 
           
          }else{
             alert("중복 된 상품명입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");
       }
    }); //end ajax    
    
    }else{   
       alert("상품명을 입력해주세요.");
    }
    // end if 
 }   
 
 /* 전송 버튼시 작동 */
 function check1() {
   
    var salePer = document.getElementById("g_salePer").value;
    var saleWon = document.getElementById("g_saleWon").value;
    var saleDate1 = document.getElementById("g_saleDate1").value;
    var saleDate2 = document.getElementById("g_saleDate2").value;
/*     console.log("per 값 "+ salePer);
    console.log("won 값 "+saleWon);
    console.log("D1 값 "+saleDate1);
    console.log("D2 값 "+saleDate2);
    console.log("per 무 "+!salePer);
    console.log("won 무 "+!saleWon);
    console.log("D1 무 "+!saleDate1);
    console.log("D2 무 "+!saleDate2);
    console.log("연산자 "+ (!salePer && !saleWon));
    console.log("!(!salePer && !saleWon) " + !(!salePer && !saleWon));
    console.log(" (!salePer ^ !saleWon) "+ (!salePer ^ !saleWon));
    console.log(" !(!saleDate1 || !saleDate2) " +!(!saleDate1 || !saleDate2));
    console.log(" (salePer != '' || saleWon !='') " + (salePer != '' || saleWon != '')); */
    
    if(salePer != '' && saleWon != '' ){
       alert("할인 적용유형을 한가지만 기입해주세요.");
       return false;
    }
       
    if(salePer != '' || saleWon != '' )  {
       if(saleDate1 == '' || saleDate2 == '' ) {
          alert("할인 금액에 따른 기간을 설정해주세요!");
          return false;
       }
    }
   
    if(saleDate1 != '' || saleDate2 != '' ) {
        
        if(salePer == '' && saleWon == '')  {
        alert ("할인 기간에 따른 할인율 또는 할인가격을 적어주세요.")
         return false;
       } 
    }
    


       
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
.goodsform textarea {
    height: 10.25em;
    width: 17.25em;
    border: 1px solid;
    resize: none;
    font-size: 18px;
  }
th.boxhead{
text-align: left;
font-size: x-large;
 }

tr.box {
width: 700px;
}

td.boxbody {
font-size: x-large;
}

th.fileboxhead{
text-align: left;
font-size: x-large;
 }

tr.filebox {
width: 700px;
}

td.fileboxbody {
font-size: x-large;
}
 
input {
font-size: large;
height: 31px
}

select {
height: 31px;
}

#submit .button {
margin: auto;
}
#goodsform-container h1{
text-align: center;
background-color: #ffd3dd;
margin: 0px;
height: 70px;
line-height: 65px;
font-size: xx-large;
font-weight: 500;
}
#goodsform-container {
border: 1px solid;
width: 700px;
height: 100%;
text-align: -webkit-center;
margin: 10px 0px 10px 0px;
}

input#addgoods {
    margin: 10px 0px 10px 0px;
    background: #ffd3dd;
    border: 1px solid;
    border-radius: 4px;
    color: #666666a3;
}

input#btnOverlapped {
    margin: 10px 0px 10px 0px;
    background: #ffd3dd;
    border: 1px solid;
    border-radius: 4px;
    color: #666666a3;
}

input


</style>
<body>
<div id="goodsform-container">
<h1> 상품 등록하기</h1>
<form id="frminsertgoods" name="frminsertgoods" action="${contextPath}/goods/addNewGoods.do" method="post" enctype="multipart/form-data" onsubmit="return check1()">
<input type="hidden" name="s_id" value= "${sellerInfo.s_id}"/>
   <table class="goodsform">
      <tr class="box">
         <th class="boxhead">상품사진*</th>
         <td class="boxbody"><input type="file" name="main"  /></td>
         
      </tr>
     <tr class="box">
         <th class="boxhead" class="boxhead">상품명*</th>
         <td class="boxbody">
            <input type="text" name="g_name" id="_g_name" value="" placeholder="상품명" required="required">
   <!--     <input type="hidden" name="g_name" id="g_name"> -->
           <input type="button" value="중복확인" onclick="fn_overlapped()" id="btnOverlapped">
         </td>
      </tr>
         <tr class="box">
         <th class="boxhead">상품가격*</th>
         <td class="boxbody">
            <input type="text" name="g_price" id="g_price" required="required" placeholder="ex)10000(원)"/>
         </td>
      </tr>
      <tr class="box">
         <th class="boxhead">할인가격</th>
         <td class="boxbody">
            <input type="text" name="g_saleWon" id="g_saleWon" placeholder="ex)1000(원)">
         </td>
      </tr>
      <tr class="box">
         <th class="boxhead">할인율</th>
         <td class="boxbody">
             <select name="g_salePer" id="g_salePer">
                 <option value="" selected>선택하세요</option>
                 <option value="" id="g_salePer" >0</option>
                 <option value="5">5</option>
                 <option value="10">10</option>
                 <option value="15">15</option>
                 <option value="20">20</option>
                 <option value="25">25</option>
                 <option value="30">30</option>
                 <option value="35">35</option>
                 <option value="40">40</option>
                 <option value="45">45</option>
                 <option value="50">50</option>
             </select>%
         </td>
      </tr>
      <tr class="box">
         <th class="boxhead">할인기간</th>
            <td class="boxbody">
               <input name="g_saleDate1" id="g_saleDate1" type="date" value="submit"> ~ 
             <input name="g_saleDate2" id="g_saleDate2" type="date" value="submit">
            </td>
      </tr>
      <tr class="box">
         <th class="boxhead">수량*</th>
         <td class="boxbody">
            <input type="text" name="g_amount" id="g_amount" placeholder="ex)10(개)" required="required" />
         </td>
      </tr>
      <tr class="box">
         <th class="boxhead">카테고리 설정*</th>
         <td class="boxbody">
         <div id = "form-div">
                <input type="radio" id="g_cate21" name="g_cate2" value="찌개/탕/찜" checked>
                <label for="g_cate21">찌개/탕/찜</label> 
                <input type="radio" id="g_cate22" name="g_cate2" value="식사/안주" checked>
                <label for="g_cate22">식사/안주</label> 
         </div>
         <div id = "form-div">
               <input type="radio" id="g_cate23" name="g_cate2" value="죽" checked> 
                <label for="g_cate23">죽</label>
                <input type="radio" id="g_cate24" name="g_cate2" value="간편식" checked>
                <label for="g_cate24">간편식</label> 
                <input type="radio" id="g_cate25" name="g_cate2" value="고기"checked>
                <label for="g_cate25">고기</label>
                <br> 
                <input type="radio" id="g_cate26" name="g_cate2" value="기타" checked> 
                <label for="g_cate26">기타</label>
         </div>
         </td>
      </tr>
      <tr class="box">
         <th class="boxhead">난이도*</th>
         <td class="boxbody"><div id = "form-div">
               <input type="radio" id="g_nan1" name="g_nan" value="상" checked>
                <label for="g_nan1">상</label> 
                <input type="radio" id="g_nan2" name="g_nan" value="중" checked>
                <label for="g_nan2">중</label> 
                 <input type="radio" id="g_nan3" name="g_nan" value="하" checked>
                <label for="g_nan3">하</label> 
            </div>
            </td>
      </tr>
      <tr class="box">
         <th class="boxhead">조리 시간*</th>
         <td class="boxbody"><input type="text" name="g_time" id="g_time" placeholder="ex)10(분)"
            required="required" /></td>
      </tr>
      <tr class="box">
         <th class="boxhead">보관방법*</th>
         <td class="boxbody"><div id = "form-div"> 
         <input type="radio" id="g_bang1" name="g_bang" value="냉동" checked>
                <label for="g_bang1">냉동</label> 
                <input type="radio" id="g_bang2" name="g_bang" value="냉장" checked> 
                <label for="g_bang2">냉장</label>
                <input type="radio" id="g_bang3" name="g_bang" value="실온" checked> 
                <label for="g_bang3">실온</label>
                </div>
                </td>
      </tr>
      <tr class="box">
         <th class="boxhead">인분수*</th>
         <td class="boxbody"><div id = "form-div"> 
         <input type="radio" id="g_inbun1" name="g_inbun" value="1~2인분" checked>
                <label for="g_inbun1">1~2인분</label> 
                <input type="radio" id="g_inbun2" name="g_inbun" value="2~3인분" checked> 
                <label for="g_inbun2">2~3인분</label>
                <br>
                <input type="radio" id="g_inbun3" name="g_inbun" value="3~4인분" checked> 
                <label for="g_inbun3">3~4인분</label>
                </div></td>
      </tr>
      <tr class="box">
         <th class="boxhead">알러지 유발 성분*</th>
         <td class="boxbody" colspan="3" >
            <label for="g_allergy_M1"><input type="checkbox" value="갑각류" id="g_allergy_M1" >갑각류</label>
            <label for="g_allergy_M2"><input type="checkbox" value="견과류" id="g_allergy_M2" >견과류</label>
            <label for="g_allergy_M3"><input type="checkbox" value="대두" id="g_allergy_M3" >대두</label>
            <br>
            <label for="g_allergy_M4"><input type="checkbox" value="유제품" id="g_allergy_M4" >유제품</label>
            <label for="g_allergy_M5"><input type="checkbox" value="계란류" id="g_allergy_M5" >계란류</label>
            <label for="g_allergy_M6"><input type="checkbox" value="밀" id="g_allergy_M6" >밀</label>
            <input type="hidden" id="g_allergy_M" name="g_allergy_M" value="">
         </td>
      </tr>
      <tr class="box">
         <th class="boxhead">알러지 상세항목</th>
         <td class="boxbody"><textarea id="test" name="g_allergy_D" cols="30" rows="3" placeholder="ex)대두 - 땅콩, 아몬드, 대두가루, 콩기름"></textarea></td>
      </tr>
      <tr class="filebox">
         <th class="fileboxhead">상세이미지*</th>
         <td class="fileboxbody">
         	<input type="file" name="detail" /><a href="#this" id="delete" class="btn" name="delete">삭제</a>
         </td>
         <td>
         	<a href="#this" id="addFile" class="btn">사진추가</a>
         </td>
      <tr class="box">
         <th class="boxhead">상세설명*</th>
         <td class="boxbody"><textarea id="test" name="g_detail1" cols="30" rows="10"></textarea>
            <div id="test_cnt">(0 / 2000)</div></td>
      </tr>
   </table>

   <input type="submit" id="addgoods"  value="상품등록" >

   </form>
   </div>
   <script>
   var gfv_count = 1;
   $(document).ready(function() {
   $("#addFile").on("click", function(e){ //파일 추가 버튼
		e.preventDefault();
		fn_addFile();
	});
	
	$("a[name='delete']").on("click", function(e){ //삭제 버튼
		e.preventDefault();
		fn_deleteFile($(this));
	});
});

function fn_addFile(){
	var str = "<p><input type='file' name='detail"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
	$(".fileboxbody").append(str);
	$("a[name='delete']").on("click", function(e){ //삭제 버튼
		e.preventDefault();
		fn_deleteFile($(this));
	});
}

function fn_deleteFile(obj){
	obj.parent().remove();
}
   </script>
</html>