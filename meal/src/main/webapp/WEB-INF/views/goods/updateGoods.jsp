<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<h1> 상품 등록하기</h1>
<form id="frminsertgoods" name="frminsertgoods" action="${contextPath}/goods/addNewGoods.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="s_id" value= "${sellerInfo.s_id}"/>
   <table class="goodsform">
      <tr class="box">
         <th>상품사진*</th>
         <td>
			<img id="" width="150px" height="150px" src="${contextPath}/resources/image/mini1.PNG">
			<br>
         	<input type="file" name="main"  />
         </td>
      </tr>
     <tr class="box">
         <th>상품명*</th>
         <td>
         	<input type="text" name="g_name" id="_g_name" value="" placeholder="상품명" required="required">
   <!--  	<input type="hidden" name="g_name" id="g_name"> -->
    	 	<input type="button" value="중복확인" onclick="fn_overlapped()" id="btnOverlapped">
         </td>
      </tr>
         <tr class="box">
         <th>상품가격*</th>
         <td>
         	<input type="text" name="g_price" id="g_price" required="required" />
         </td>
      </tr>
      <tr class="box">
         <th>할인가격</th>
         <td>
         	<input type="text" name="g_saleWon" id="g_saleWon" required="required">
         </td>
      </tr>
      <tr class="box">
         <th>할인율</th>
         <td>
             <select name="g_salePer" id="g_salePer">
                 <option value="" disabled selected>선택하세요</option>
                 <option value="5%" id="g_salePer">5%</option>
                 <option value="10%">10%</option>
                 <option value="15%">15%</option>
                 <option value="20%">20%</option>
                 <option value="25%">25%</option>
                 <option value="30%">30%</option>
                 <option value="35%">35%</option>
                 <option value="40%">40%</option>
                 <option value="45%">45%</option>
                 <option value="50%">50%</option>
             </select>
      	</td>
      </tr>
      <tr class="box">
         <th>할인기간</th>
         	<td>
         		<input name="g_saleDate1" id="g_saleDate1" type="date" value="submit"> ~ 
    			<input name="g_saleDate2" id="g_saleDate2" type="date" value="submit">
            </td>
      </tr>
      <tr class="box">
         <th>수량*</th>
         <td>
         	<input type="text" name="g_amount" id="g_amount" placeholder="재고 수량을 입력해주세요" required="required" />
         </td>
      </tr>
      <tr class="box">
         <th>카테고리 설정*</th>
         <td>
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
         <th>난이도*</th>
         <td><div id = "form-div">
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
         <th>조리 시간*</th>
         <td><input type="text" name="g_time" id="g_time" placeholder="조리시간(분)"
            required="required" /></td>
      </tr>
      <tr class="box">
         <th>보관방법*</th>
         <td><div id = "form-div"> 
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
         <th>인분수*</th>
         <td><div id = "form-div"> 
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
         <th>알러지 유발 성분*</th>
         <td colspan="3"><textarea id="allergy" name = "g_allergy" cols="30" rows="10"></textarea></td>
      </tr>
      <tr class="box">
         <th>상세이미지*</th>
         <td>
         	<c:forEach var="imageList" items="${imageList}">
         		<c:if test="${cate == main}">
				<img id="g_image" width="300px" height="300px" src="${contextPath}/download1.do?g_id=${imageList.g_id}&${imageList.fileName}">
				</c:if>
			</c:forEach>
         	<input type="file" name="detail" />
         </td>
      </tr>
      <tr class="box">
         <th>상세설명*</th>
         <td><textarea id="test" name="g_detail1" cols="30" rows="10"></textarea>
            <div id="test_cnt">(0 / 2000)</div></td>
      </tr>
      <tr class="box">
		 <td colspan="2">
    	 	<input type="submit" id="updateGoods" value="수정하기">
    	 	<input type="button" id="pageBack" value="뒤로가기" onclick="#">
    	 </td>
      </tr>


   </table>
   </form>
   </div>
</html>