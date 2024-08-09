<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>자유 게시판</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<ul class="MyTab">
		<li class="MyTabMenu"><a href="joinboard">동행게시판</a></li>
		<li class="MyTabMenu MyActive"><a href="freeboard">자유게시판</a></li>
		<li class="MyTabMenu"><a href="askboard">문의게시판</a></li>
	</ul>

	<!-- <div class="summary-container">
        <p id="summary-icon"><i class="fa-solid fa-house"></i></p>
        <p id="summary-icon"><i class="fa-solid fa-arrow-right"></i></p>
        <p id="summary-icon">
            <select name="" id="" class="boardSelect" onchange="window.open(value,'_self')">
                <option value="FriendBoard.html">동행친구</option>
                <option value="FreeBoard.html" selected>자유게시판</option>
                <option value="AskBoard.html">문의게시판</option>
            </select>
        </p>
    </div> -->

	<div class="title-container">
		<h1 class="title">자유게시판</h1>
	</div>

	<div class="filter-container">
		<button type="button" class="btn filterBtn" data-bs-toggle="modal"
			data-bs-target="#filter">
			<img src="${path}/resources/img/board/filter.png" class="filterImg"
				alt="">
		</button>


	</div>

	<div class="modal fade modal-lg" id="filter" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<form class="MyModal">
					<div class="modal-header">
						<h1 class="modal-title fs-5 modal-title-custom"
							id="exampleModalLabel">TREEP 필터</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" onclick="resetModal()"></button>
					</div>



					<div class="modal-body">
						<div class="mb-3">
							<div style="padding: 10px;">
								<h3>게시물 종류</h3>
								<!-- <p style="color: #9c9c9c;">최대 3개 선택 가능해요</p> -->
							</div>
							<input type="button" class="locationBtn" value="잡담"> <input
								type="button" class="locationBtn" value="정보"> <input
								type="button" class="locationBtn" value="후기"> <input
								type="button" class="locationBtn" value="공지사항">
						</div>
						<div>
							<div style="padding: 10px;">
								<h3>정렬</h3>
							</div>
							<input type="button" class="lineupBtn" value="최신순"> <input
								type="button" class="lineupBtn" value="조회순"> <input
								type="button" class="lineupBtn" value="좋아요순">
						</div>

						<div class="search-container">
							<input type="text" class="searchbar" placeholder="검색어를 입력하세요">
							<div class="searchicon-container">

								<i class="fa-solid fa-magnifying-glass searchicon"></i>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="resetBtn" onclick="resetModal()">
							<img src="${path}/resources/img/board/reset.png" class="resetImg"
								alt="">초기화
						</button>
						<button type="button" class="filter-submitBtn"
							data-bs-dismiss="modal" onclick="">필터 적용하기</button>
					</div>


				</form>
			</div>
		</div>
	</div>

	<!-- <div class="search-container">
        <input type="text" class="searchbar" placeholder="검색어를 입력하세요">
        <div class="searchicon-container">

            <i class="fa-solid fa-magnifying-glass searchicon"></i>
        </div>
    </div>

    <div class="continent-container">
        <input type="button" value="아시아" class="continent select_continent_outline">
        <input type="button" value="남아메리카" class="continent">
        <input type="button" value="북아메리카" class="continent">
        <input type="button" value="유럽" class="continent">
        <input type="button" value="오세아니아" class="continent">
        <input type="button" value="아프리카" class="continent">
    </div> -->

	<div
		class="row row-cols-1 row-cols-xxl-4 row-cols-xl-3 row-cols-lg-2 g-4 cardForm">
		<!-- 카드 자리 -->
			<c:forEach var="board" items="${boardPage.boardList}">
				<div class="col card-query">
			<a href="detailboard?kind=1&no=${board.board_no}">
				<div class="card h-100 card-custom">
					<div class="card-body h-25 ratio" style="-bs-aspect-ratio: 50%;">
						<img src="${path}/resources/img/board/${board.board_img}"
							class="card-img-top boardImg"
							onerror="this.src='/sns/resources/img/board/car1.png'" alt="">
					</div>
					<h5 class="card-title p-3">${board.board_title}</h5>
					<div
						class="col plus-custom d-flex align-self-end align-item-center m-4">
						<div class="pi">
							<i class="plusicon-custom fa-solid fa-plus"></i>
						</div>
					</div>
					<div class="card-footer">
						<small class="text-body-secondary d-flex justify-content-between">
							<p class="mb-0">${board.create_date}</p>
							<p class="mb-0">조회수 : ${board.board_hit}</p>
							<p class="mb-0">LIKE : ${board.board_like}</p>
						</small>
					</div>
				</div>
			</a>
		</div>
	</c:forEach>
		
	</div>
<div class="pagination-container">
    <div class="pagination">
        <button 
            type="button" 
            onclick="location.href='freeboard?page=${boardPage.currentPage - 1}'" 
            ${boardPage.currentPage == 1 ? 'disabled' : ''}>
            «
        </button>
        <c:forEach var="i" begin="${boardPage.startPage}" end="${boardPage.endPage}">
            <button 
                type="button" 
                onclick="location.href='freeboard?page=${i}'" 
                class="${boardPage.currentPage == i ? 'active' : ''}">
                ${i}
            </button>
        </c:forEach>
        <button 
            type="button" 
            onclick="location.href='freeboard?page=${boardPage.currentPage + 1}'" 
            ${boardPage.currentPage == boardPage.totalPage ? 'disabled' : ''}>
           »
        </button>
    </div>
</div>
<!-- 	<div class="pagenation-container">
		<div class="pagenation">

			<a href="#">1</a>
		</div>
	</div> -->
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

