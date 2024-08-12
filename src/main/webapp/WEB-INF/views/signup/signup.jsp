<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                    <input type="text" class="form-control form-control input_text_common mb-2"  id="InputNICKname" maxlength="10"
                        aria-describedby="emailHelp" name="member_nickname">

                    <div class="col-auto">
                        <button type="submit" class="btn ms-2 button_orange mb-2" id="submit_btn_forname">확인</button>
                    </div>
                </div>
                <div>
                    <label for="Inputid" class="col-form-label " id="input_text_common" >아이디</label>
                </div>
                <div class="input_ID" id="signup_space_">
                    
                    <input type="text" class="form-control form-control input_text_common mb-2"  id="Inputid" maxlength="20"
                        aria-describedby="emailHelp" name="member_id">

                    <div class="col-auto">
                        <button type="submit" class="btn ms-2 button_orange mb-2" id="submit_btn_forID" >확인</button>
                    </div>

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

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

