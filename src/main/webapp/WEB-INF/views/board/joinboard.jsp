<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
LocalDate today = LocalDate.now();
pageContext.setAttribute("today", today.toString());
%>
<title>동행 게시판</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>

	<ul class="MyTabfd">
		<li class="MyTabMenufd MyActivefd"><a href="joinboard">동행게시판</a></li>
		<li class="MyTabMenufd"><a href="freeboard">자유게시판</a></li>
		<li class="MyTabMenufd"><a href="askboard">문의게시판</a></li>
	</ul>
	<div class="title-containerfd">
		<h1 class="titlefd">동행 친구</h1>
	</div>



	<div class="filter-containerfd">
		<button type="button" class="btn filterBtnfd" data-bs-toggle="modal"
			data-bs-target="#filterfd">
			<img src="${path}/resources/img/board/filter.png" class="filterImgfd"
				alt="">
		</button>


	</div>

	<div class="modal fade modal-lg" id="filterfd"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<form class="MyModalfd" method="post" action="joinfilterboard">
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
							<input type="checkbox" class="locationBtnfd" id="domestic"
								name="location" value="국내" /> <label for="domestic"
								class="locationBtnfdChk">국내</label> <input type="checkbox"
								class="locationBtnfd" id="japan" name="location" value="일본" />
							<label for="japan" class="locationBtnfdChk">일본</label> <input
								type="checkbox" class="locationBtnfd" id="china" name="location"
								value="중국" /> <label for="china" class="locationBtnfdChk">중국</label>

							<input type="checkbox" class="locationBtnfd" id="asia"
								name="location" value="아시아" /> <label for="asia"
								class="locationBtnfdChk">아시아</label> <input type="checkbox"
								class="locationBtnfd" id="usa" name="location" value="미국" /> <label
								for="usa" class="locationBtnfdChk">미국</label> <input
								type="checkbox" class="locationBtnfd" id="canada"
								name="location" value="캐나다" /> <label for="canada"
								class="locationBtnfdChk">캐나다</label> <input type="checkbox"
								class="locationBtnfd" id="latinAmerica" name="location"
								value="중남미" /> <label for="latinAmerica"
								class="locationBtnfdChk">중남미</label> <input type="checkbox"
								class="locationBtnfd" id="europe" name="location" value="유럽" />
							<label for="europe" class="locationBtnfdChk">유럽</label> <input
								type="checkbox" class="locationBtnfd" id="middleEast"
								name="location" value="중동" /> <label for="middleEast"
								class="locationBtnfdChk">중동</label> <input type="checkbox"
								class="locationBtnfd" id="africa" name="location" value="아프리카" />
							<label for="africa" class="locationBtnfdChk">아프리카</label> <input
								type="checkbox" class="locationBtnfd" id="pacific"
								name="location" value="남태평양" /> <label for="pacific"
								class="locationBtnfdChk">남태평양</label>
						</div>


						<div class="m-2">
							<div style="padding: 15px;">
								<h3>정렬</h3>
							</div>
							<input type="radio" class="lineupBtnfd" id="latest"
								name="sortOrder" value="최신순" /> <label for="latest"
								class="lineupBtnfd">최신순</label> <input type="radio"
								class="lineupBtnfd" id="viewCount" name="sortOrder" value="조회순" />
							<label for="viewCount" class="lineupBtnfd">조회순</label> <input
								type="radio" class="lineupBtnfd" id="likes" name="sortOrder"
								value="좋아요순" /> <label for="likes" class="lineupBtnfd">좋아요순</label>
						</div>

						<div class="search-containerfd">
							<input type="text" class="searchbarfd" name="searchText"
								placeholder="검색어를 입력하세요">
							<div class="searchicon-containerfd">

								<i class="fa-solid fa-magnifying-glass searchiconfd"></i>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="resetBtnfd" onclick="resetModalfd()">
							<img src="${path}/resources/img/board/reset.png"
								class="resetImgfd" alt="">초기화
						</button>
						<button type="submit" class="filter-submitBtnfd"
							data-bs-dismiss="modal" onclick="">필터 적용하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${empty boardPage.boardList}">
			<div class="col-12 text-center board-noboard">
				<h2>검색 결과가 존재하지 않습니다.</h2>
			</div>
		</c:when>
		<c:otherwise>
			<div
				class="row row-cols-1 row-cols-xxl-4 row-cols-xl-3 row-cols-lg-2 g-4 cardFormfd">
				<c:forEach var="board" items="${boardPage.boardList}">
					<div class="col card-queryfd">
						<a
							href="detailboard?no=${board.board_no}">
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
									<small
										class="text-body-secondary d-flex justify-content-between">
										<p class="mb-0">
											<c:choose>
												<c:when
													test="${fn:substring(board.create_date, 0, 10) eq today}">
													<p class="mb-0">${fn:substring(board.create_date, 11, 16)}</p>
												</c:when>
												<c:otherwise>
													<p class="mb-0">${fn:substring(board.create_date, 0, 10)}</p>
												</c:otherwise>
											</c:choose>
										</p>

										<p class="mb-0">조회수 : ${board.board_hit}</p>
										<p class="mb-0">LIKE : <span id="boardLikeCount"></span></p>
									</small>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>


	<div class="pagination-container">
				<div class="d-flex justify-content-center">
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
	</div>
		</c:otherwise>
	</c:choose>

</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>