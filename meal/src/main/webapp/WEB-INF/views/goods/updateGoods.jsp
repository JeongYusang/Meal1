<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

var g_cate2 = ${goodsInfo.g_cate2};
g_cate2 = g_cate2.split('/');
var arrLen = arr.length;

var chk = $('input:checkbox[name=allergy]');

for (var i = 0; i < arrLen; i++) { // arr
    var arrVal = arr[i]; // arr의 값 = i : 0, arrVal : 2
    chk.filter('[value=' + arrVal + ']').prop('checked', true); // arrVal 값 2, 4, 5에 의해 checkbox의 value의 값 2, 4, 5를 checked 처리
}


  var cnt=0;
  function fn_addFile(){
     if(cnt == 0){
        $("#d_file").append("<br>"+"<input  type='file' name='main_image' id='f_main_image' />");     
     }else{
        $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' />");
     }
     
     cnt++;
  }
  
  
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
             alert("사용할 수 없는 상품명입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax    
    }else{	
    	alert("상품명을 입력해주세요.");
    }
    // end if 
 }   
//추후 변경할 예정
function fn_saleDel(){
    var _g_id = ${goodsInfo.g_id};
    
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/goods/saleEnd.do",
       dataType:"text",
       data: {g_id:_g_id},
       success:function (data,textStatus){
              alert("기존 세일 정보가 삭제되었습니다.");
              console.log(data);
       },
       error:function(data){
          alert(data);
       }
    });  //end ajax    

 }   
