<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(function(){
    //전체선택 전세
    $(".reserveBtn").on("click", function() {
        var num=${bDTO.num};
        location.href="loginCheck/reserveDone?num="+num;
        alert("예약이 완료되었습니다!");


    }); //예약버튼(클릭) 


});//function
</script>   


<section id="main" class="container medium">

<form name="myForm" method="get" action="loginCheck/reserveDone">

<input type="hidden" name="num" value="${bDTO.num}">
<input type="hidden" name="gCode" value="${bDTO.gCode}">
<input type="hidden" name="deposit" value="${bDTO.deposit}">
<input type="hidden" name="gPrice_MP" value="${bDTO.gPrice_MP}">
<input type="hidden" name="gPrice_YP" value="${bDTO.gPrice_YP}">
<input type="hidden" name="room" value="${bDTO.room}">
<input type="hidden" name="gImage1" value="${bDTO.gImage1}">
<input type="hidden" name="phone1" value="${bDTO.phone1}">
<input type="hidden" name="phone2" value="${bDTO.phone2}">
<input type="hidden" name="phone3" value="${bDTO.phone3}">
<input type="hidden" name="userName" value="${bDTO.userName}">
<input type="hidden" name="userid" value="${bDTO.userid}">
<input type="hidden" name="location" value="${bDTO.location}">
<input type="hidden" name="address" value="${bDTO.address}">
<input type="hidden" name="nickname" value="${bDTO.nickname}">
<input type="hidden" name="lessorid" value="${bDTO.lessorid}">

   
   <h3>매물 예약</h3>
   <div class="box">
   <table class="add-table" width="100%" cellspacing="0" cellpadding="0">

      <!-- 매물확인 테이블 시작 -->
      
         <c:if test="${bDTO.deposit < 1}">
         
            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                  <tr>
                     <td class="td_default" align="center">
                     <input type="checkbox" id="allCheck1"><label for="allCheck1"></label>
                     </td> 
                     <td class="td_default" align="center"><strong>매물번호</strong></td>  <!-- gCode -->
                     <td class="td_default" align="center"><strong>매물사진</strong></td>  <!-- gImage -->
                     <td class="td_default" align="center"><strong>매물정보</strong></td> <!-- address/location -->
                     <td class="td_default" align="center"><strong>원/투룸</strong></td> <!-- address/location -->
                     <td class="td_default" align="center"><strong>전세금</strong></td> <!-- gPrice_YP  -->
                     <td class="td_default" align="center"><strong>중개인 정보</strong></td><!-- userid -->
                     
                  </tr>

                  <tr>
                  <td class="td_default" width="80" align="center">
            
                     <input type="checkbox"
                     name="check1" id="check${bDTO.num}" class="check1" 
                     value="${bDTO.num}">
                     <label for="check${bDTO.num}"></label>
                  </td>
                  <td class="td_default" width="80" align="center">${bDTO.num}</td>
                  <td class="td_default" width="80">
                  <img src="Mimages/${bDTO.gImage1}.jpg" border="0" align="center"
                     width="80" alt="img"/></td>
                  <td class="td_default" width="300" style='padding-left: 30px' align="center">
                  ${bDTO.address}
                     <br> <font size="2" color="#665b5f">[설명 : ${bDTO.location} ]
                  </font></td>
         
                  <td class="td_default" align="center">${bDTO.room }</td>
                  <td class="td_default" align="center" >
                  <span id="ggPrice${bDTO.num}">${bDTO.gPrice_YP} 만원</span></td>
                  <td class="td_default" align="center">${bDTO.nickname } <br>
                  <font size="2" color="#665b5f">[${bDTO.phone1}-${bDTO.phone2}-${bDTO.phone3}]</font></td>
         </tr>
         </table>
         </c:if>
