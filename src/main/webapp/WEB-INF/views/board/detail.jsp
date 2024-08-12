<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<!-- 게시글 컨테이너 -->
	<div class="container-md" id="post">

		<div class="post-category">
			<c:choose>
				<c:when test="${board.board_kind == 1}">자유</c:when>
				<c:when test="${board.board_kind == 2}">동행</c:when>
			</c:choose>
			> ${board.board_continent}
		</div>
		<br> <span class="post-writer">${writeMember.member_nickname }</span>
		<span class="post-manage dropdown">
			<button class="btn dropdown-toggle no-arrow" type="button"
				data-bs-toggle="dropdown" aria-expanded="false"
				style="font-weight: bold;">⋮</button>
			<ul class="dropdown-menu">
				<!-- 게시글 신고,쪽지,수정,삭제 페이지 이동-->
				<li><a class="dropdown-item" href="#">신고하기</a></li>
				<li><a class="dropdown-item" href="#">쪽지보내기</a></li>
				<li><a class="dropdown-item" href="#">수정</a></li>
				<li><a class="dropdown-item" href="#">삭제</a></li>
			</ul>
		</span>
		<div class="post_response">
			<span style="color: gray;">${board.create_date }</span> <i
				class="fa-regular fa-eye"> ${board.board_hit }</i> <i
				class="fa-regular fa-message"> 2</i>
		</div>
		<br>
		<div class="post-content">
			<div class="img">
				<img src="${path}/resources/img/board/${board.board_img }"
					class="post-content-img" alt="...">
			</div>
			<br>
			<div class="text">${board.board_content}</div>
		</div>
		<br>
		<div class="reaction">
			<img src="${path}/resources/img/detailboard/white_heart.png"
				id="like"> <span>${board.board_like } </span> <i
				class="fa-regular fa-message"></i><span> 2 </span> <span
				class="sns-container"> <span class="social"> <!-- <span class="share-text">공유하기</span> -->
					<span class="social-links"> <!-- sns 공유 --> <a href="#"><img
							src="${path}/resources/img/detailboard/kakao.png" class="sns_img"
							alt="kakao"></a> <a href="#"><img
							src="${path}/resources/img/detailboard/naver.png" class="sns_img"
							alt="naver"></a> <a href="#"><img
							src="${path}/resources/img/detailboard/facebook.png"
							class="sns_img" alt="facebook"></a> <a href="#"><img
							src="${path}/resources/img/detailboard/share_link.png"
							class="sns_img" alt="link"></a>
				</span>
			</span>
			</span>
		</div>
		<br>
	</div>
	<br>


	<form method="post"
		action="reply?kind=${board.board_kind}&no=${board.board_no}"
		class="container-md" id="reply">
		<div class="reply_num">댓글 2</div>
		<br>
		<div class="post-reply input-group mb-3">
			<textarea id="reply-content" class="form-control"
				placeholder="댓글을 작성해주세요" name="replyContent"></textarea>
			<button class="btn" type="submit" id="reply-submit">등록</button>
			<!-- onclick="addComment()" -->
		</div>
		<div id="comment-container">
			<c:forEach var="reply" items="${repliList }">
				<div class="comment">
					<div class="row">
						<div class="col-12">
							<span class="reply-writer"></span> <span
								class="reply-manage dropdown">
								<button class="btn dropdown-toggle no-arrow" type="button"
									data-toggle="dropdown" aria-expanded="false"
									style="font-weight: bold;">⋮</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">신고하기</a></li>
									<li><a class="dropdown-item" href="#">쪽지보내기</a></li>
									<li><a class="dropdown-item" href="#">수정</a></li>
									<li><a class="dropdown-item" href="#">삭제</a></li>
								</ul>
							</span>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<span class="reply-content">${reply.reply_content }</span>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<span style="color: gray;">2024-08-12 12:34:56</span>
							<button type="button" class="btn btn-secondary"
								onclick="showReplyContainer(1)">↳답글쓰기</button>
							<div id="replies-1" class="replies"></div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>


		<br>
	</form>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>