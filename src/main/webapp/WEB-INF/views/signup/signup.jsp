<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
<div class="signup_space">
        <div class="signup_space_title">
            <p id="signup_space_title_main">회원가입</p>
            <p id="signup_space_title_sub">회원가입을 위한 정보를 입력하세요.</p>
        </div>
        <form style="width: 100%;" id="signup_form" method="post">
            <div class="input_area">
                <label for="Inputname" class="col-form-label" id="input_text_common">이름</label>
                <input type="text" class="form-control form-control input_text_common mb-2" id="Inputname" name="member_name">
                <div>
                    <label for="InputNICKname" class="col-form-label" id="input_text_common">닉네임</label>
                </div>
                <div class="mb-2" id="signup_space_">
                    <input type="text" class="form-control form-control input_text_common mb-2 InputNICKname"  id="InputNICKname" maxlength="10"
                        aria-describedby="emailHelp" name="member_nickname">
				
                    
                </div>
                <div>
					<div class="nickname_check_re1">사용 가능한 닉네임 입니다.</div>
					<div class="nickname_check_re2">이미 사용중인 닉네임 입니다.</div>
				</div>
                <div>
                    <label for="Inputid" class="col-form-label " id="input_text_common" >아이디</label>
                </div>
                <div class="input_ID" id="signup_space_">
                    
                    <input type="text" class="form-control form-control input_text_common mb-2 Inputid"  id="Inputid" maxlength="20"
                        aria-describedby="emailHelp" name="member_id">

                   

                </div>
                <div>
					<div class="id_check_re1">사용 가능한 아이디 입니다.</div>
					<div class="id_check_re2">이미 사용중인 아이디 입니다.</div>
				</div>
            </div>
            <div class="input_area">
                
                

                <label for="InputPassword" class="col-form-label" id="input_text_common">비밀번호</label>
                <input type="password" class="form-control form-control input_text_common mb-2"  name="member_pw">


                <label for="InputPassword" class="col-form-label" id="input_text_common">이메일</label>
                <input type="text" class="form-control form-control input_text_common mb-2" name="member_email">
                
            </div>
            <div>
                <label for="InputGender" class="col-form-label" id="input_text_common">성별</label>
            </div>
            <div class="memberGender_input">
                <div class="signup_gender">
                <input type="radio" class="gender_check"   id="male"  checked name="member_gender" value='M'>
                <label class="gender_check_male" for="male">남성</label>
                </div>
                <div class="signup_gender">
                <input type="radio" class="gender_check"   id="female"  name="member_gender" value='F'>
                <label class="gender_check_female" for="female">여성</label>
            </div>
            </div>
            
            <div>
                <label for="InputPhone" class="col-form-label" id="input_text_common">전화번호</label>
            </div>
            <div class="memberPhone_input">
                <div class="memberPhoneNumber_input">
                    <input type="tel" class="form-control form-control-lg input_text_common mb-2" id="InputPhone" name="member_phone">
                </div>
            </div>
            <div>
                <label for="InputBirth" class="col-form-label" id="input_text_common">생년월일</label>
            </div>
            <div class="InputBirth_div">
                <input type="date" name="member_birth" class="p-4 memberBirthDate">
            </div>
            <div class="input_area">
            <button type="submit" class="btn button_orange signup_btn" id="signup_btn">다음</button>
            </div>
        </form>
    </div>
</main>
<script>
$(document).ready(function(){
	$(".signup_btn").click(function(){
	
	$("#signup_form").attr("action", "/sns/signupinfo");	
	$("#signup_form").submit();
		
	});
});
$('.InputNICKname').on("input", function() {
	console.log("keyup 테스트");
	var member_nickname = $('.InputNICKname').val();	
	var data = {'member_nickname' : member_nickname}
	if (!member_nickname) {
		 $('.nickname_check_re1').css("display", "none");
		 $('.nickname_check_re2').css("display", "none");
	      return;
	    }
	$.ajax({
		type : "post",
		url : "${path}/signinfo/memberNicknameChk",
		data : data,
		success: function(result){
		if (result != 'fail') {
			$('.nickname_check_re1').css("display", "inline-block");
			$('.nickname_check_re2').css("display", "none");				
		} else {
			$('.nickname_check_re2').css("display","inline-block");
			$('.nickname_check_re1').css("display", "none");	
		}
	}
	});
});

	
$('.Inputid').on("input", function() {
		console.log("keyup 테스트");
		var member_id = $('.Inputid').val();// .Inputid에 입력되는 값
		
		 if (!member_id) {
			 $('.id_check_re1').css("display", "none");
			 $('.id_check_re2').css("display", "none");
		      return;
		    }
		
		var data = {'member_id' : member_id}		// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "${path}/signinfo/memberIdChk",
			data : data,
			success: function(result){
			if (result != 'fail') {
				$('.id_check_re1').css("display", "inline-block");
				$('.id_check_re2').css("display", "none");				
			} else {
				$('.id_check_re2').css("display","inline-block");
				$('.id_check_re1').css("display", "none");	
			}
		}
		});
	});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

