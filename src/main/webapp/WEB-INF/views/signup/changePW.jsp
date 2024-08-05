<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<div class="changePW_space">
		<div class="changePW_space_title">
			<p id="changePW_space_title_main">비밀번호 변경</p>
			<p id="changePW_space_title_sub">비밀번호 변경을 위해 정보를 입력하세요.</p>
		</div>
		<form style="width: 100%;">

			<div class="input_area">

				<label for="InputPassword" class="col-form-label" id="input_text">비밀번호</label>
				<input type="password"
					class="form-control form-control input_text mb-2"
					id="InputPassword"> <label for="InputPassword"
					class="col-form-label" id="input_text">비밀번호 확인</label> <input
					type="password" class="form-control form-control input_text mb-2"
					id="InputPasswordcheck">
			</div>
			<div class="input_area">
				<button type="submit" class="btn button_orange" id="next_btn">다음</button>
			</div>
		</form>
	</div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
