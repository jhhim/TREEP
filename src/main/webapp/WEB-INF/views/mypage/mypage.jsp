<%@page import="java.time.LocalDate"%>
<%@page import="com.ss.sns.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	LocalDate today = LocalDate.now();
	pageContext.setAttribute("today", today.toString());
%>

<script>
const MypageBasePath = "${path}";
</script>


<title>마이 페이지</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<!-- 프로필 배경,사진 -->
	<div class="profile-background">
		<div class="profile-img-container">
			<img src="${path}/resources/img/mypage/${img}" class="profile-img"></img>
		</div>
	</div>

	<div class="profile-content-container container-md">
		<!-- 프로필 이름, 정보 관리 -->
		<div class="profile_info container-md">

			<div class="profile_nickname">${nickname }</div>
			<!-- 마이페이지 설정으로 이동 -->
			<a href="profile" class="profile_manage"> <span>프로필 관리</span> <img
				src="${path}/resources/img/mypage/setting.png" class="setting_icon">
			</a>
		</div>
	</div>
	<!-- 나의 일정(전체 일정, 공유된 일정)-->
	<div class="schedule container-md">
		<h4 style="text-align: center;">
			나의 일정 <i class="fa-regular fa-calendar-days"></i>
		</h4>
		<br>
		<div class="schedule-container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home" type="button" role="tab"
						aria-controls="home" aria-selected="true">전체 일정</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile" type="button" role="tab"
						aria-controls="profile" aria-selected="false">공유된 일정</button>
				</li>
			</ul>
			<br>


			<div class="tab-content" id="myTabContent">
				<!-- 전체 일정-->
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<c:forEach var="trip" items="${trips}">
						<div class="row list-schedule">
							<!--전체 일정 사진 -->
							<div class="col-3 list-schedule-img-container">
								<img src="${trip.place_photo_url}"
									class="img-fluid list-schedule-img">
							</div>
							<!--전체 일정 세부사항-->
							<div class="col-9 list-schedule-content">
           <div> <span class="schedule-DDay" data-start="${trip.trip_start}" id="d-day-${trip.trip_no}">
									
								</span> <span class="schedule-title"> ${trip.trip_title}</span> </div>
								<span
									class="schedule-manage dropdown">
									<button class="btn dropdown-toggle no-arrow" type="button"
										data-bs-toggle="dropdown" aria-expanded="false">⋮</button>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">공유</a></li>
										<li><a class="dropdown-item" href="#">수정</a></li>
										<li><a class="dropdown-item" href="#">삭제</a></li>
									</ul>
								</span>								
								<div class="schedule-period">${trip.trip_start}~${trip.trip_end}</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- 공유된 일정 -->
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">추가 예정</div>
			</div>
		</div>
	</div>

	<!-- 나의 활동(작성한 게시글)-->
	<div class="activity container-md">
		<h4 style="text-align: center;">
			나의 활동 <i class="fa-regular fa-pen-to-square"></i>
		</h4>
		<br>
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
					data-bs-target="#write" type="button" role="tab"
					aria-controls="home" aria-selected="true">작성글</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="like-tab" data-bs-toggle="tab"
					data-bs-target="#likePost" type="button" role="tab"
					aria-controls="liketab" aria-selected="false">좋아요한 글</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<!-- 작성글 테이블 -->
			<div class="tab-pane fade show active" id="write" role="tab"
				aria-labelledby="write-tab">
				<br>
				<table class="table">
					<thead>
						<tr>
					
							<th scope="col">글번호</th>
							<th scope="col">게시판</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody class="table-group-divider" id="writeTbody">

					<c:forEach var="write" items="${myPage.boardList }">
							<tr>
								
								<th scope="row">${write.board_no }</th>
								<td>${write.board_type }</td>
								<td style="width: 40%;"><a href="detailboard?kind=${write.board_kind}&no=${write.board_no}" >${write.board_title }</a></td>
								
								<td>
									<c:choose>
										<c:when
											test="${fn:substring(write.create_date, 0, 10) eq today}">
											<fmt:parseDate value="${write.create_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
											 <fmt:formatDate pattern="HH:mm" value="${parsedDateTime}"/>
										</c:when>
										<c:otherwise>
											 <fmt:parseDate value="${write.create_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
											 <fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${write.board_hit }</td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
				<div class="activity-manage">
					<a href="${path}/writeboard"><button type="button" class="btn" id="mypage-write">글쓰기</button></a>
					
				</div>



				<nav aria-label="Page navigation example">
					<ul class="pagination" id="note-pagination">
						<li class="page-item">
							<button type=button class="page-link"
								onclick="location.href='mypage?page=${myPage.currentPage -1 }'"
								${myPage.currentPage == 1 ? 'disabled' : ''}
								aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</button>
						</li>
						<c:forEach var="i" begin="${myPage.startPage}"
							end="${myPage.endPage }">
							<li class="page-item"><button type="button"
									class="page-link ${myPage.currentPage == i ? 'active' : '' }"
									onclick="location.href='mypage?page=${i}'">${i}</button></li>
						</c:forEach>


						<li class="page-item">
							<button type=button class="page-link"
								onclick="location.href='mypage?page=${myPage.currentPage +1 }'"
								${myPage.currentPage == myPage.totalPage ? 'disabled' : ''}
								aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</button>
						</li>
					</ul>
				</nav>

			</div>


