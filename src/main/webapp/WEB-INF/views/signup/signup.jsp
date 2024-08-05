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
        <form style="width: 100%;">
            <div class="input_area">
                <label for="Inputname" class="col-form-label" id="input_text_common">이름</label>
                <input type="text" class="form-control form-control input_text_common mb-2" id="InputNickname">
                <div>
                    <label for="InputNICKname" class="col-form-label" id="input_text_common">닉네임</label>
                </div>
                <div class="mb-2" id="signup_space_">
                    <input type="text" class="form-control form-control input_text_common mb-2"  id="InputNICKname" maxlength="10"
                        aria-describedby="emailHelp">

                    <div class="col-auto">
                        <button type="submit" class="btn ms-2 button_orange mb-2" id="submit_btn_forname">확인</button>
                    </div>
                </div>
                <div>
                    <label for="Inputid" class="col-form-label " id="input_text_common" >아이디</label>
                </div>
                <div class="input_ID" id="signup_space_">
                    
                    <input type="text" class="form-control form-control input_text_common mb-2" in id="Inputid" maxlength="20"
                        aria-describedby="emailHelp">

                    <div class="col-auto">
                        <button type="submit" class="btn ms-2 button_orange mb-2" id="submit_btn_forID" >확인</button>
                    </div>

                </div>
            </div>
            <div class="input_area">
                
                

                <label for="InputPassword" class="col-form-label" id="input_text_common">비밀번호</label>
                <input type="password" class="form-control form-control input_text_common mb-2" id="InputPassword">


                <label for="InputPassword" class="col-form-label" id="input_text_common">비밀번호 확인</label>
                <input type="password" class="form-control form-control input_text_common mb-2" id="InputPasswordcheck">
                
            </div>
            <div>
                <label for="InputGender" class="col-form-label" id="input_text_common">성별</label>
            </div>
            <div class="memberGender_input">
                <div class="signup_gender">
                <input type="radio" class="gender_check" name="options-base"  id="male" autocomplete="off" checked>
                <label class="gender_check_male" for="male">남성</label>
                </div>
                <div class="signup_gender">
                <input type="radio" class="gender_check" name="options-base"  id="female" autocomplete="off">
                <label class="gender_check_female" for="female">여성</label>
            </div>
            </div>
            
            <div>
                <label for="InputPhone" class="col-form-label" id="input_text_common">전화번호</label>
            </div>
            <div class="memberPhone_input">
                <div class="memberPhoneNumber_input">
                    <input type="tel" class="form-control form-control-lg input_text_common mb-2" id="InputPhone">
                </div>
            </div>
            <div>
                <label for="InputBirth" class="col-form-label" id="input_text_common">생년월일</label>
            </div>
            <div class="InputBirth_div">
                <input type="date" name="memberBirthDate" class="p-4 memberBirthDate">
            </div>
            <div class="input_area">
            <button type="submit" class="btn button_orange" id="next_btn">다음</button>
            </div>
        </form>
    </div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
