<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<title>게시글 작성</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>

	<form method="post" enctype="multipart/form-data"
		action="${path}/insertboard" id="insert-board-form">

		<div class="write-container container-md" id="writeboard-container"
			name="write-container">
			<h4>게시글 작성</h4>
			<hr>
			<div class="option">
				<span class="board"> <select id="board-select"
					class="board-select" name="board">
						<option value="default">게시판을 선택해 주세요</option>
						<option value="free">자유게시판</option>
						<option value="join">동행게시판</option>
				</select>
				</span> <span class="free-category"> <select
					class="free-category-select" id="free-category-select"
					name="free-category">
						<option value="default">카테고리를 선택해 주세요</option>
						<option value="잡담">잡담</option>
						<option value="정보">정보</option>
						<option value="후기">후기</option>
				</select>
				</span> <span class="category"> <select id="category-select"
					class="category-select" name="join-category">
						<option value="default">카테고리를 선택해 주세요</option>
						<option value="아시아">아시아</option>
						<option value="유럽">유럽</option>
						<option value="북아메리카">북아메리카</option>
						<option value="남아메리카">남아메리카</option>
						<option value="아프리카">아프리카</option>
						<option value="오세아니아">오세아니아</option>
				</select>
				</span>
			</div>
			<br>
			<div class="write-title input-group mb-3">
				<input type="text" class="write_title form-control" id="write_title"
					name="write_title" placeholder="제목을 입력해주세요.">
			</div>
			<div class="input-group mb-3" id="upload-container"
				name="upload-container">
				<input type="file" name="files" class="form-control write-input-img"
					id="write-input-img"> <label class="input-group-text"
					for="write-input-img">Upload</label>

				<button id="open-WriteOffcanvas" class="btn" type="button"
					name="open-WriteOffcanvas">
					<span class="trip-upload-icon">+</span> <span
						class="trip-upload-text"> 여행일정</span>
				</button>
			</div>

			<!-- 여행 일정 추가 오프캔버스 -->
			<div id="write-offcanvas" class="write-offcanvas">
				<div class="write-offcanvas-content" id="write-offcanvas-content">
					<button id="close-WriteOffcanvas" class="btn-close" type="button"
						name="close-WriteOffcanvas"></button>
					<h4 class="share-place-title">나의 일정</h4>



  <c:forEach var="trip" items="${trips}">
        <div class="row trip-share-item container-md"
            style="margin-left: 1px;" onclick="toggleContainer(${trip.trip_no})">
            <div class="col-4">
                <img src="${trip.place_photo_url }" id="upload-place-img"
                    class="upload-place-img">
            </div>
            <!-- 텍스트 -->
            <div class="col-8">
                <div class="trip-uplaod-title" id="trip-uplaod-title">${trip.trip_title}</div>

                <!-- 날짜 -->
                <div class="share-upload-date">
                    <i class="fa-regular fa-calendar-days"></i> PLAN ·
                    ${trip.trip_start}~${trip.trip_end}
                </div>

                <!-- 작성자 -->
                <div class="share-write">
                    <img src="${trip.grade_img}" id="share-writepro"
                        class="share-writepro"><span id="writer-name"
                        class="writer-name-in">${trip.member_nickname }</span>
                </div>
            </div>
        </div>
        <div class="place-item-listcontainer" id="place-item-listcontainer${trip.trip_no}"
        style="display: none">
            <c:forEach var='schedule' items="${trip.schedules}">
                <div>Date: ${schedule.schedule_date}</div>
                <c:forEach var='place' items="${schedule.places}">
                    <li class='place-item-write'>Place: ${place.place_name}</li>
                </c:forEach>
            </c:forEach>
        </div>
    </c:forEach>
					
				</div>
			</div>
			<div id="tripDetailDisplayContainer"
				class="tripDetailDisplayContainer" style="display: none;">
				<h2 class="MadeCal">
					UserName의 일정 <i class="fa-regular fa-calendar-days"
						style="color: #7FD858;"></i>
				</h2>
				<div id="trip-items-list"></div>
			</div>

			<div class="write_content">
				<textarea placeholder="내용을 입력해 주세요." id="write-text-container"
					class="form-control" name="content"></textarea>
			</div>

			<br>
			<button type="submit" class="btn" id="post-submit" name="post-submit">등록</button>
		</div>
	</form>