<!-- 내가 좋아요 누른 글 -->

			<div class="tab-pane fade" id="likePost" role="tabpanel"
				aria-labelledby="like-p">

				<br>
				<table class="table">
					<thead>
						<tr>
							
							<th scope="col">글번호</th>
							<th scope="col">게시판</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">

									
					<c:forEach var="Like" items="${myPageLike.boardList }">
						<tr>
							
							<th scope="row">${Like.board_no }</th>
							<td>${Like.board_type }</td>
							<td>${Like.member_nickname }</td>
							<td style="width: 40%;"><a href="detailboard?kind=${Like.board_kind}&no=${Like.board_no}" >${Like.board_title }</a></td>
							<td>
									<c:choose>
										<c:when
											test="${fn:substring(Like.create_date, 0, 10) eq today}">
											<fmt:parseDate value="${Like.create_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
											 <fmt:formatDate pattern="HH:mm" value="${parsedDateTime}"/>
										</c:when>
										<c:otherwise>
											 <fmt:parseDate value="${Like.create_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
											 <fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}"/>
										</c:otherwise>
									</c:choose>
								</td>
							<td>${Like.board_hit }</td>
						</tr>
					</c:forEach> 
						
					</tbody>
				</table>
				<div class="activity-manage">
					<a href="${path}/writeboard"><button type="button" class="btn" id="mypage-write">글쓰기</button></a>
				
				</div>
				
				<nav aria-label="Page navigation example">
					<ul class="pagination" id="note-pagination">
						<li class="page-item">
							<button type=button class="page-link"
								onclick="location.href='mypage?page2=${myPageLike.currentPage -1 }'"
								${myPageLike.currentPage == 1 ? 'disabled' : ''}
								aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</button>
						</li>
						<c:forEach var="i" begin="${myPageLike.startPage}"
							end="${myPageLike.endPage }">
							<li class="page-item"><button type="button"
									class="page-link ${myPageLike.currentPage == i ? 'active' : '' }"
									onclick="location.href='mypage?page2=${i}'">${i}</button></li>
						</c:forEach>


						<li class="page-item">
							<button type=button class="page-link"
								onclick="location.href='mypage?page2=${myPageLike.currentPage +1 }'"
								${myPageLike.currentPage == myPageLike.totalPage ? 'disabled' : ''}
								aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</button>
						</li>
					</ul>
				</nav>
				
			</div>
		</div>
	</div>

</main>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>