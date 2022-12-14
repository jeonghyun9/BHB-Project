<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	  $("#userid").on("keyup",function(){
		  $.ajax({
			 url:'idDuplicateCheck',
			 type:'get',
			 data:{
				 id:$("#userid").val(),
			 },
			 dataType:"text",
			 success:function(data,status,xhr){
				 console.log(data);
				 $("#result").text(data);
			 },
			 error:function(xhr,status,error){
			 }
		  });//end ajax
	  });//end on
 	  
	   $("form").on("submit", function (event) {
		   var userid = $("#userid").val();
           var passwd = $("#passwd").val();
           var passwd2 = $("#passwd2").val();
           var username = $("#username").val();
           var post = $("#sample4_postcode").val();
           var addr1 = $("#sample4_roadAddress").val();
           var addr2 = $("#sample4_jibunAddress").val();
           var phone2 = $("#phone2").val();
           var phone3 = $("#phone3").val();
           var email1 = $("#email1").val();
           var email2 = $("#email2").val();
		
           if (userid.length<=3||userid.length>=11) {
               alert("아이디를 4자리 이상, 10자리 이하로 입력해주세요")
               $("#userid").focus();
               event.preventDefault();
           }else if (passwd.length<=3||passwd.length>=11) {
               alert("비밀번호를 4자리 이상, 10자리 이하로 입력해주세요")
               $("#passwd").focus();
               event.preventDefault();
           }else if (passwd2.length<=3||passwd2.length>=11) {
               alert("비밀번호를 확인해주세요")
               $("#passwd2").focus();
               event.preventDefault();         
           }else if (passwd!=passwd2) {
               alert("비밀번호가 일치하지 않습니다")
               $("#passwd2").focus();
               event.preventDefault();
           }else if (username.length>6||username.length<2) {
               alert("이름을 입력 해주세요")
               $("#username").focus();
               event.preventDefault();
           }else if (post.length==0) {
               alert("주소를 선택해 주세요.")
               $("#sample4_postcode").focus();
               event.preventDefault();
           }else if (addr1.length==0) {
               alert("주소를 입력해 주세요.")
               $("#sample4_roadAddress").focus();
               event.preventDefault();
           }else if (addr2.length==0) {
               alert("주소를 입력해 주세요")
               $("#sample4_jibunAddress").focus();
               event.preventDefault();
           }else if (phone2.length<=2||phone2.length>=5) {
               alert("전화번호를 확인해 주세요")
               $("#phone2").focus();
               event.preventDefault();
           }else if (phone3.length<=3||phone3.length>=5) {
               alert("전화번호를 확인해주세요")
               $("#phone3").focus();
               event.preventDefault();
           }else if (email1.length==0) {
               alert("이메일 주소를 확인해 주세요")
               $("#email1").focus();
               event.preventDefault();
           }else if (email2.length==0) {
               alert("이메일 주소를 확인해 주세요")
               $("#email2").focus();
               event.preventDefault();
           }

		
	})//end submit
	  
	  
	//비번확인
	 $("#passwd2").on("keyup", function() {
	         var passwd = $("#passwd").val();
	         var mesg = "비밀번호 불일치";
	         if(passwd == $(this).val()){
	             mesg = "비밀번호 일치";
	         }
	         $("#result2").text(mesg);
	         })//비번 end
	         
	         $("#passwd").on("keyup", function() {
                 var passwd = $("#passwd").val();
                 var mesg = "";
                 if(passwd.length>3&&passwd.length<11){
                     mesg = "비밀번호 사용가능";
                 } else {
                    mesg = "비밀번호 사용불가"
                }
                 $("#result3").text(mesg);
                 })//비번 end
                 
               //이메일 입력방식 선택 
                $("#emailSelect").on("change",function(){ 
            	   $("#emailSelect option:selected").each(function () { 
            		   if($(this).val()== '1'){ //직접입력일 경우
            			 $("#email2").val(''); // 값 초기화        			
            			 }else{ // 직접입력이 아닐경우 활성화
            			 $("#email2").val($(this).text()); //선택값 입력
            			 } 
            		 }); 
            	  }); 
				  });//end ready
</script>
<form action="memberAdd" method="post">
<section id="main" class="container medium">
<jsp:include page="../common/top.jsp" flush="true"></jsp:include>
<div class="box">
*아이디<input type="text" name="userid" id="userid" required="required">
<span id="result"></span>
<br> 
*비밀번호<input type="text" name="passwd" id="passwd" required="required"><br> 
비빌번호확인<input type="password" name="passwd2" id="passwd2" required="required">
<span id="result2"></span>
<br> 
이름<input type="text" name="username" id="username" required="required"><br> 
주소 
<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" class="i" value="${login.post }"><br>
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" class="i" value="${login.addr1 }"><br>
<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" class="i" value="${login.addr2 }"><br>
<span id="guide" style="color:#999"></span>
<br>
전화번호<br>
<div class="row gtr-uniform gtr-50"> <!-- 한 라인에 인풋 비율 설정 -->
<div class="col-12"> <!-- 2/12칸 -->
<select style="width: 100%;" name="phone1" id="phone1">
  <option value="010">010</option>
  <option value="011">011</option>
</select>
</div>
<div class="col-12"> <!-- 5/12칸 -->
	<input  type="text" name="phone2" id="phone2" required="required" placeholder="전화번호 앞자리">
</div>
<div class="col-12"> <!-- 5/12칸 -->
	<input  type="text" name="phone3" id="phone3" required="required" placeholder="전화번호 뒤자리">
</div>
</div>
<br>
이메일
<input type="text" size="15" name="email1" id="email1" placeholder="이메일 ID" required="required">
<input type="text" size="15" name="email2" id="email2" placeholder="이메일주소" required="required">
<br>
<div class="col-12">      
     <select  id="emailSelect" style="width: 100%;">
        <option value="1">직접입력</option>
        <option value="daum.net">daum.net</option>
        <option value="naver.com">naver.com</option>
        <option value="gmail.com">gmail.com</option>
     </select>  
</div>       
</div>       
<br>
<input type="submit" value="회원가입">&nbsp;
<input type="reset" value="취소">


</section>
</form>



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