<!-- c:if deposit < 1  끝 -->         

            <c:if test="${bDTO.gPrice_YP < 1 }">
            <table width="100%" cellspacing="0" cellpadding="0">
            
                  <tr>
                     <td class="td_default" align="center">
                     <input type="checkbox" id="allCheck2"> <strong></strong>
                     <label for="allCheck2"></label></td> 
                     <td class="td_default" align="center"><strong>매물번호</strong></td>  <!-- gCode -->
                     <td class="td_default" align="center"><strong>매물사진</strong></td>  <!-- gImage -->
                     <td class="td_default" align="center"><strong>매물정보</strong></td> <!-- address/location -->
                     <td class="td_default" align="center"><strong>원/투룸</strong></td> <!-- address/location -->
                     <td class="td_default" align="center"><strong>보증금/월세</strong></td> <!-- gPrice_YP  -->
                     <td class="td_default" align="center"><strong>중개인 정보</strong></td><!-- userid -->
                     
                  </tr>

               

         <tr>
         <td class="td_default" width="80" align="center">
         <!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 
         따라서 value에 삭제할 num값을 설정한다. -->
         <input type="checkbox"
            name="check2" id="check${bDTO.num}" class="check1" 
            value="${bDTO.num}">
            <label for="check${bDTO.num}"></label></td>
         <td class="td_default" width="80" align="center">${bDTO.num}</td>
         <td class="td_default" width="80">
         <img src="Mimages/${bDTO.gImage1}.jpg" border="0" align="center"
            width="80" alt="img"/></td>
         <td class="td_default" width="300" style='padding-left: 30px' align="center">
         ${bDTO.address}
            <br> <font size="2" color="#665b5f">[설명 : ${bDTO.location} ]
         </font></td>
         <td class="td_default" align="center">${bDTO.room }</td>
         <td class="td_default" align="center" >
         <span id="ggPrice${bDTO.num}">${bDTO.deposit } / ${bDTO.gPrice_MP} 만원</span></td>
         <td class="td_default" align="center">${bDTO.nickname } <br>
         <font size="2" color="#665b5f">[${bDTO.phone1}-${bDTO.phone2}-${bDTO.phone3}]</font></td>
         </tr>
         </table>
         </c:if>
         

   <!-- 매물확인 테이블 종료 -->


   <!-- 방문날짜 시작 -->
      <tr>
      <td height="90">
   
      </tr>

   <tr>
      <td><b>방문날짜 선택</b></td>
   </tr>

   <tr>
      <td height="15">
   
      </tr>


   <tr>
      <td>
         <table width="100%" cellspacing="0" cellpadding="0" border="1"
               style="border-collapse:collapse" bordercolor="#CCCCCC">
            <tr>
               <td width="125" height="35" class="td_default">
                  
                	  날짜 선택
               </td>
               <td height="35" class="td_default">
                  
                  <input type="date" class="text" name="date" id="build" required="required" />
               </td>
            </tr>
            
            
               
            
         </table>                     
      </td>
   </tr>
<!--  방문날짜 끝-->

   <!-- 중개인정보 시작 -->
      <tr>
      <td height="90">
   
      </tr>

   <tr>
      <td><b>중개인 정보</b></td>
   </tr>

   <tr>
      <td height="15">
   
      </tr>


   <tr>
      <td>
         <table width="100%" cellspacing="0" cellpadding="0" border="1"
               style="border-collapse:collapse" bordercolor="#CCCCCC">
            <tr>
               <td width="125" height="35" class="td_default">
                  
                  이 름
               </td>
               <td height="35" class="td_default">
                  ${bDTO.nickname}
               </td>
            </tr>
            
            <tr>
               <td height="35" class="td_default">
                  
                  주 소
               </td>
               <td height="35" class="td_default">
                  ${lDTO.addr1}(${lDTO.addr2})
                  
               </td>
            </tr>
            
            <tr>
               <td height="35" class="td_default">
                  휴대전화
               </td>
               <td height="35" class="td_default">
                  ${bDTO.phone1}-${bDTO.phone2}-${bDTO.phone3}
                  
               </td>
            </tr>
         </table>                     
      </td>
   </tr>
<!--  중개인 끝-->

<!-- 노쇼방지 시작 -->
      <tr>
         <td height="160px">
      </tr>
      <tr>
         <td><b>노쇼 방지금 결제수단</b></td>
      </tr>

      <tr>
      <td height="15">
   
      </tr>
   <tr>
      <td>
         <table width="100%" cellspacing="0" cellpadding="0" border="1"
               style="border-collapse:collapse" bordercolor="#CCCCCC">
               <tr>
                  <td width = "100" align="center">결제금액</td>
                  <td width = "100" align="center">5 만원</td>
                  <td width="200"><font size="4" color="#b22222">* 확인 후 다시 돌려드립니다 </font> </td>
               </tr>
               <tr>
               <td width="125" height="35" class="td_default" colspan="3">
                  <input id="card" type="radio" name="payMethod" value="신용카드" checked >
                  <label for="card">신용카드</label>
                  
                  <input id="account" type="radio" name="payMethod" value="계좌이체">
                  <label for="account">계좌이체</label>
                  
                  <input id="send" type="radio" name="payMethod" value="무통장 입금">
                  <label for="send">무통장입금</label>
               </td>
               
            </tr>
            
         </table>                     
      </td>
   </tr>
   
   <tr>
      <td height="30">
   
      </tr>
<!-- 노쇼끝 -->

   <tr>
      <td class="td_default" align="center">
         <input type='button' value='취소' onclick="javascript:history.back()">   
         <input class="reserveBtn" type='submit' value='예약하기'>
      </td>
   </tr>

</table>
</div>
</form>

</section>