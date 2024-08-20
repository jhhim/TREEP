<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<div class="email_space">
		<div class="email_space_title">
			<p id="email_space_title_main">아이디 찾기</p>
			<p id="email_space_title_sub">TREEP서비스는 이메일 인증을 통해 아이디 찾기을 실시하실 수
				있습니다.</p>
		</div>
		<form class="emailcheckfrom" style="width: 100%;">
			<div class="input_area_email col-auto mb-5">
				<div class="input_InputEmail_area">
					<label for="InputEmail" class="col-form-label" id="input_text">이메일
						입력</label>
					<div class="input_Email" id="signup_space_">

						<input type="text"
							class="form-control form-control input_text_common mb-2 mail_input"  
							id="member_email" maxlength="50" aria-describedby="emailHelp" >
						
						<div class="col-auto">
							<button type="button" class="submit_btn_email mail_check_button" 
								id="submit_btn_forEmail">이메일 전송</button>
						</div>

					</div>

				</div>
				<div class="mail_check_input_box" id="mail_check_input_box_false">
					<label for="InputEmail" class="col-form-label" id="input_text">인증번호
						입력</label>
					<div class="mail_check_input_" id="signup_space_">

						<input type="text"
							class="form-control form-control input_text_common mb-2 mail_check_input"
							id="input_An" maxlength="6"  disabled="disabled">

						<div class="col-auto">
							<button type="submit" class="submit_btn_email"
								id="submit_btn_forAn" onclick="submitForm(event)" disabled="disabled">인증번호 입력</button>
						</div>
						
					</div>
				</div>
				<div>
					<div class="correct_msg">인증번호가 일치합니다.</div>
					<div class="error_msg">인증번호가 일치하지 않습니다.</div>
				</div>
			</div>

		</form>
	</div>
</main>
<script>
var code = "";
function submitForm(event) {
    event.preventDefault(); // 폼 제출을 방지합니다
    
    var email = document.getElementById('member_email').value;

    if (email) {
        var emailInput = document.createElement('input');
        emailInput.type = 'hidden';
        emailInput.name = 'member_email';
        emailInput.value = email;

        var form = document.querySelector('form'); // 폼 선택
        form.appendChild(emailInput);
        form.submit();
    } else {
        alert('이메일 주소를 입력해 주세요.');
    }
}
$(".mail_check_button").click(function() {
	
	var email = $("#member_email").val();		// 입력한 이메일
	var checkBox = $(".mail_check_input");	
	var boxdiv = $(".mail_check_input_box");
	var subbtn = $(".submit_btn_email");
	console.log(email);
	$.ajax({
		type : "GET",
		url : "${path}/emailchk?email=" + email,
		success : function(data){
			
			//console.log("data : " + data);
			checkBox.attr("disabled",false);
			boxdiv.attr("id", "mail_check_input_box_true");
			code = data;
		}
	})
	
});

$(".mail_check_input").blur(function() {
	
	var inputCode = $(".mail_check_input").val();			// 입력코드
	var checkResult = $("#submit_btn_forAn_warn");	
	var subbtn = $(".submit_btn_email");// 비교 결과
	
	if (inputCode == code) {								// 일치할 경우
		$('.correct_msg').css("display", "inline-block");
		$('.error_msg').css("display", "none");
		$('.emailcheckfrom').attr("action","resultSearchid");
		subbtn.attr("disabled",false);
		
	}
	else if(!inputCode){
		$('.correct_msg').css("display", "none");
		$('.error_msg').css("display", "none");
		subbtn.attr("disabled",true);
	}
	else {												// 일치하지 않을 경우
		$('.correct_msg').css("display", "none");
		$('.error_msg').css("display", "inline-block");
		subbtn.attr("disabled",true);
	}
	
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
