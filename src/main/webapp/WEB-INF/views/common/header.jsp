<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<!-- JQuery UI -->
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js" defer></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">

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
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- AOS -->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<!-- Hangul -->
<script defer src="https://unpkg.com/type-hangul"></script>
<!-- google maps  -->
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2m6Rp1mtpZoFmdWrCm098wRY05mLnBbw&libraries=places"></script>
<!-- TREEP.css 링크 -->
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" href="${path}/resources/css/login.css">
<link rel="stylesheet" href="${path}/resources/css/mainpage.css">
<link rel="stylesheet" href="${path}/resources/css/mypage.css">
<link rel="stylesheet" href="${path}/resources/css/message.css">
<link rel="stylesheet" href="${path}/resources/css/board.css">
<link rel="stylesheet" href="${path}/resources/css/trip.css">

<!-- TREEP.js 링크 -->
<script defer src="${path}/resources/js/mainpage.js"></script>
<script defer src="${path}/resources/js/mypage.js"></script>
<script defer src="${path}/resources/js/message.js"></script>
<script defer src="${path}/resources/js/board.js"></script>
<script defer src="${path}/resources/js/detailboard.js"></script>
<script defer src="${path}/resources/js/trip.js"></script>
</head>
<body>
	<header>
		<nav class="navbar">
			<div class="navbar-logo">
				<a href="/sns"><img class="navbar-logo__img"
					src="${path}/resources/img/logo.png"></a>
			</div>
			<c:if test="${member == null }">
				<div class="navbar-menu-container">

					<ul class="nav justify-content-end">
						<li class="nav-item br"><a class="nav-item" href="freeboard">커뮤니티</a></li>
					</ul>

					<ul class="nav justify-content-end">
						<li class="nav-item br"><a class="nav-item" href="login">로그인</a></li>
						<li class="nav-item"><a class="nav-item" href="emailcheck">회원가입</a></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${member != null }">
				<div class="navbar-menu-container">
					<ul class="nav">
						<li class="nav-item br"><a class="nav-item" href="maketrip">일정생성</a></li>
						<li class="nav-item br"><a class="nav-item" href="freeboard">커뮤니티</a></li>


						<li class="dropdown">
							<button type="button">
								<i class="fa-regular fa-user navbar-menu__dropdownIcon"></i>
							</button>

							<ul class="dropdown-content">
								<li><a class="dropdown-item" href="mypage"><i
										class="fa-solid fa-address-card icon1"></i> 마이페이지</a></li>
								<li><a class="dropdown-item" href="message"><i
										class="fa-solid fa-paper-plane icon1"></i> 쪽지함 </a></li>
								<li><a class="dropdown-item" href="${path}/logout"> <i
										class="fa-solid fa-id-badge icon1"></i> 로그아웃
								</a></li>
							</ul>

						</li>

					</ul>

				</div>
			</c:if>
		</nav>
	</header>

	<!-- Modal -->