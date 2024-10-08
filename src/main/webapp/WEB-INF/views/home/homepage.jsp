<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>TREEP</title>
<script>
	const basePath = "${path}";
</script>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main class="container-fluid">
	<section class="main-banner">
		<div class="main-banner-wrap">
			<div class="main-banner-left">
				<h1>당신의 여행을 계획해보세요!</h1>
				<button class="Treep-btn" onclick="addSearch()">TREEP 바로가기</button>
				<div class="search-place">
					<div class="search-place-wrap">
						<i class="fa-solid fa-magnifying-glass"></i> <input
							class="search-place-nav" type="text" placeholder="여행지를 선택해주세요.">
					</div>
					<div class="search-place-box">
						<div class="search-place-scroll"></div>
					</div>
				</div>
			</div>
			<div class="main-banner-right">

				<img class="main-banner-plane"
					src="${path}/resources/img/mainpage/plane1.png" alt="">

			</div>
		</div>
	</section>

	<!-- 모달 -->
	<div class="modal" id="detail-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content container-fluid detail-modal-content">
				<div class="modal-header detail-modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body detail-modal-body row">
					<div class="detail-modal-left col-6">
						<span id="modal-city-country"></span>
						<h1 id="modal-city-name"></h1>
						<p id="modal-city-info"></p>
						<button class="make-plan-btn" onclick="redirectToMaketrip()">
        일정 만들기 <i class="fa-solid fa-chevron-right"></i>
    </button>
					</div>
					<div class="detail-modal-right col">
						<img id="modal-city-image" src="" alt="City Image">
					</div>
				</div>
			</div>
		</div>
	</div>


	<section class="main-place">
		<h1>TREEP PICK!</h1>
		<nav class="main-place-nav">
			<ul>
				<li><a class="place-category category-selected">전체</a></li>
				<li><a class="place-category">국내</a></li>
				<li><a class="place-category">해외</a></li>
			</ul>
		</nav>
		<div style="width: 85%; margin: auto;">
			<div class="card-wrap responsive recommend">
				<article class="main-card">

				</article>
			</div>
			<div class="section-btn">
				<button class="recommend-prev-btn prev-btn">
					<i class="fa-solid fa-caret-left"></i>
				</button>
				<button class="recommend-next-btn next-btn">
					<i class="fa-solid fa-caret-right"></i>
				</button>
			</div>
		</div>
	</section>
	<section class="main-ad">
		<div class="main-ad-header row" data-aos="fade-right"
			data-aos-duration="3500" data-aos-delay="50">
			<img src="${path}/resources/img/mainpage/icon_1.png" alt="">
			<div class="ad-header-text">
				<h1>TREEP과 함께하는</h1>
				<h1>최신 여행 정보</h1>
				<h3>여행 계획을 세우기 막막할 때,</h3>
				<h3>TREEP으로 일정을 공유하고 도움을 받아보세요.</h3>
			</div>
		</div>
		<div class="ad-together ad-wrap row" data-aos="fade-up"
			data-aos-duration="3500" data-aos-delay="50">
			<div class="ad-text col">
				<h2>여행 계획</h2>
				<p>소중한 가족, 친구와 함께 여행을 계획하고</p>
				<p>일정을 공유할 수 있어요.</p>
			</div>
			<div class="ad-together-bubble ad-bubble ad-right-bubble col-5">
				<i class="fa-solid fa-quote-left"></i>
				<p id="together-type">TREEP에서 우리들의 여행 계획을 세워보자 !</p>
				<i class="fa-solid fa-quote-right"></i>
			</div>
		</div>
		<div class="ad-board ad-wrap row" data-aos="fade-up"
			data-aos-duration="3500" data-aos-delay="50">
			<div class="ad-board-bubble ad-bubble ad-left-bubble col-5">
				<i class="fa-solid fa-quote-left"></i>
				<p id="board-type">지금 삿포로에 눈이 많이 오나요 ?</p>
				<i class="fa-solid fa-quote-right"></i>
			</div>
			<div class="ad-text col">
				<h2>여행 정보 공유</h2>
				<p>TREEP 회원들과 함께</p>
				<p>여행지 최신 정보를 공유할 수 있어요.</p>
			</div>

		</div>
		<div class="ad-join ad-wrap row" data-aos="fade-up"
			data-aos-duration="3500" data-aos-delay="100">
			<div class="ad-text col">
				<h2>여행 동행</h2>
				<p>여행을 공유하고</p>
				<p>동행 친구를 구해 일정을 함께 할 수 있어요.</p>
			</div>
			<div class="ad-join-bubble ad-bubble ad-right-bubble col-5">
				<i class="fa-solid fa-quote-left"></i>
				<p id="join-type">광안리에서 조개구이 드실 분 계시나요 ?</p>
				<i class="fa-solid fa-quote-right"></i>
			</div>
		</div>

	</section>

	<section class="main-ad-banner">
		<a href="" class="ad-banner-wrap">
			<div class="ad-banner-text">

				<h2>🎉 여행 일정을 공유하고 스타벅스 기프티콘을 받자! 🎉</h2>
				<p>여행을 준비하며 설렘 가득한 당신! ✈️🗺️</p>
				<p>이제 그 행복을 친구들과 나누고, 스타벅스 기프티콘까지 챙겨가세요! ☕️🎁</p>

			</div>
			<div class="ad-banner-img">
				<img src="${path}/resources/img/mainpage/starbucks.png" alt="">
			</div>
		</a>
	</section>

	<!-- <section class="main-review">
            <div class="main-review-wrap">
                <div class="review-banner">

                </div>
                <div class="review-banner">

                </div>
                <div class="review-banner">
 
                </div>
            </div>
        </section> -->
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
