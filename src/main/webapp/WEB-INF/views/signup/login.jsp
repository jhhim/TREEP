<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<div class="login_form">
        <div class="signup_space_title">
            <p id="login_title_main">로그인</p>
            <p id="login_title_sub">회원가입을 위한 정보를 입력하세요.</p>
        </div>
        <form id=login_form method="post">
            
						<div class="mb-3">
							<label for="in" class="form-label">아이디</label> 
							<input
								type="text" class="form-control input_text_common"
								id="member_id"  name="member_id">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">비밀번호</label>
							<input type="password" class="form-control input_text_common"
								id="member_pw" name="member_pw">
						</div>
						<c:if test="${result == 0}">
						<div class="loginWarn">아이디 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>
						<button type="button" class="button_orange login_btn" id="login_btn">로그인</button>
						<div class="login_text m-3">
							<p>
								<a href="searchid" class="searchID">아이디 /</a> <a href="searchpw"
									class="searchPW">비밀번호 찾기</a>
							</p>
						</div>
						<div class="login_text mt-3">
							<p>
								아직 회원이 아니세요?
								<a class="signup_btn" href="emailcheck">회원가입</a>
							</p>
							<p>or</p>
						</div>
						<div class="hr-sect">소셜 로그인</div>
						 <div class="m-3" id="login_button_container">
                            <button class="login_button" type="button" id="kakao_login_button" 
                            onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=${apiKeys.kakaoClientId}&redirect_uri=${apiKeys.kakaoRedirectUri}&response_type=code'">
                            <img src="${path}/resources/img/login/kakao_btn_logo.png" />
   
                            </button>
                            <button class="login_button" type="button" id="naver_login_button"
                             onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=${apiKeys.naverClientId}&state=1234&redirect_uri=${apiKeys.naverCallback}'">
                            <img  src="${path}/resources/img/login/btnG_아이콘사각.png"/></button>
                            <button class="login_button" type="button" id="google_login_button" onclick="location.href='https://accounts.google.com/o/oauth2/v2/auth?client_id=${apiKeys.googleClientId}&redirect_uri=${apiKeys.googleCallback}&response_type=code&scope=email%20profile%20openid&access_type=offline'">
                            <img src="${path}/resources/img/login/web_light_sq_na@2x.png"/></button>
                        

                        </div>
					</form>
    </div>
    
    <script>
    $(document).ready(function(){
    	var id = $('#member_id').val();
        var pw = $('#member_pw').val();
        var idCheck = false;
        var pwCheck = false;
        if(id == ""){
            
            idCheck = false;
        } else {
           
            idCheck = true;
        }

        // 비밀번호 유효성 검사
        if (pw == "") {
            
            pwCheck = false;
        } else {
  
            pwCheck = true;
        }
        if (idCheck && idckCheck) {
            
            $("#login_form").submit();
        }
    });
    </script>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>