</main>
<script>
//카테고리 선택 
document.addEventListener('DOMContentLoaded', function () {
    // 페이지 로드 시 초기 상태 설정
    var selected = document.getElementById('board-select').value;
    updateCategoryDisplay(selected);

    // 선택이 변경될 때 상태 업데이트
    document.getElementById('board-select').addEventListener('change', function (event) {
        var selected = document.getElementById('board-select').value;
        updateCategoryDisplay(selected);
    });

    function updateCategoryDisplay(selected) {
        if (selected == "free") {
            document.getElementById('category-select').style.display = "none";
            document.getElementById('free-category-select').style.display = "inline";
        } else if (selected == "join") {
            document.getElementById('free-category-select').style.display = "none";
            document.getElementById('category-select').style.display = "inline";
        } else {
            document.getElementById('category-select').style.display = "none";
            document.getElementById('free-category-select').style.display = "none";
        }
    }

});
// 인풋 값 없을 시 처리
   $('#insert-board-form').on('submit', function(event) {
        let boardSelect = $('#board-select').val();
        let freeCategorySelect = $('#free-category-select').length ? $('#free-category-select').val() : null;
        let categorySelect = $('#category-select').length ? $('#category-select').val() : null;
 		let writeTitle = $('#write_title').val().trim();
        if (boardSelect === 'default') {
            alert('게시판을 선택해 주세요.');
            event.preventDefault();
            return false;
        }
        
        if (boardSelect === 'free' && freeCategorySelect === 'default') {
            alert('카테고리를 선택해 주세요.');
            event.preventDefault();
            return false;
        }
        
        if (boardSelect === 'join' && categorySelect === 'default') {
            alert('카테고리를 선택해 주세요.');
            event.preventDefault();
            return false;
            }
            
            if (writeTitle === '') {
            alert('제목을 입력해 주세요.');
            event.preventDefault();
            return false;
        
        }});


// 오프캔버스 기능 추가
document.addEventListener('DOMContentLoaded', function () {

 
    const openBtn = document.getElementById('open-WriteOffcanvas');
    const closeBtn = document.getElementById('close-WriteOffcanvas');
    const offcanvas = document.getElementById('write-offcanvas');

    openBtn.addEventListener('click', function () {
    console.log("오프캔버스 열기");
        offcanvas.classList.add('show');

        document.addEventListener('click', handleOutsideClick);
    });

    closeBtn.addEventListener('click', function () {
        offcanvas.classList.remove('show');

        document.removeEventListener('click', handleOutsideClick);
    });
    function handleOutsideClick(event) {
        // 오프캔버스와 관련된 요소를 제외한 클릭 감지
        if (!offcanvas.contains(event.target) && !openBtn.contains(event.target)) {
            offcanvas.classList.remove('show');
            document.removeEventListener('click', handleOutsideClick);
        }
    }
});

function toggleContainer(tripNo) {
    const containers = document.querySelectorAll('.place-item-listcontainer');
    console.log(tripNo)
    console.log(`place-item-listcontainer${tripNo}`); // 템플릿 리터럴 사용

    containers.forEach(container => {
        if (container.id === `place-item-listcontainer${tripNo}`) {
            // 현재 클릭된 컨테이너의 상태를 토글합니다.
            container.style.display = container.style.display === 'block' ? 'none' : 'block';
        } else {
            // 다른 모든 컨테이너는 숨깁니다.
            container.style.display = 'none';
            console.log("다숨김")
        }
    });
}



</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>