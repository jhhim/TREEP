<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<title>문의 게시판</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<ul class="MyTab">
		<li class="MyTabMenu"><a href="joinboard">동행게시판</a></li>
		<li class="MyTabMenu"><a href="freeboard">자유게시판</a></li>
		<li class="MyTabMenu MyActive"><a href="askboard">문의게시판</a></li>
	</ul>
	<!-- <div class="summary-container">
        <p id="summary-icon"><i class="fa-solid fa-house"></i></p>
        <p id="summary-icon"><i class="fa-solid fa-arrow-right"></i></p>
        <p id="summary-icon">
            <select name="" id="" class="boardSelect" onchange="window.open(value,'_self')">
                <option value="FriendBoard.html">동행친구</option>
                <option value="FreeBoard.html">자유게시판</option>
                <option value="Askboard.html" selected>문의게시판</option>
            </select>
        </p>
    </div> -->

	<div class="title-container">
		<h1 class="title">문의게시판</h1>
	</div>

	<div class="wrtie-container">
		<button type="button" class="btn write-btn" data-bs-toggle="modal"
			data-bs-target="#writeAsk">문의하기</button>
	</div>



	<!-- Modal -->


	<div class="modal fade" id="writeAsk" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">문의</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">문의 제목</span> <input
							type="text" class="form-control" placeholder="제목을 입력하세요"
							aria-label="title" aria-describedby="basic-addon1"
							id="asktitlevalue">
					</div>


					<div class="input-group">
						<span class="input-group-text">문의 내용</span>
						<textarea class="form-control" aria-label="With textarea"
							id="askcontentvalue"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary"
						data-bs-dismiss="modal" onclick="appendAsk()">문의하기</button>
				</div>
			</div>
		</div>
	</div>




	<div class="modal fade" id="answerAsk" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">문의 답변</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-text">답변 내용</span>
						<textarea class="form-control" aria-label="With textarea"
							id="answercontentvalue"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary"
						data-bs-dismiss="modal" onclick="appendAnswer()">답변하기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="table-container">

		<table class="table">
            <tbody class="table-group-divider asktable" style="border-top-color: #264653">
                <c:forEach var="board" items="${boardPage.boardList}">
                    <tr>
                        <th scope="row" style="width: 80px; vertical-align: top;">
                            <p class="ask">문의</p>
                        </th>
                        <td class="askText" style="vertical-align: middle;">
                            제목 : ${board.board_title}<br>${board.board_content}
                        </td>
                        <c:choose>
                            <c:when test="${sessionScope.member.manager_yn eq 'Y'}">
                                <td style="text-align: right;">
                                    <input type="button" value="삭제" class="btn btn-danger" onclick="deleteWrite(${board.board_no})">
                                    <br><br>
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#answerAsk">답변</button>
                                </td>
                            </c:when>
                        </c:choose>
                    </tr>
                    

                    <c:if test="${boardReplyMap[board.board_no] != null}">
                        <c:forEach var="reply" items="${boardReplyMap[board.board_no]}">
                            <tr>
                                <th scope="row" style="width: 80px; vertical-align: top;">
                                    <i class="fa-solid fa-arrow-turn-up arrow"></i>
                                    <div class="answer" style="background: #e76f51; width: 40px; height: 20px; text-align: center;">
                                        <p style="position: relative; right: 2px;">답변</p>
                                    </div>
                                </th>
                                <td colspan="2">
                                    <p>${reply.reply_content}</p>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>

		<div class="pagenation-container">
			<div class="pagenation">

				<a href="#">1</a>
			</div>
		</div>


	</div>

</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>