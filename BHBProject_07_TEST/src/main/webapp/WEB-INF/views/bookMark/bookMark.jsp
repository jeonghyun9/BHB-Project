<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	$(document).ready(function() {
		
		//삭제버튼
		$(".deleteBtn").on("click", function () {
			console.log("deleteBtn 클릭 ");
			var num= $(this).attr("data-num");
			var xxx= $(this);
			$.ajax({
				url: "loginCheck/bookMarkDelete",
				type:"get",
				dataType: "text",
				data: {
					num: num
				},
				success: function(data, status, xhr) {
					console.log("success");
					//dom삭제 
					xxx.parents().filter("tr").remove();
				},
				error: function(xhr, status, error) {
					console.log(error);
				}			
			});//end ajax
		});//end event
		
		
		
		//전체선택 전세
		$("#allCheck1").on("click", function() {
			var result= this.checked;
			$(".check1").each(function(idx, data) {
				this.checked= result;
			});
		}); // 
		
		//전체선택 월세
		$("#allCheck2").on("click", function() {
			var result= this.checked;
			$(".check2").each(function(idx, data) {
				this.checked= result;
			});
		}); // 
		
		
		
		//전체삭제
		$("#delAllCart").on("click", function() {
			$("form").attr("action", "loginCheck/delAllCart");
			$("form").submit();
		}) // 
		
		
	}); // ready end
	
	

</script>

<table width="70%" cellspacing="1" cellpadding="1" border="0" >

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>전세목록</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center">
		<input type="checkbox"
		name="allCheck1" id="allCheck1"> <strong></strong></td> 
		<td class="td_default" align="center"><strong>매물번호</strong></td>  <!-- gCode -->
		<td class="td_default" align="center"><strong>매물사진</strong></td>  <!-- gImage -->
		<td class="td_default" align="center"><strong>매물정보</strong></td> <!-- address/location -->
		<td class="td_default" align="center"><strong>원/투룸</strong></td> <!-- address/location -->
		<td class="td_default" align="center"><strong>전세금</strong></td> <!-- gPrice_YP  -->
		<td class="td_default" align="center"><strong>중개인 정보</strong></td><!-- userid -->
		<td class="td_default" align="center"><strong>예약</strong></td>
		<td></td>
	</tr>

	<tr>
		<td height="7">
	</tr>
	
	
	
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>






<form name="myForm">
	    
	    
<!-- 반복시작 -->
<c:forEach var="yp" items="${yplist}">

	

		<tr>
			<td class="td_default" width="80" align="center">
			<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 
			따라서 value에 삭제할 num값을 설정한다. -->
			<input type="checkbox"
				name="check1" id="check81" class="check1" 
				value="${yp.num}"></td>
			<td class="td_default" width="80" align="center">${yp.num}</td>
			<td class="td_default" width="80">
			<img src="images/${yp.gImage1}.jpg" border="0" align="center"
				width="80" alt="img"/></td>
			<td class="td_default" width="300" style='padding-left: 30px' align="center">
			${yp.address}
				<br> <font size="2" color="#665b5f">[설명 : ${yp.location} ]
			</font></td>
			<td class="td_default" align="center">${yp.room }</td>
			<td class="td_default" align="center" >
			<span id="ggPrice${yp.num}">${yp.gPrice_YP} 만원</span></td>
			<td class="td_default" align="center">${yp.nickname } <br>
			<font size="2" color="#665b5f">[${yp.phone1}-${yp.phone2}-${yp.phone3}]</font></td>
			<td align="center"><input type="button" value="예약" class="orderBtn"
				data-num="${yp.num}">
				<input type="button" value="삭제" class="deleteBtn"
				data-num="${yp.num}">
			</td>

			
		</tr>

 <!-- 반복끝 --> 
</c:forEach>
</form>
	<tr>
		<td height="0" align="right">
	</tr>

	<tr>
		<td height="20">
	</tr>

</table>



<table width="70%" cellspacing="1" cellpadding="1" border="0" >

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>월세목록</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center" width="50">
		<input type="checkbox"
		name="allCheck2" id="allCheck2"> <strong></strong></td> 
		<td class="td_default" align="center"><strong>매물번호</strong></td>  <!-- gCode -->
		<td class="td_default" align="center"><strong>매물사진</strong></td>  <!-- gImage -->
		<td class="td_default" align="center"><strong>매물정보</strong></td> <!-- address/location -->
		<td class="td_default" align="center"><strong>원/투룸</strong></td> <!-- room -->
		<td class="td_default" align="center"><strong>보증금/월세</strong></td> <!-- gPrice_MP  -->
		<td class="td_default" align="center"><strong>중개인 정보</strong></td><!-- userid -->
		<td class="td_default" align="center"><strong>예약</strong></td>
		<td></td>
	</tr>

	<tr>
		<td height="7">
	</tr>
	
	
	
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>






<form name="myForm">
	    
	    
<!-- 반복시작 -->
<c:forEach var="mp" items="${mplist}">

	

		<tr>
			<td class="td_default" width="80" align="center">
			<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 
			따라서 value에 삭제할 num값을 설정한다. -->
			<input type="checkbox"
				name="check2" id="check81" class="check2" 
				value="${mp.num}"></td>
			<td class="td_default" width="80" align="center">${mp.num}</td>
			<td class="td_default" width="80">
			<img src="images/${mp.gImage1}.jpg" border="0" align="center"
				width="80" alt="img"/></td>
			<td class="td_default" width="300" style='padding-left: 30px' align="center">
			${mp.address}
				<br> <font size="2" color="#665b5f">[설명 : ${mp.location} ]
			</font></td>
			<td class="td_default" align="center">${mp.room }</td>
			<td class="td_default" align="center" >
			<span id="ggPrice${mp.num}">${mp.deposit }/${mp.gPrice_MP} 만원</span></td>
			<td class="td_default" align="center">${yp.nickname } <br>
			<font size="2" color="#665b5f">[${mp.phone1}-${mp.phone2}-${mp.phone3}]</font></td>
			<td align="center"><input type="button" value="예약" class="orderBtn"
				data-num="${yp.num}">
				<input type="button" value="삭제" class="deleteBtn"
				data-num="${yp.num}">
			</td>
			
		</tr>

 <!-- 반복끝 --> 
</c:forEach>
</form>
	<tr>
		<td height="0" align="right">
	</tr>
	<tr><td height="100"></td></tr>
	
	<tr></tr>
	<tr>
		<td align="right" colspan="8">
			<input type="button" id="delAllCart" value="전체삭제">
	
		</td>
	</tr>
	<tr>
		<td height="20">
	</tr>

</table>
    