<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
   
<!-- 쪽지함-->
<div class="note container-md">
    <h4 style="text-align: center;">쪽지함 <i class="fa-regular fa-envelope"></i></h4><br>
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="receive-tab" data-bs-toggle="tab" data-bs-target="#receive"
                type="button" role="tab" aria-controls="receive" aria-selected="true">받은 쪽지</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="send-tab" data-bs-toggle="tab" data-bs-target="#send" type="button" role="tab"
                aria-controls="send" aria-selected="false">보낸 쪽지</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="store-tab" data-bs-toggle="tab" data-bs-target="#store" type="button"
                role="tab" aria-controls="store" aria-selected="false">보관 쪽지함</button>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="receive" role="tabpanel" aria-labelledby="receive-tab">
            <br>
            <table class="table" id="receive-note-table">
                <thead>
                    <tr>
                        <th scope="col"><input type="checkbox" name="allcheck" value="all" onclick="allCheck()" /></th>
                        <th scope="col">보낸 사람</th>
                        <th scope="col">내용</th>
                        <th scope="col">날짜</th>
                        <th scope="col">읽음 상태</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach var="msg" items="${msgPage.msgList }">
                	  <tr>
                        <th><input type="checkbox" name="check" value="first" onclick="chkSelect()" /></th>
                        <th scope="row">${msg.message_sen }</th>
                        <td style="width: 40%;"><a href="#" id="note-title-click" data-bs-toggle="modal" data-bs-target="#note-title" >
                                                                                                                  <c:choose>
    					<c:when test="${fn:length(msg.message_content) > 29 }">
        					${fn:substring(msg.message_content,0,30) } ...
    					</c:when>
    					<c:otherwise>
        				${msg.message_content }
						</c:otherwise>
						</c:choose>
              
                            </a>
                            <!-- 쪽지 상세 보기 모달 -->

                            <div class="modal fade" id="note-title" tabindex="-1" aria-labelledby="exampleModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">자세히 보기</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <!-- 상세보기 내용 -->
                                        <div class="modal-body">
                                            <div class="note-detail-container container-md">
                                                <div class="send-note-row">
                                                    <span id="send-person">보낸사람</span><span id="detail-send-person">${msg.message_sen }</span>   
                                                </div>
                                                <div class="recieveDate-note-row">
                                                    <span id="receive-date">받은시간</span><span id="detail-receive-date">${msg.send_date }</span>
                                                </div>
                                                <div class="title-note-row">
                                                    <span id="send-note-title">내용</span>
                                                    <%-- <span id="send-note-title">${msg.message_content  }</span> --%>
                                                </div>
                                        
                                                <div class="note-detail-content">
                                               		${msg.message_content }
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                           <!-- 보관 버튼 -->
                                            <button type="button" class="btn" id="note-detail-store" data-bs-toggle="modal" data-bs-target="#note-detail-store">보관</button>
                                              <!-- 삭제버튼 -->
                                            <button type="button" class="btn" id="note-detail-delete" onclick="location.href='delete?message_no=${msg.message_no}'">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>${msg.send_date }</td>
                        <td><span class="completeRead"></span></td>
                    </tr>
                </c:forEach>
                  
                   <%--  <tr>
                        <th><input type="checkbox" name="check" value="second" onclick="chkSelect()" /></th>
                        <th scope="row">kossds</th>
                        <td style="width: 40%;">엄청 기이이이이이이이이이이인 제목</td>
                        <td>2024.07.31</td>
                        <td><span class="completeRead">${msg.message_status_yn }</span></td>
                    </tr> --%>
                    <!-- <tr>
                        <th><input type="checkbox" name="check" value="third" onclick="chkSelect()" /></th>
                        <th scope="row">sfsdfsdf</th>
                        <td style="width: 40%;">엄청 기이이이이이이이이이이인 제목</td>
                        <td>2024.07.31</td>
                        <td><span class="noRead"></span></td>
                    </tr> -->
                </tbody>
            </table>

            <span class="note-manage">
                <button type="button" class="btn" id="note-write" data-bs-toggle="modal" data-bs-target="#noteWrite">쪽지
                    보내기</button>
                <!--쪽지 보내기 모달-->
                <div class="modal fade" id="noteWrite" tabindex="-1" aria-labelledby="noteWriteLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="recipient-name" class="col-form-label">받는 사람</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Message</label>
                                        <textarea class="form-control" id="message-text"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" data-bs-dismiss="modal" id="send-close">Close</button>
                                <button type="button" class="btn" id="send-confirm">Send message</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn" id="note-delete">삭제</button>
                <button type="button" class="btn" id="note-store" onclick="storeNote()" data-bs-toggle="modal"
                    data-bs-target="#exampleModal">보관</button>

                <!-- 쪽지 보관 모달 -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Message</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ? 건이 보관함에 저장되었습니다.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" id="store-confirm" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>

            </span>


        </div>

        <div class="tab-pane fade" id="send" role="send" aria-labelledby="send-tab">
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col"><input type="checkbox" name="allcheck" value="all" onclick="allCheck()" /></th>
                        <th scope="col">받는 사람</th>
                        <th scope="col">제목</th>
                        <th scope="col">날짜</th>
                        <th scope="col">읽음 상태</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach var="msg2" items="${msgPage2.msgList }"> 
                        <th><input type="checkbox" name="check" value="first" onclick="chkSelect()" /></th>
                        <th scope="row">${msg2.message_sen }</th>
                        <td style="width: 40%;">${msg2.message_content }</td>
                        <td>${msg2.send_date}</td>
                        <td>${msg2.message_status_yn}</td>
                    </tr>
                   
                </c:forEach>
                    
                </tbody>
            </table>
            <span class="note-manage">
                <button type="button" class="btn" id="note-delete">
                        삭제</button>
            </span>

        </div>

        <div class="tab-pane fade" id="store" role="store" aria-labelledby="store-tab">

            <br>
            <table class="table" id="store-note-table">
                <thead>
                    <tr>
                        <th scope="col"><input type="checkbox" name="allcheck" value="all" /></th>
                        <th scope="col">보낸 사람</th>
                        <th scope="col">제목</th>
                        <th scope="col">날짜</th>
                        <th scope="col">읽음 상태</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">

                </tbody>
            </table>

            <div id="empty-store">
                <div id="empty-store-text">
                    보관함이 비었습니다.
                </div>
            </div>

            <span class="note-manage">
                <button type="button" class="btn" id="store-delete">보관함에서 삭제</button>
            </span>
        </div>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination" id="note-pagination">
            <li class="page-item">
                <button type=button class="page-link" onclick="location.href='message?page=${msgPage.currentPage -1 }'" 
                ${msgPage.currentPage == 1 ? 'disabled' : ''} aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </button>
            </li>
            <c:forEach var="i" begin="${msgPage.startPage}" end="${msgPage.endPage }">
             <li class="page-item"><button type="button" class="page-link ${msgPage.currentPage == i ? 'active' : '' }"  onclick="location.href='message?page=${i}'">${i}</button></li>
            </c:forEach>
           
        <!--     <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li> -->

            <li class="page-item">
                 <button type=button class="page-link" onclick="location.href='message?page=${msgPage.currentPage +1 }'" 
                ${msgPage.currentPage == msgPage.totalPage ? 'disabled' : ''} aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </button>
            </li>
        </ul>
    </nav>
    
    
<%--     <nav aria-label="Page navigation example">
        <ul class="pagination" id="note-pagination">
            <li class="page-item">
                <button type=button class="page-link" onclick="location.href='message?page=${msgPage2.currentPage -1 }'" 
                ${msgPage2.currentPage == 1 ? 'disabled' : ''} aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </button>
            </li>
            <c:forEach var="i" begin="${msgPage2.startPage}" end="${msgPage2.endPage }">
             <li class="page-item"><button type="button" class="page-link ${msgPage2.currentPage == i ? 'active' : '' }"  onclick="location.href='message?page=${i}'">${i}</button></li>
            </c:forEach>
           
        <!--     <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li> -->

            <li class="page-item">
                 <button type=button class="page-link" onclick="location.href='message?page=${msgPage2.currentPage +1 }'" 
                ${msgPage2.currentPage == msgPage2.totalPage ? 'disabled' : ''} aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </button>
            </li>
        </ul>
    </nav> --%>
</div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

