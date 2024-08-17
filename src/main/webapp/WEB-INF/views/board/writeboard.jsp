<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>게시글 작성</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>

	
	<div class="write-container container-md" id="writeboard-container">
		<h4>게시글 작성</h4>
		<hr>
		<div class="option">
			<span class="board"> <select id="board-select" name="board">
					<option value="default">게시판을 선택해 주세요</option>
					<option value="free">자유게시판</option>
					<option value="accompany">동행게시판</option>
			</select>
			</span> <span class="free-category"> <select
				id="free-category-select" name="free-category">
					<option value="default">카테고리를 선택해 주세요</option>
					<option value="talk">잡담</option>
					<option value="information">정보</option>
					<option value="review">후기</option>
			</select>
			</span>
			<!-- <span class="category">
                <select id="category-select" name="category">
                    <option value="default">카테고리를 선택해 주세요</option>
                    <option value="Asia">아시아</option>
                    <option value="Europe">유럽</option>
                    <option value="North America">북아메리카</option>
                    <option value="South America">남아메리카</option>
                    <option value="Africa">아프리카</option>
                    <option value="Oceania">오세아니아</option>
                </select>
            </span> -->
		</div>
		<br>
		<div class="write-title input-group mb-3">
			<input type="text" class="form-control" id="write_title"
				placeholder="제목을 입력해주세요.">
		</div>
		<div class="input-group mb-3" id="upload-container">
			<input type="file" class="form-control" id="write-input-img">
			<label class="input-group-text" for="write-input-img">Upload</label>

			<button id="open-WriteOffcanvas" class="btn">
				<span class="trip-upload-icon">+</span> <span
					class="trip-upload-text"> 여행일정</span>
			</button>
		</div>

		<!-- 여행 일정 추가 오프캔버스 -->
		<div id="write-offcanvas" class="write-offcanvas">
			<div class="write-offcanvas-content" id="write-offcanvas-content">
				<button id="close-WriteOffcanvas" class="btn-close"></button>
				<h4 class="share-place-title">나의 일정</h4>

				<div class="row trip-share-item container-md"
					style="margin-left: 1px;">
					<div class="col-4">
						<img src="img/paris.jpg" id="upload-place-img">
					</div>
					<!-- 텍스트 -->
					<div class="col-8">
						<div class="trip-uplaod-title" id="trip-uplaod-title">여행 이름</div>
						<!-- 장소 -->
						<div>
							<i class="fa-solid fa-location-dot"></i> 자카르타 라야·서울특별시·노스웨스트
						</div>

						<!-- 날짜 -->
						<div class="share-upload-date">
							<i class="fa-regular fa-calendar-days"></i> PLAN ·
							2024.08.09~2024.08.12
						</div>

						<!-- 작성자 -->
						<div class="share-write">
							<img src="img/travel.png" id="share-writepro"><span
								id="writer-name">pdsfsfsdf123</span>
						</div>
					</div>
				</div>

				<div class="row trip-share-item container-md"
					style="margin-left: 1px;">
					<div class="col-4">
						<img src="img/paris.jpg" id="upload-place-img">
					</div>
					<!-- 텍스트 -->
					<div class="col-8">
						<div id="trip-uplaod-title" class="trip-uplaod-title">여행 이름2</div>
						<!-- 장소 -->
						<div>
							<i class="fa-solid fa-location-dot"></i> 자카르타
							라야·서울특fweewfewwefewf별시·노스웨스트
						</div>

						<!-- 날짜 -->
						<div class="share-upload-date">
							<i class="fa-regular fa-calendar-days"></i> PLAN ·
							2024.07.31~2024.08.08
						</div>

						<!-- 작성자 -->
						<div class="share-write">
							<img src="img/travel.png" id="share-writepro"><span
								id="writer-name">pdsfsfsdf123</span>
						</div>
					</div>
				</div>
			</div>

			<!-- 일정 아이템 클릭 상세 보기 -->
			<div id="detail-hidden-sch" style="display: none;">
				<button id="backButton" class="btn"
					style="margin-top: 10px; margin-bottom: 10px;">
					<i class="fa-solid fa-arrow-left"></i>
				</button>
				<div class="container-md" id="tripDetailContent"></div>
			</div>
		</div>
		<div id="tripDetailDisplayContainer" style="display: none;">
			<h2 class="MadeCal">
				UserName의 일정 <i class="fa-regular fa-calendar-days"
					style="color: #7FD858;"></i>
			</h2>
			<div id="trip-items-list"></div>
		</div>

		<div class="write_content">
			<textarea placeholder="내용을 입력해 주세요." id="write-text-container"
				class="form-control"></textarea>
		</div>

		<br>
		<button type="submit" class="btn" id="post-submit">등록</button>
	</div>





</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>