<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<title>마이 페이지</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<!-- 프로필 배경,사진 -->
	<div class="profile-background">
		<div class="profile-img-container">
			<img src="${path}/resources/img/mypage/profile2.png" class="profile-img"></img>
		</div>
	</div>

	<div class="profile-content-container container-md">
		<!-- 프로필 이름, 정보 관리 -->
		<div class="profile_info container-md">
			<div class="profile_nickname">Username</div>
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
					<div class="row list-schedule">
						<!--전체 일정 사진 -->
						<div class="col-4 list-schedule-img-container">
							<img src="${path}/resources/img/mypage/paris.jpg" class="img-fluid list-schedule-img">
						</div>
						<!--전체 일정 세부사항-->
						<div class="col-8 list-schedule-content">
							<span class="schedule-DDay">D-21</span> <span
								class="schedule-place"> 파리</span> <span
								class="schedule-manage dropdown">
								<button class="btn dropdown-toggle no-arrow" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">⋮</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">공유</a></li>
									<li><a class="dropdown-item" href="#">수정</a></li>
									<li><a class="dropdown-item" href="#">삭제</a></li>
								</ul>
							</span>
							<div class="schedule-title">여행 이름</div>
							<div class="schedule-period">2024-07-30~2024-08-15</div>
						</div>
					</div>
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
					data-bs-target="#like" type="button" role="tab"
					aria-controls="like" aria-selected="false">좋아요한 글</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<!-- 작성글 테이블 -->
			<div class="tab-pane fade show active" id="write" role="tabpanel"
				aria-labelledby="write-tab">
				<br>
				<table class="table">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" name="allcheck"
								value="all" onclick="allCheck()" /></th>
							<th scope="col">글번호</th>
							<th scope="col">게시판</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<th><input type="checkbox" name="check" value="first"
								onclick="chkSelect()" /></th>
							<th scope="row">1</th>
							<td>자유게시판</td>
							<td style="width: 40%;">엄청 기이이이이이이이이이이인 제목</td>
							<td>2024.07.31</td>
							<td>10</td>
						</tr>
						<tr>
							<th><input type="checkbox" name="check" value="second"
								onclick="chkSelect()" /></th>
							<th scope="row">2</th>
							<td>자유게시판</td>
							<td>글제목2</td>
							<td>2024.07.24</td>
							<td>22</td>
						</tr>
						<tr>
							<th><input type="checkbox" name="check" value="third"
								onclick="chkSelect()" /></th>
							<th scope="row">3</th>
							<td>동행게시판</td>
							<td>글제목3</td>
							<td>2024.08.05</td>
							<td>25</td>
						</tr>
					</tbody>
				</table>
				<div class="activity-manage">
					<button type="button" class="btn" id="mypage-write">글쓰기</button>
					<button type="button" class="btn" id="write-delete">삭제</button>
				</div>

			</div>

			<div class="tab-pane fade" id="like" role="like"
				aria-labelledby="like-tab">

				<br>
				<table class="table">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" name="allcheck"
								value="all" /></th>
							<th scope="col">글번호</th>
							<th scope="col">게시판</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<th><input type="checkbox" name="check" value="first" /></th>
							<th scope="row">1</th>
							<td>자유게시판</td>
							<td>James</td>
							<td style="width: 40%;">엄청 기이이이이이이이이이이인 제목</td>
							<td>2024.07.31</td>
							<td>10</td>
						</tr>
						<tr>
							<th><input type="checkbox" name="check" value="second" /></th>
							<th scope="row">2</th>
							<td>자유게시판</td>
							<td>Sara</td>
							<td>글제목2</td>
							<td>2024.07.24</td>
							<td>22</td>
						</tr>
						<tr>
							<th><input type="checkbox" name="check" value="third" /></th>
							<th scope="row">3</th>
							<td>동행게시판</td>
							<td>Peter</td>
							<td>글제목3</td>
							<td>2024.08.05</td>
							<td>25</td>
						</tr>
						<tr>
							<th><input type="checkbox" name="check" value="third" /></th>
							<th scope="row">3</th>
							<td>동행게시판</td>
							<td>Mao</td>
							<td>글제목4</td>
							<td>2024.08.05</td>
							<td>25</td>
						</tr>
					</tbody>
				</table>
				<div class="activity-manage">
					<button type="button" class="btn" id="mypage-write">글쓰기</button>
					<button type="button" class="btn" id="write-delete">
						삭제
					</button>
				</div>
			</div>
		</div>
	</div>

</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>