/* 전송 버튼시 작동 */
function check1() {
	
	 var salePer = document.getElementById("g_salePer").value;
	 var saleWon = document.getElementById("g_saleWon").value;
	 var saleDate1 = document.getElementById("g_saleDate1").value;
	 var saleDate2 = document.getElementById("g_saleDate2").value;
	 var saleDate3 = document.getElementById("g_saleDate3").value;
	 var saleDate4 = document.getElementById("g_saleDate4").value;
/* 	 console.log("per 값 "+ salePer);
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
		 if((saleDate1 == '' || saleDate2 == '') || (saleDate3 == '' || saleDate4 == ''  ) ) {
			 alert("할인 금액에 따른 기간을 설정해주세요!");
			 return false;
		 }
	 }
	
	 if(saleDate3 == '' || saleDate4 == '' ) {
		 
		 if(salePer != '' || saleWon != '')  {
			 if(!(saleDate1 != '' && saleDate2 != '') ){
				alert ("할인 기간에 따른 할인율 또는 할인가격을 적어주세요.");
				return false;
			 }
		}
	} 
	 
	 
	 var g_allergy_M = '';
	 $('input[type="checkbox"]:checked').each(function (index) {
	     if (index != 0) {
	    	 g_allergy_M += '/ ';
	  
	     }       
	     g_allergy_M += $(this).val();
		 
	 });
	 document.getElementById("g_allergy_M").value = g_allergy_M;
	 return true;
}
</script>

<style>
.goodsform textarea {
	height: 6.25em;
	border: 1px solid;
	resize: none;
}

.goodsform th {
	text-align: left;
}

#submit .button {
	margin: auto;
}

#goodsform-container h1 {
	text-align: center;
	background-color: #ffc0cb;
	margin: 0px;
}

#goodsform-container {
	border: solid 1px;
	margin: 10px;
}
</style>
<body>
	<div id="goodsform-container">
		<h1>상품 수정하기</h1>
		<form id="frmUpdateGoods" name="frmUpdateGoods"
			action="${contextPath}/goods/updateGoods.do" method="post"
			enctype="multipart/form-data" onsubmit="return check1()">
			<input type="hidden" name="s_id" value="${sellerInfo.s_id}" /> <input
				type="hidden" name="g_id" value="${goodsInfo.g_id}" />
			<table class="goodsform">
				<tr class="box">
					<th>상품사진*</th>
					<td><img id="" width="150px" height="150px"
						src="${contextPath}/download1.do?g_id=${goodsInfo.g_id}&cate=main">${imageList[0].fileName}
						<br> <input type="file" name="main" /></td>
				</tr>
				<tr class="box">
					<th>상품명*</th>
					<td><input type="text" name="g_name" id="_g_name"
						value="${goodsInfo.g_name }" required="required"> <!--  	<input type="hidden" name="g_name" id="g_name"> -->
						<input type="button" value="중복확인" onclick="fn_overlapped()"
						id="btnOverlapped"></td>
				</tr>
				<tr class="box">
					<th>상품가격*</th>
					<td><input type="text" name="g_price" id="g_price"
						value="${goodsInfo.g_price }" required="required" /></td>
				</tr>
				<tr class="box">
					<th>할인가격</th>
					<td><input type="text" name="g_saleWon" id="g_saleWon"
						value="${goodsInfo.g_saleWon }" required="required"></td>
				</tr>
				<tr class="box">
					<th>할인율</th>
					<td><select name="g_salePer" id="g_salePer"
						title="${goodsInfo.g_salePer}">
							<option value="${goodsInfo.g_salePer }">${goodsInfo.g_salePer }</option>
							<option value="0">0</option>
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
					</select>%</td>
				</tr>
				<tr class="box">
					<th>적용된 할인기간</th>
					<td><fmt:formatDate value="${goodsInfo.g_saleDate1 }"
							type="Date" dateStyle="short" /> ~ <fmt:formatDate
							value="${goodsInfo.g_saleDate2 }" type="Date" dateStyle="short" />
						<input type="hidden" value="${goodsInfo.g_saleDate1}" /> <input
						type="hidden" value="${goodsInfo.g_saleDate2}" /> <input
						type="button" onclick="fn_saleDel()" value="기존 세일 삭제하기.">
					</td>
				</tr>
				<tr class="box">
					<th>변경할 할인기간</th>
					<td><input name="g_saleDate3" id="g_saleDate3" type="date"
						value="submit"> ~ <input name="g_saleDate4"
						id="g_saleDate4" type="date" value="submit"></td>
				</tr>
				<tr class="box">
					<th>수량*</th>
					<td><input type="text" name="g_amount" id="g_amount"
						value="${goodsInfo.g_amount }" required="required" /></td>
				</tr>
				<tr class="box">
					<th>카테고리 설정*</th>
					<td><select name="g_cate2" id="g_cate2"
						title="${goodsInfo.g_cate2}">
							<option value="${goodsInfo.g_cate2 }" selected>${goodsInfo.g_cate2 }</option>
							<option value="찌개/탕/찜">찌개/탕/찜</option>
							<option value="식사/안주">식사/안주</option>
							<option value="죽">죽</option>
							<option value="간편식">간편식</option>
							<option value="고기">고기</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>
				<tr class="box">
					<th>난이도*</th>
					<td><select name="g_nan" id="g_nan" title="${goodsInfo.g_nan}">
							<option value="${goodsInfo.g_nan}" selected>${goodsInfo.g_nan}</option>
							<option value="상">상</option>
							<option value="중">중</option>
							<option value="하">하</option>
					</select></td>
				</tr>
				<tr class="box">
					<th>조리 시간*</th>
					<td><input type="text" name="g_time" id="g_time"
						placeholder="조리시간(분)" value="${goodsInfo.g_time}"
						required="required" /></td>
				</tr>
				<tr class="box">
					<th>보관방법*</th>
					<td><select name="g_bang" id="g_bang"
						title="${goodsInfo.g_bang}">
							<option value="${goodsInfo.g_bang}" selected>${goodsInfo.g_bang}</option>
							<option value="냉동">냉동</option>
							<option value="냉장">냉장</option>
							<option value="실온">실온</option>
					</select></td>
				</tr>
				<tr class="box">
					<th>인분수*</th>
					<td><select name="g_inbun" id="g_inbun"
						title="${goodsInfo.g_inbun}">
							<option value="${goodsInfo.g_inbun}" selected>${goodsInfo.g_inbun}</option>
							<option value="1~2인분">1~2인분</option>
							<option value="2~3인분">2~3인분</option>
							<option value="3~4인분">3~4인분</option>
					</select></td>
				</tr>
				<tr class="box">
					<th>알러지 유발 성분*</th>
					<td colspan="3"><input type="checkbox" name="g_allergy" value="갑각류"
						id="g_allergy_M1">갑각류 <input type="checkbox" name="g_allergy" value="견과류"
						id="g_allergy_M2">견과류 <input type="checkbox" name="g_allergy" value="대두"
						id="g_allergy_M3">대두 <br> <input type="checkbox"
						value="유제품" name="g_allergy" id="g_allergy_M4">유제품 <input type="checkbox"
						value="계란류" name="g_allergy" id="g_allergy_M5">계란류 <input type="checkbox"
						value="밀" name="g_allergy" id="g_allergy_M6">밀 <input type="hidden"
						id="g_allergy_M" name="g_allergy_M"  value=""></td>
				</tr>
				<tr class="box">
					<th>알러지 상세항목</th>
					<td><textarea id="test" name="g_allergy_D" cols="30" rows="3">${goodsInfo.g_allergy_D}</textarea></td>
				</tr>
				<tr class="box">
					<th>상세이미지*</th>
					<td><img id="g_image" width="150px" height="150px"
						src="${contextPath}/download1.do?g_id=${goodsInfo.g_id}&cate=detail">${imageList[1].fileName}
						<br> <input type="file" name="detail" /></td>
				</tr>
				<tr class="box">
					<th>상세설명*</th>
					<td><textarea id="test" name="g_detail1" cols="30" rows="10">${goodsInfo.g_detail1 }</textarea>
						<div id="test_cnt">(0 / 2000)</div></td>
				</tr>
				<tr class="box">
					<td colspan="2"><input type="submit" value="수정하기"> <input
						type="button" id="pageBack" value="뒤로가기" onclick="#"></td>
				</tr>


			</table>
		</form>
	</div>
</html>