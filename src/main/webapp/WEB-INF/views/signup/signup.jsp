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
                <div class="final_name_ck">이름을 입력해 주세요.</div>
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
					<div class="final_nickname_ck">닉네임을 입력해 주세요.</div>
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
					<div class="final_id_ck">아이디를 입력해 주세요.</div>
				</div>
            </div>
            <div class="input_area">
                
                
                <input type="hidden" class="form-control form-control input_text_common mb-2" id="inputemail"  value="<%= request.getParameter("member_email") %>" name="member_email">
				
                <label for="InputPassword" class="col-form-label" id="input_text_common">비밀번호</label>
                <input type="password" class="form-control form-control input_text_common mb-2" id="inputPw"  name="member_pw">
				<div class="final_pw_ck">비밀번호를 입력해 주세요.</div>
				<label for="InputPassword" class="col-form-label" id="input_text_common">비밀번호 확인</label>
                <input type="password" class="form-control form-control input_text_common mb-2" id="inputPwchk"  name="member_pwchk">
                <div class="final_pwchk_ck">비밀번호 확인을 입력해 주세요.</div>
                <div class="pwck_input_re_1">비밀번호가 일치합니다.</div>
                <div class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</div>
                
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
            <div class="final_phone_ck">전화번호를 입력해 주세요.</div>
            <div>
                <label for="InputBirth" class="col-form-label" id="input_text_common">생년월일</label>
            </div>
            <div class="InputBirth_div">
                <input type="date" name="member_birth" class="p-4 memberBirthDate" id="inputbirth">
            </div>
            <div class="final_birth_ck">생년월일 입력해 주세요.</div>
            <div class="input_area">
            <button type="button" class="btn button_orange signup_btn" id="signup_btn">다음</button>
            </div>
        </form>
    </div>
</main>
<script>
var idCheck = false;
var idckCheck = false;          // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;          // 비번 확인
var pwckcorCheck = false;       // 비번 확인 일치 확인
var nameCheck = false;
var nicknameCheck = false;
var nicknamechkCheck = false;
var phoneCheck =false;
var birthCheck = false;




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
			nicknamechkCheck = true;
		} else {
			$('.nickname_check_re2').css("display","inline-block");
			$('.nickname_check_re1').css("display", "none");
			nicknamechkCheck = false;
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
				idckCheck = true;
			} else {
				$('.id_check_re2').css("display","inline-block");
				$('.id_check_re1').css("display", "none");	
				idckCheck = false;
			}
		}
		});
	});
// 유효성 검사
$(document).ready(function(){
    $(".signup_btn").click(function(){
        var id = $('#Inputid').val();
        var pw = $('#inputPw').val();
        var pwchk = $('#inputPwchk').val();
        var name = $('#Inputname').val();
        var nickname = $('#InputNICKname').val();
        var phone = $('#InputPhone').val();
        var birth = $('#inputbirth').val();
        
        // 아이디 유효성 검사
        if(id == ""){
            $('.final_id_ck').css('display', 'block');
            idCheck = false;
        } else {
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }

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

        // 이름 유효성 검사
        if (name == "") {
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        } else {
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }

        // 닉네임 유효성 검사
        if (nickname == "") {
            $('.final_nickname_ck').css('display','block');
            nicknameCheck = false;
        } else {
            $('.final_nickname_ck').css('display', 'none');
            nicknameCheck = true;
        }

        // 전화번호 유효성 검사
        if (phone == "") {
            $('.final_phone_ck').css('display','block');
            phoneCheck = false;
        } else {
            $('.final_phone_ck').css('display', 'none');
            phoneCheck = true;
        }

        // 생년월일 유효성 검사
        if (birth == "") {
            $('.final_birth_ck').css('display','block');
            birthCheck = false;
        } else {
            $('.final_birth_ck').css('display', 'none');
            birthCheck = true;
        }

        // 모든 검사가 true일 때 폼 제출
        if (idCheck && idckCheck && pwCheck && pwckCheck && pwckcorCheck && nameCheck && nicknameCheck && nicknamechkCheck && phoneCheck && birthCheck) {
            $("#signup_form").attr("action", "/sns/signupinfo");
            $("#signup_form").submit();
        }
    });
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

