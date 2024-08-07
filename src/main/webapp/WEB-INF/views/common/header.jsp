<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<!-- slick -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script defer="defer" type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script defer src="https://kit.fontawesome.com/457d4d2300.js"
	crossorigin="anonymous"></script>
<script defer
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- AOS -->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<!-- Hangul -->
<script defer src="https://unpkg.com/type-hangul"></script>

<!-- TREEP.css 링크 -->
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" href="${path}/resources/css/login.css">
<link rel="stylesheet" href="${path}/resources/css/mainpage.css">
<link rel="stylesheet" href="${path}/resources/css/signup.css">
<link rel="stylesheet" href="${path}/resources/css/mypage.css">
<!-- TREEP.js 링크 -->
<script defer src="${path}/resources/js/mainpage.js"></script>
<script defer src="${path}/resources/js/mypage.js"></script>
</head>
<body>
	<header>
		<nav class="navbar">
			<div class="navbar-logo">
				<a href="/sns"><img class="navbar-logo__img"
					src="${path}/resources/img/logo.png"></a>
			</div>

			 <div class="navbar-menu-container">
              
              <ul class="nav justify-content-end">
              <li class="nav-item br"><a class="nav-item" href="">커뮤니티</a></li>
            </ul>
              
              <ul class="nav justify-content-end">
              <li class="nav-item br"><a class="nav-item" href="#" data-bs-toggle="modal" data-bs-target="#loginmodal">로그인</a></li>
              <li class="nav-item"><a class="nav-item" href="signup">회원가입</a></li>
              </ul>
            </div> 

	<!-- 		<div class="navbar-menu-container">
				<ul class="nav">
					<li class="nav-item br"><a class="nav-item" href="">커뮤니티</a></li>


					<li class="dropdown">
						<button type="button">
							<i class="fa-regular fa-user navbar-menu__dropdownIcon"></i>
						</button>

						<ul class="dropdown-content">
							<li><a class="dropdown-item" href="mypage"><i
									class="fa-solid fa-address-card icon1"></i> 마이페이지</a></li>
							<li><a class="dropdown-item" href=""><i
									class="fa-solid fa-paper-plane icon1"></i> 쪽지함 </a></li>
							<li><a class="dropdown-item" href=""> <i
									class="fa-solid fa-id-badge icon1"></i> 로그아웃
							</a></li>
						</ul>

					</li>

				</ul>

			</div> -->
		</nav>
	</header>

	<!-- Modal -->
	<div class="modal fade" id="loginmodal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<form>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">아이디</label> <input
								type="email" class="form-control input_text_common"
								id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">비밀번호</label>
							<input type="password" class="form-control input_text_common"
								id="exampleInputPassword1">
						</div>
						<button type="submit" class="button_orange" id="summit_button">로그인</button>
						<div class="login_text m-3">
							<p>
								<a href="searchid" class="searchID">아이디 /</a> <a href="searchpw"
									class="searchPW">비밀번호 찾기</a>
							</p>
						</div>
						<div class="login_text mt-3">
							<p>
								아직 회원이 아니세요?
								<button class="signup_btn" href="./signup.html">회원가입</button>
							</p>
							<p>or</p>
						</div>
						<div class="hr-sect">소셜 로그인</div>
						<div class="m-3" id="login_button_container">
							<img class="login_button m-4" id="kakao_login_button"
								src="${path}/resources/img/login/kakao_btn_logo.png"></img> <img
								class="login_button m-4" id="naver_login_button"
								src="${path}/resources/img/login/btnG_아이콘사각.png" href=""></img>
							<img class="login_button m-4" id="google_login_button"
								src="${path}/resources/img/login/web_light_sq_na@2x.png" href=""></img>
							<img class="login_button m-4" id="fb_login_button"
								src="${path}/resources/img/login/fb_loginbtn.png" />
						</div>
					</form>


				</div>
			</div>
		</div>
	</div>