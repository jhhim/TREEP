<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<div class="email_space">
		<div class="email_space_title">
			<p id="email_space_title_main">비밀 번호 찾기</p>
			<p id="email_space_title_sub">TREEP서비스는 이메일 인증을 통해 아이디 찾기을 실시하실 수
				있습니다.</p>
		</div>
		<form style="width: 100%;">
			<div class="input_area col-auto mb-5">
				<div class="input_InputEmail_area">
					<label for="InputID" class="col-form-label" id="input_text">아이디
						입력</label>
					<div class="input_Email" id="signup_space_">

						<input type="text"
							class="form-control form-control-lg input_text mb-2"
							id="InputEmail" maxlength="20" aria-describedby="emailHelp">

					</div>
					<div class="input_area col-auto mb-5">
						<div class="input_InputEmail_area">
							<label for="InputEmail" class="col-form-label" id="input_text">이메일
								입력</label>
							<div class="input_Email" id="signup_space_">

								<input type="text"
									class="form-control form-control-lg input_text mb-2"
									id="InputEmail" maxlength="20" aria-describedby="emailHelp">

								<div class="col-auto">
									<button type="submit" class="submit_btn_email"
										id="submit_btn_forID">이메일 전송</button>
								</div>

							</div>

						</div>
						<div class="input_Authenticationnumber_area">
							<label for="InputEmail" class="col-form-label" id="input_text">인증번호
								입력</label>
							<div class="input_Authenticationnumber" id="signup_space_">

								<input type="text"
									class="form-control form-control-lg input_text mb-2"
									id="InputEmail" maxlength="20" aria-describedby="emailHelp">

								<div class="col-auto">
									<button type="submit" class="submit_btn_email"
										id="submit_btn_forAn">인증번호 입력</button>
								</div>

							</div>
						</div>
					</div>
		</form>
	</div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
