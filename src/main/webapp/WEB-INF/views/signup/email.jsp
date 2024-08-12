<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<div class="email_space">
		<div class="email_space_title">
			<p id="email_space_title_main">이메일 인증</p>
			<p id="email_space_title_sub">TREEP서비스는 이메일 인증 후 회원가입을 실시하실 수
				있습니다.</p>
		</div>
		<form style="width: 100%;" action="signupinfo">
			<div class="input_area_email col-auto mb-5">
				<div class="input_InputEmail_area">
					<label for="InputEmail" class="col-form-label" id="input_text">이메일
						입력</label>
					<div class="input_Email" id="signup_space_">

						<input type="text"
							class="form-control form-control input_text_common mb-2"  
							id="member_email" maxlength="50" aria-describedby="emailHelp" >

						<div class="col-auto">
							<button type="submit" class="submit_btn_email mail_check_button" 
								id="submit_btn_forID">이메일 전송</button>
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
								id="submit_btn_forAn">인증번호 입력</button>
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
$(".mail_check_button").click(function() {
	
	var email = $("#member_email").val();		// 입력한 이메일
	var checkBox = $(".mail_check_input");	
	var boxdiv = $(".mail_check_input_box");
	$.ajax({
		type : "GET",
		url : "${path}/emailchk?email=" + email,
		success : function(data){
			
			//console.log("data : " + data);
			checkBox.attr("disabled",false)
			boxdiv.attr("id", "mail_check_input_box_true");
			code = data;
		}
	})
	
});
$(".mail_check_input").blur(function() {
	
	var inputCode = $(".mail_check_input").val();			// 입력코드
	var checkResult = $("#submit_btn_forAn_warn");		// 비교 결과
	
	if (inputCode == code) {								// 일치할 경우
		$('.correct_msg').css("display", "inline-block");
		$('.error_msg').css("display", "none");
	}
	else {												// 일치하지 않을 경우
		$('.correct_msg').css("display", "none");
		$('.error_msg').css("display", "inline-block");
	}
	
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
