<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<div class="changePW_space">
		<div class="changePW_space_title">
			<p id="changePW_space_title_main">비밀번호 변경</p>
			<p id="changePW_space_title_sub">비밀번호 변경을 위해 정보를 입력하세요.</p>
		</div>
		<form id="pwchange_form" style="width: 100%;" method="post">
			<div class="input_area">
				<label for="InputPassword" class="col-form-label" id="input_text">비밀번호</label>

				<input type="password"
					class="form-control form-control input_text_common mb-2"
					id="inputPw" name="member_pw"> 
					<div class="final_pw_ck">비밀번호를 입력해 주세요.</div>
					<label for="InputPassword"
					class="col-form-label" id="input_text">비밀번호 확인</label> <input
					type="password"
					class="form-control form-control input_text_common mb-2"
					id="inputPwchk">
			</div>
			<div class="final_pwchk_ck">비밀번호 확인을 입력해 주세요.</div>
			<div class="pwck_input_re_1">비밀번호가 일치합니다.</div>
			<div class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</div>
			<div class="input_area">
			<input type="hidden" class="form-control form-control input_text_common mb-2" id="inputemail"  value="<%= request.getParameter("member_email") %>" name="member_email">
				<button type="button" class="btn button_orange signup_btn" id="next_btn">완료</button>
			</div>
		</form>
	</div>
</main>
<script type="text/javascript">
$('#inputPwchk').on("input", function() {
	
	var pw = $('#inputPw').val();
	var pwck = $('#inputPwchk').val();
	$('.final_pwck_ck').css('display', 'none');
	
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }     
	
});
    $(document).ready(function(){
        $(".signup_btn").click(function(){
           
            var pw = $('#inputPw').val();
            var pwchk = $('#inputPwchk').val();
            
            // 비밀번호 유효성 검사
            if (pw == "") {
                $('.final_pw_ck').css('display', 'block');
                pwCheck = false;
            } else {
                $('.final_pw_ck').css('display', 'none');
                pwCheck = true;
            }

            // 비밀번호 확인 유효성 검사
            if (pwchk == "") {
                $('.final_pwchk_ck').css('display','block');
                pwckCheck = false;
            } else if (pw !== pwchk) {
                $('.final_pwchk_ck').css('display', 'block');
                pwckCheck = false;
            } else {
                $('.final_pwchk_ck').css('display', 'none');
                pwckCheck = true;
            }

       
            // 모든 검사가 true일 때 폼 제출
            if (pwCheck && pwckCheck) {
                $("#pwchange_form").attr("action", "/sns/changePW");
                $("#pwchange_form").submit();
            }
        });
    });    
 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
