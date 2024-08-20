<%@page import="com.ss.sns.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script>

 

	const boardKind = "${board.board_kind}";
	const boardNo = "${board.board_no}";
	const memberNo = "${sessionScope.member.member_no}";
	const basePath = "${path}";
	document.addEventListener('DOMContentLoaded', function() {
	    // Kakao 객체가 존재하는지 확인
	    if (typeof Kakao !== 'undefined') {
	        console.log('Kakao SDK가 로드되었습니다.');
	        Kakao.init('f5be83671ab1fd039f403cdb875c42a3');  // 여기에 실제 앱 키를 입력하세요
	    } else {
	        console.error('Kakao SDK가 로드되지 않았습니다.');
	    }
	});

	    /*<![CDATA[*/
	  function sendLinkDefaultBoard() {
	    Kakao.Link.sendDefault({
	    	
	      objectType: 'feed',
	      content: {
	        title: '${board.board_title}',
	        description: 'TREEP과 함께 여행을 시작해보세요!',
	        imageUrl:
	          'https://ibb.co/pJHk10N',
	        link: {
	            mobileWebUrl: 'http://localhost:8080/sns/detailboard?kind=1&no=${board.board_no}',
	            webUrl: 'http://localhost:8080/sns/detailboard?kind=1&no=${board.board_no}',
	        },
	      },
	      buttons: [
	        {
	          title: '웹으로 보기',
	          link: {
	            mobileWebUrl: 'http://localhost:8080/sns/detailboard?kind=1&no=${board.board_no}',
	            webUrl: 'http://localhost:8080/sns/detailboard?kind=1&no=${board.board_no}',
	          },
	        },
	      ],
	    })
	  };
	window.kakaoDemoCallback && window.kakaoDemoCallback();
</script>

<%
MemberDTO dto = (MemberDTO) session.getAttribute("member");

int Member_No = 0;

if (dto == null) {
	Member_No = 0;
} else {

	Member_No = dto.getMember_no();
}
request.setAttribute("Member_No", Member_No);
%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<!-- 게시글 컨테이너 -->
	<div class="container-md" id="post">
		<br><h3>${board.board_title }</h3><br>
		<div class="post-category">
			<c:choose>
				<c:when test="${board.board_kind == 1}">자유</c:when>
				<c:when test="${board.board_kind == 2}">동행</c:when>
			</c:choose>
			> ${board.board_continent}
		</div>
		<br> <span class="post-writer">${writeMember.member_nickname }</span>
		<c:choose>
			<c:when
				test="${Member_No eq board.member_no or sessionScope.member.manager_yn eq 'Y'}">
				<span class="post-manage dropdown">
					<button class="btn dropdown-toggle no-arrow" type="button"
						data-bs-toggle="dropdown" aria-expanded="false"
						style="font-weight: bold;">⋮</button>

					<ul class="dropdown-menu">
						<!-- 게시글 신고,쪽지,수정,삭제 페이지 이동-->
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#staticBackdropPolice">신고하기</a></li>
						<li><a class="dropdown-item" href="#">쪽지보내기</a></li>
						<li><a class="dropdown-item" href="updateboard?no=${board.board_no}">수정</a></li>
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#staticBackdropDelete">삭제</a></li>
					</ul>
			</c:when>
			<c:when test="${Member_No eq 0}">


			</c:when>
			<c:otherwise>

				<span class="post-manage dropdown">
					<button class="btn dropdown-toggle no-arrow" type="button"
						data-bs-toggle="dropdown" aria-expanded="false"
						style="font-weight: bold;">⋮</button>

					<ul class="dropdown-menu">
						<!-- 게시글 신고,쪽지 페이지 이동-->
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#staticBackdropPolice">신고하기</a></li>
						<li><a class="dropdown-item" href="#">쪽지보내기</a></li>

					</ul>
			</c:otherwise>



		</c:choose>



		<!-- 신고하기 모달 -->

		<div class="modal fade" id="staticBackdropPolice"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">
							<img src="${path}/resources/img/detailboard/singo.png" id="singo">
						</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						신고하시겠습니까?<br> <br> 허위신고시 불이익이 발생할 수 있습니다.

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="SingoBtn" href="#"
							data-bs-dismiss="modal" data-bs-toggle="modal"
							data-bs-target="#staticBackdropPoliceAlarm">신고하기</button>
					</div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="staticBackdropPoliceAlarm"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm modal-dialog-centered">
				<div class="modal-content">

					<div class="modal-body singoAlarmCustom">

						<img src="${path}/resources/img/detailboard/singoAlarm.png"
							id="singoAlarm"><br> 신고가 정상적으로 처리되었습니다!



					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" onclick="MoveBoard()">닫기</button>

					</div>
				</div>
			</div>
		</div>


		<!-- 삭제 모달 -->

		<div class="modal fade" id="staticBackdropDelete"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">
							<img src="${path}/resources/img/detailboard/trash.png" id="trash">
						</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						정말로 삭제하시겠습니까?
						<!-- <div class="mb-3">
            <label for="message-text" class="col-form-label">신고내용 :</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div> -->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="DeleteBoardBtn" href="#"
							data-bs-dismiss="modal" data-bs-toggle="modal"
							data-bs-target="#staticBackdropDeleteAlarm">삭제하기</button>
					</div>
				</div>
			</div>
		</div>




		<div class="modal fade" id="staticBackdropDeleteAlarm"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm modal-dialog-centered">
				<div class="modal-content">

					<div class="modal-body deleteAlarmCustom">

						<img src="${path}/resources/img/detailboard/deleteconfirm.png"
							id="deleteAlarm"><br>
						<p style="margin-bottom: 10px;">삭제되었습니다.</p>



					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" onclick="DeleteBoard()">닫기</button>

					</div>
				</div>
			</div>
		</div>
		</span>
		<div class="post_response">
			<span style="color: gray;">${board.create_date }</span> <i
				class="fa-regular fa-eye"> ${board.board_hit }</i> <i
				class="fa-regular fa-message"><span class="reply-count"></span></i>
		</div>
		<br>
		<div class="post-content">
			<c:if test="${not empty board.board_img}">
				<div class="img">
					<img src="${path}/resources/img/board/${board.board_img}"
						class="post-content-img" alt="...">
				</div>
			</c:if>
			<br>
			<div class="text" id="contentDiv">${fn:escapeXml(board.board_content)}</div>
		</div>
		<br>
		<div class="reaction">
			<img src="${path}/resources/img/detailboard/white_heart.png"
				id="like"> <span id="likeCount"></span> <i
				class="fa-regular fa-message"></i><span class="reply-count"></span>
			<span class="sns-container"> <span class="social"> <!-- <span class="share-text">공유하기</span> -->
					<span class="social-links"> <!-- sns 공유 --> <a href="javascript:sendLinkDefaultBoard();">
					<img src="${path}/resources/img/detailboard/kakao.png" class="sns_img" alt="kakao"></a> <a onclick="clipboard()">
							<img src="${path}/resources/img/detailboard/share_link.png" class="sns_img" alt="link"></a>
				</span>
			</span>
			</span>
		</div>
		<br>
	</div>
	<br>
	<div class="container-md" id="reply">
		<div class="reply_num">
			댓글<span class="reply-count"></span>
		</div>
		<br>
		<div class="post-reply input-group mb-3">
			<textarea id="reply-content" class="form-control"
				placeholder="댓글을 작성해주세요" name="replyContent"></textarea>
			<button class="btn" type="submit" id="reply-submit">등록</button>
		</div>
		<div id="comment-container"></div>
		<br>
	</div>

</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>