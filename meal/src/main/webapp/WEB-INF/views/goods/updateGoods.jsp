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
</script>

<style>
.goodsform textarea {
    height: 6.25em;
    border: 1px solid;
    resize: none;
  }
 .goodsform th{
 text-align: left;
 }
#submit .button {
margin: auto;
}
#goodsform-container h1{
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
<h1> 상품 수정하기</h1>
<form id="frmUpdateGoods" name="frmUpdateGoods" action="${contextPath}/goods/updateGoods.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="s_id" value= "${sellerInfo.s_id}"/>
<input type="hidden" name="g_id" value= "${goodsInfo.g_id}"/>
   <table class="goodsform">
      <tr class="box">
         <th>상품사진*</th>
         <td>
			<img id="" width="150px" height="150px" src="${contextPath}/download1.do?g_id=${goodsInfo.g_id}&cate=main">${imageList[0].fileName}
			<br>
         	<input type="file" name="main"  />
         </td>
      </tr>
     <tr class="box">
         <th>상품명*</th>
         <td>
         	<input type="text" name="g_name" id="_g_name" value="${goodsInfo.g_name }" required="required">
   <!--  	<input type="hidden" name="g_name" id="g_name"> -->
    	 	<input type="button" value="중복확인" onclick="fn_overlapped()" id="btnOverlapped">
         </td>
      </tr>
         <tr class="box">
         <th>상품가격*</th>
         <td>
         	<input type="text" name="g_price" id="g_price" value="${goodsInfo.g_price }" required="required" />
         </td>
      </tr>
      <tr class="box">
         <th>할인가격</th>
         <td>
         	<input type="text" name="g_saleWon" id="g_saleWon" value="${goodsInfo.g_saleWon }" required="required">
         </td>
      </tr>
      <tr class="box">
         <th>할인율</th>
         <td>
             <select name="g_salePer" id="g_salePer" title="${goodsInfo.g_salePer}">
                 <option value="${goodsInfo.g_salePer }">${goodsInfo.g_salePer }</option>
                 <option value="0" >0</option>
                 <option value="5" >5</option>
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
         <th>적용된 할인기간</th>
         	<td>
         		<fmt:formatDate value="${goodsInfo.g_saleDate1 }" type="Date" dateStyle="short"/> ~ 
            	<fmt:formatDate value="${goodsInfo.g_saleDate2 }" type="Date" dateStyle="short"/>
            	<input type="hidden" value= "${goodsInfo.g_saleDate1}"/>
            	<input type="hidden"  value= "${goodsInfo.g_saleDate2}"/>
            </td>
      </tr>
      <tr class="box">
         <th>변경할 할인기간</th>
         	<td>
         		<input name="g_saleDate3" id="g_saleDate3" type="date" value="submit"> ~ 
    			<input name="g_saleDate4" id="g_saleDate4" type="date" value="submit">
            </td>
      </tr>
      <tr class="box">
         <th>수량*</th>
         <td>
         	<input type="text" name="g_amount" id="g_amount" value="${goodsInfo.g_amount }" required="required" />
         </td>
      </tr>
      <tr class="box">
         <th>카테고리 설정*</th>
         <td>
         <select name="g_cate2" id="g_cate2" title="${goodsInfo.g_cate2}">
                 <option value="${goodsInfo.g_cate2 }" selected>${goodsInfo.g_cate2 }</option>
                 <option value="찌개/탕/찜">찌개/탕/찜</option>
                 <option value="식사/안주">식사/안주</option>
                 <option value="죽">죽</option>
                 <option value="간편식">간편식</option>
                 <option value="고기">고기</option>
                 <option value="기타">기타</option>
             </select>
         </td>
      </tr>
      <tr class="box">
         <th>난이도*</th>
         <td>
         	<select name="g_nan" id="g_nan" title="${goodsInfo.g_nan}">
                 <option value="${goodsInfo.g_nan}" selected>${goodsInfo.g_nan}</option>
                 <option value="상">상</option>
                 <option value="중">중</option>
                 <option value="하">하</option>
             </select>
         </td>
      </tr>
      <tr class="box">
         <th>조리 시간*</th>
         <td><input type="text" name="g_time" id="g_time" placeholder="조리시간(분)" value="${goodsInfo.g_time}"
            required="required" /></td>
      </tr>
      <tr class="box">
         <th>보관방법*</th>
         <td>
         	 <select name="g_bang" id="g_bang" title="${goodsInfo.g_bang}">
                 <option value="${goodsInfo.g_bang}" selected>${goodsInfo.g_bang}</option>
                 <option value="냉동">냉동</option>
                 <option value="냉장">냉장</option>
                 <option value="실온">실온</option>
             </select>
         </td>
      </tr>
      <tr class="box">
         <th>인분수*</th>
         <td>
         	 <select name="g_inbun" id="g_inbun" title="${goodsInfo.g_inbun}">
                 <option value="${goodsInfo.g_inbun}" selected>${goodsInfo.g_inbun}</option>
                 <option value="1~2인분">1~2인분</option>
                 <option value="2~3인분">2~3인분</option>
                 <option value="3~4인분">3~4인분</option>
             </select>
         </td>
      </tr>
      <tr class="box">
         <th>알러지 유발 성분*</th>
         <td colspan="3">
         	<textarea id="allergy" name = "g_allergy" cols="30" rows="10" >${goodsInfo.g_allergy}</textarea>
         </td>
      </tr>
      <tr class="box">
         <th>상세이미지*</th>
         <td>
			<img id="g_image" width="150px" height="150px" src="${contextPath}/download1.do?g_id=${goodsInfo.g_id}&cate=detail" >${imageList[1].fileName}
			<br>
         	<input type="file" name="detail" />
         </td>
      </tr>
      <tr class="box">
         <th>상세설명*</th>
         <td><textarea id="test" name="g_detail1" cols="30" rows="10">${goodsInfo.g_detail1 }</textarea>
            <div id="test_cnt">(0 / 2000)</div></td>
      </tr>
      <tr class="box">
		 <td colspan="2">
    	 	<input type="submit" value="수정하기">
    	 	<input type="button" id="pageBack" value="뒤로가기" onclick="#">
    	 </td>
      </tr>


   </table>
   </form>
   </div>
</html>