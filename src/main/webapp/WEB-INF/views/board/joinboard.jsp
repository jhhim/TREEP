<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>동행 게시판</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>

	<ul class="MyTabfd">
		<li class="MyTabMenufd MyActivefd"><a href="joinboard">동행게시판</a></li>
		<li class="MyTabMenufd"><a href="freeboard">자유게시판</a></li>
		<li class="MyTabMenufd"><a href="askboard">문의게시판</a></li>
	</ul>

	<!-- <div class="summary-container">
        <p id="summary-icon"><i class="fa-solid fa-house"></i></p>
        <p id="summary-icon"><i class="fa-solid fa-arrow-right"></i></p>
        <p id="summary-icon">
            <select name="" id="" class="boardSelect" onchange="window.open(value,'_self')">
                <option value="FriendBoard.html" selected>동행친구</option>
                <option value="FreeBoard.html">자유게시판</option>
                <option value="AskBoard.html">문의게시판</option>
            </select>
        </p>
    </div> -->

	<div class="title-containerfd">
		<h1 class="titlefd">동행 친구</h1>
	</div>



	<div class="filter-containerfd">
		<button type="button" class="btn filterBtnfd" data-bs-toggle="modal"
			data-bs-target="#filterfd">
			<img src="${path}/resources/img/board/filter.png" class="filterImgfd" alt="">
		</button>


	</div>

	<div class="modal fade modal-lg" id="filterfd"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<form class="MyModalfd">
					<div class="modal-header">
						<h1 class="modal-title fs-5 modal-title-customfd"
							id="exampleModalLabel">TREEP 필터</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" onclick="resetModalfd()"></button>
					</div>



					<div class="modal-body">
						<div class="mb-3 m-2">
							<div style="padding: 15px;">
								<h3>여행 지역을 선택해주세요</h3>
								<p style="color: #9c9c9c;">최대 3개 선택 가능해요</p>
							</div>
							<input type="button" class="locationBtnfd" value="국내"> <input
								type="button" class="locationBtnfd" value="일본"> <input
								type="button" class="locationBtnfd" value="중국"> <input
								type="button" class="locationBtnfd" value="아시아">
							<!-- <input type="button" class="locationBtn" value="미국&캐나다"> -->
							<input type="button" class="locationBtnfd" value="미국"> <input
								type="button" class="locationBtnfd" value="캐나다"> <input
								type="button" class="locationBtnfd" value="중남미"> <input
								type="button" class="locationBtnfd" value="유럽">
							<!-- <input type="button" class="locationBtn" value="중동&아프리카"> -->
							<input type="button" class="locationBtnfd" value="중동"> <input
								type="button" class="locationBtnfd" value="아프리카"> <input
								type="button" class="locationBtnfd" value="남태평양">
						</div>


						<div class="m-2">
							<div style="padding: 15px;">
								<h3>정렬</h3>
							</div>
							<input type="button" class="lineupBtnfd" value="최신순"> <input
								type="button" class="lineupBtnfd" value="조회순"> <input
								type="button" class="lineupBtnfd" value="좋아요순">
						</div>

						<div class="search-containerfd">
							<input type="text" class="searchbarfd" placeholder="검색어를 입력하세요">
							<div class="searchicon-containerfd">

								<i class="fa-solid fa-magnifying-glass searchiconfd"></i>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="resetBtnfd" onclick="resetModalfd()">
							<img src="${path}/resources/img/board/reset.png" class="resetImgfd" alt="">초기화
						</button>
						<button type="button" class="filter-submitBtnfd"
							data-bs-dismiss="modal" onclick="">필터 적용하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div
		class="row row-cols-1 row-cols-xxl-4 row-cols-xl-3 row-cols-lg-2 g-4 cardFormfd">
		<c:forEach var="board" items="${boardPage.boardList}">
			<div class="col card-queryfd">
				<a href="detailboard?kind=${board.board_kind}&no=${board.board_no}">
					<div class="card h-100 card-customfd">
						<div class="card-body h-50 ratio" style="-bs-aspect-ratio: 50%;">
							<img src="${path}/resources/img/board/${board.board_img}"
								class="card-img-top boardImgfd"
								onerror="this.src='/sns/resources/img/board/car1.png'" alt="">
						</div>
						<h5 class="card-titlefd p-3">${board.board_title}</h5>
						<div
							class="col plus-customfd d-flex align-self-end align-item-center m-4">
							<div class="pifd">
								<i class="plusicon-customfd fa-solid fa-plus"></i>
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
			<button type="button"
				onclick="location.href='joinboard?page=${boardPage.currentPage - 1}'"
				${boardPage.currentPage == 1 ? 'disabled' : ''}>«</button>
			<c:forEach var="i" begin="${boardPage.startPage}"
				end="${boardPage.endPage}">
				<button type="button" onclick="location.href='joinboard?page=${i}'"
					class="${boardPage.currentPage == i ? 'active' : ''}">
					${i}</button>
			</c:forEach>
			<button type="button"
				onclick="location.href='joinboard?page=${boardPage.currentPage + 1}'"
				${boardPage.currentPage == boardPage.totalPage ? 'disabled' : ''}>
				»</button>
		</div>
	</div>


</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>