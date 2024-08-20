<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<div class="mypage-detail">

		<div class="mypage-detail-container">
			<div class="left-panel">
			<div class="mypage-detail-titlePanel">
				<span class="mypage-detail-trip-title">${trip.trip_title}</span>
				<span><button type="button"
							class="btn" id="mypage-detail-share" >공유</button>
				</span>
			</div>
				<div class="mypage-detail-trip-dates">
					<p>
						<strong>시작일 :</strong> ${trip.trip_start}
					</p>
					<p>
						<strong>종료일 :</strong> ${trip.trip_end}
					</p>
				</div>
				<div class="mypage-detail-trip-photo">
					<img src="${trip.place_photo_url}" alt="Place Photo"
						class="mypage-detail-photo">
				</div>
			</div>
			<div class="right-panel">
				<div class="schedules">
					<h2 style="margin-bottom: 20px;">일정</h2>
					<c:forEach var="schedule" items="${trip.schedules}">
						<div class="mypage-schedule">
							<h3 class="mypage-schedule-date">${schedule.schedule_date}</h3>
							<p class="mypage-schedule-content">메모 :
								${schedule.schedule_content}</p>
							<h4>여행지</h4>
							<ul class="mypage-places-list">
								<c:forEach var="place" items="${schedule.places}">
									<li class="mypage-place-item">${place.place_name}</li>
								</c:forEach>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</main>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 현재 페이지의 URL에서 trip_no 파라미터를 추출
    const urlParams = new URLSearchParams(window.location.search);
    const tripNo = urlParams.get('trip_no');
	
    // 공유 버튼 클릭 시 trip_no를 포함한 URL로 이동
    document.getElementById('mypage-detail-share').addEventListener('click', function() {
        if (tripNo) {
            const shareUrl = '${window.location.origin}/sns/share?trip_no='+tripNo;
            window.location.href = shareUrl;
        } else {
            console.error('trip_no parameter is missing in the URL.');
        }
    });
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>