<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script>
    const boardKind = "${board.board_kind}";
    const boardNo = "${board.board_no}";
    //const memberId = "${sessionScope.memberId}";
    const memberId = 1000;
    const basePath = "${path}";
</script>
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
				class="fa-regular fa-message"></i><span> ${repliList.size()}
			</span> <span class="sns-container"> <span class="social"> <!-- <span class="share-text">공유하기</span> -->
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
	<div class="container-md" id="reply">
		<div class="reply_num">댓글 ${repliList.size()}</div>
		<br>
		<div class="post-reply input-group mb-3">
			<textarea id="reply-content" class="form-control"
				placeholder="댓글을 작성해주세요" name="replyContent"></textarea>
			<button class="btn" type="submit" id="reply-submit">등록</button>
		</div>
		<div id="comment-container">
			<%-- <c:forEach var="reply" items="${repliList}">
				<c:if test="${reply.rereply_no == 0}">
					<div class="comment" id="comment-${reply.reply_no}">
						<div class="row">
							<div class="col-12">
								<span class="reply-writer">작성자</span> <span
									class="reply-manage dropdown">
									<button class="btn dropdown-toggle no-arrow" type="button"
										data-bs-toggle="dropdown" aria-expanded="false"
										style="font-weight: bold;">⋮</button>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">신고하기</a></li>
										<li><a class="dropdown-item" href="#">쪽지보내기</a></li>
										<li><a class="dropdown-item" href="#">수정</a></li>
										<li><a class="dropdown-item" href="deletereply?reply_no=${reply.reply_no}&kind=${board.board_kind}&no=${board.board_no}">삭제</a></li>
									</ul>
								</span>
							</div>
						</div> 
								
						<span class="reply-content">${reply.reply_content}</span>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<span style="color: gray;">${reply.reply_date}</span>
								<button type="button" class="btn btn-secondary"
									onclick="showReplyContainer(${reply.reply_no}, '${board.board_kind}', '${board.board_no}')">↳답글쓰기</button>
							</div>
						</div>
						
	
						<div id="replies-${reply.reply_no}" class="replies">
							<c:forEach var="subReply" items="${reply.reReplyList}">
								<div class="comment sub-comment">
									<div class="row">
										<div class="col-12">
											<span class="reply-writer">작성자</span> <span
												class="reply-manage dropdown">
												<button class="btn dropdown-toggle no-arrow" type="button"
													data-bs-toggle="dropdown" aria-expanded="false"
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
											<span class="reply-content">${subReply.reply_content}</span>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<span style="color: gray;">${subReply.reply_date}</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</c:forEach> --%>
		</div>
		<br>
	</div>
		<script>	
		function loadReply() {
			  $.ajax({
			    method: 'get',
			    url: '${path}/reply?kind=${board.board_kind}&no=${board.board_no}',
			    contentType: 'application/json',
			    dataType: 'json',

			success : function(replyList) {
								$('#comment-container').empty();

								replyList.forEach(function(reply) {
							        if (reply.rereply_no === 0) {
							            let commentHtml = 
							                '<div class="comment" id="comment-' + reply.reply_no + '">' +
							                    '<div class="row">' +
							                        '<div class="col-12">' +
							                            '<span class="reply-writer">작성자</span>' +
							                            '<span class="reply-manage dropdown">' +
							                                '<button class="btn dropdown-toggle no-arrow" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-weight: bold;">⋮</button>' +
							                                '<ul class="dropdown-menu">' +
							                                    '<li><a class="dropdown-item" href="#">신고하기</a></li>' +
							                                    '<li><a class="dropdown-item" href="#">쪽지보내기</a></li>' +
							                                    '<li><a class="dropdown-item" href="#">수정</a></li>' +
							                                    '<li><a class="dropdown-item" href="#">삭제</a></li>' +
							                                '</ul>' +
							                            '</span>' +
							                        '</div>' +
							                    '</div>' +
							                    '<div class="row">' +
							                        '<div class="col-12">' +
							                            '<span class="reply-content">' + reply.reply_content + '</span>' +
							                        '</div>' +
							                    '</div>' +
							                    '<div class="row">' +
							                        '<div class="col-12">' +
							                            '<span style="color: gray;">' + reply.reply_date + '</span>' +
							                            '<button type="button" class="btn btn-secondary" onclick="showReplyContainer('+reply.reply_no+')">↳답글쓰기</button>' +
							                        '</div>' +
							                    '</div>' +
							                    '<div id="replies-' + reply.reply_no + '" class="replies">';

							            reply.reReplyList.forEach(function(subReply) {
							                commentHtml += 
							                    '<div class="comment sub-comment">' +
							                        '<div class="row">' +
							                            '<div class="col-12">' +
							                                '<span class="reply-writer">작성자</span>' +
							                                '<span class="reply-manage dropdown">' +
							                                    '<button class="btn dropdown-toggle no-arrow" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-weight: bold;">⋮</button>' +
							                                    '<ul class="dropdown-menu">' +
							                                        '<li><a class="dropdown-item" href="#">신고하기</a></li>' +
							                                        '<li><a class="dropdown-item" href="#">쪽지보내기</a></li>' +
							                                        '<li><a class="dropdown-item" href="#">수정</a></li>' +
							                                        '<li><a class="dropdown-item" href="#">삭제</a></li>' +
							                                    '</ul>' +
							                                '</span>' +
							                            '</div>' +
							                        '</div>' +
							                        '<div class="row">' +
							                            '<div class="col-12">' +
							                                '<span class="reply-content">' + subReply.reply_content + '</span>' +
							                            '</div>' +
							                        '</div>' +
							                        '<div class="row">' +
							                            '<div class="col-12">' +
							                                '<span style="color: gray;">' + subReply.reply_date + '</span>' +
							                            '</div>' +
							                        '</div>' +
							                    '</div>';
							            });

							            commentHtml += '</div></div>';
							            $('#comment-container').append(commentHtml);
							        }
							    });
							},
							error : function(e) {
								console.error(e);
								alert('전송 실패!!');
							}
						});
			}

			loadReply();
		</script>

	
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>