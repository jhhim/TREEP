<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script>
   /*  const boardKind = "${board.board_kind}";
    const boardNo = "${board.board_no}";
    //const memberId = "${sessionScope.memberId}";
    const memberId = 1000; */
    const basePath = "${path}";
</script>
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
                        <th scope="col"><input type="checkbox" name="allcheck" value="all" onclick="allCheckRev()" /></th>
                        <th scope="col">보낸 사람</th>
                        <th scope="col">내용</th>
                        <th scope="col">날짜</th>
                        <th scope="col">읽음 상태</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach var="msg" items="${msgPage.msgList1 }">
                	  <tr>
                        <th><input type="checkbox" name="checkrev" value="${msg.message_no }" onclick="chkSelectrev()" /></th>
                        <th scope="row">${msg.member_nickname }</th>
                        <td style="width: 40%;"><a href="#" id="note-title-click" data-bs-toggle="modal" data-bs-target="#note-title-${msg.message_no }" >
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

                            <div class="modal fade" id="note-title-${msg.message_no }" data-bs-backdrop="static" data-bs-keyboard="false"  tabindex="-1" aria-labelledby="exampleModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">자세히 보기</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close" onclick="location.href='updateRev?message_no=${msg.message_no }'"></button>
                                        </div>
                                        <!-- 상세보기 내용 -->
                                        <div class="modal-body">
                                            <div class="note-detail-container container-md">
                                                <div class="send-note-row">
                                                    <span id="send-person">보낸사람</span><span id="detail-send-person">${msg.member_nickname }</span>   
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
                                            <button type="button" class="btn" id="note-detail-store"  onclick="location.href='RevStore?message_no=${msg.message_no}'">보관</button>
                                              <!-- 삭제버튼 -->
                                            <button type="button" class="btn" id="note-detail-delete" onclick="location.href='deleteRev?message_no=${msg.message_no}'">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>${msg.send_date }</td>
                        <td> <c:choose>
    					<c:when test="${msg.messagerev_status_yn == 'Y' }">
        					<span class="completeRead"></span>
    					</c:when>
    					<c:otherwise>
        				<span class="noRead"></span>
						</c:otherwise>
						</c:choose></td>
                    </tr>
                </c:forEach>
                  
                </tbody>
            </table>

            <span class="note-manage">
                <button type="button" class="btn" id="note-write" data-bs-toggle="modal" data-bs-target="#noteWrite">쪽지 보내기</button>
                <!--쪽지 보내기 모달-->
                <div class="modal fade" id="noteWrite" tabindex="-1" aria-labelledby="noteWriteLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">쪽지 보내기</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close" onclick="resetSendMsg()"></button>
                            </div>
                            <div class="modal-body">
                                <form action="">
                                    <div class="mb-3">
                                        <label for="recipient-name" class="col-form-label">받는 사람(닉네임)</label>
                                        <input type="text" class="form-control" id="send-recipient-name">
                                    </div>
                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">내용</label>
                                        <textarea class="form-control" id="send-message-text"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" data-bs-dismiss="modal" id="send-close" onclick="resetSendMsg()">닫기</button>
                                <button type="button" class="btn" id="send-confirm" onclick="sendMessage()">보내기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn  deleteRevChk" id="note-delete" data-bs-toggle="modal"  
                data-bs-target="">삭제</button>  <!-- onclick="deleteCheck()" -->
             
                <button type="button" class="btn StoreRevChk" id="note-store"  data-bs-toggle="modal"
                   data-bs-target="">보관</button>  <!-- onclick="storeNote()" -->

                <!-- 쪽지 보관 모달 -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close" onclick="storeNote()"></button>
                            </div>
                            <div class="modal-body">
                                보관함에 저장되었습니다.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" id="store-confirm" data-bs-dismiss="modal" onclick="storeNote()">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close" onclick="deleteRevCheck()"></button>
                            </div>
                            <div class="modal-body">
                                삭제되었습니다.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" id="store-confirm" data-bs-dismiss="modal" onclick="deleteRevCheck()">확인</button>
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
                        <th scope="col"><input type="checkbox" name="allcheck" value="all" onclick="allCheckSend()" /></th>
                        <th scope="col">받는 사람</th>
                        <th scope="col">제목</th>
                        <th scope="col">날짜</th>
                        <th scope="col">읽음 상태</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach var="msg2" items="${msgPage2.msgList2 }"> 
                        <th><input type="checkbox" name="checksend" value="${msg2.message_no }" onclick="chkSelectsend()" /></th>
                        <th scope="row">${msg2.member_nickname }</th>
                        <td style="width: 40%;">${msg2.message_content }</td>
                        <td>${msg2.send_date}</td>
                        <td><c:choose>
    					<c:when test="${msg2.messagesen_status_yn == 'Y' }">
        					<span class="completeRead"></span>
    					</c:when>
    					<c:otherwise>
        				<span class="noRead"></span>
						</c:otherwise>
						</c:choose></td>
                    </tr>
                   
                </c:forEach>
                    
                </tbody>
            </table>
            <span class="note-manage">
                <!-- <button type="button" class="btn" id="note-delete" onclick="deleteSendCheck()">삭제</button> -->
                <button type="button" class="btn  deleteSenChk" id="note-delete" data-bs-toggle="modal"  
                data-bs-target="">삭제</button>
                
                
                 <div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close" onclick="deleteSendCheck()"></button>
                            </div>
                            <div class="modal-body">
                                삭제되었습니다.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" id="store-confirm" data-bs-dismiss="modal" onclick="deleteSendCheck()">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
                
            </span>

        </div>

        <div class="tab-pane fade" id="store" role="store" aria-labelledby="store-tab">

            <br>
            <table class="table" id="store-note-table">
                <thead>
                    <tr>
                        <th scope="col"><input type="checkbox" name="allcheck" onclick="allCheckStore()" value="all" /></th>
                        <th scope="col">보낸 사람</th>
                        <th scope="col">제목</th>
                        <th scope="col">날짜</th>
                        <th scope="col">읽음 상태</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
					                <c:forEach var="msg3" items="${msgPage3.msgList1 }">
                	  <tr>
                        <th><input type="checkbox" name="checkstore" value="${msg3.message_no }" onclick="chkSelectStore()" /></th>
                        <th scope="row">${msg3.member_nickname }</th>
                        <td style="width: 40%;"><a href="#" id="note-title-click" data-bs-toggle="modal" data-bs-target="#note-title-${msg3.message_no }" >
                       <c:choose>
    					<c:when test="${fn:length(msg3.message_content) > 29 }">
        					${fn:substring(msg3.message_content,0,30) } ...
    					</c:when>
    					<c:otherwise>
        				${msg3.message_content }
						</c:otherwise>
						</c:choose>
              
                            </a>
                            <!-- 쪽지 상세 보기 모달 -->

                            <div class="modal fade" id="note-title-${msg3.message_no }" tabindex="-1" aria-labelledby="exampleModalLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">자세히 보기</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close" onclick="location.href='updateRev?message_no=${msg3.message_no }'"></button>
                                        </div>
                                        <!-- 상세보기 내용 -->
                                        <div class="modal-body">
                                            <div class="note-detail-container container-md">
                                                <div class="send-note-row">
                                                    <span id="send-person">보낸사람</span><span id="detail-send-person">${msg3.member_nickname }</span>   
                                                </div>
                                                <div class="recieveDate-note-row">
                                                    <span id="receive-date">받은시간</span><span id="detail-receive-date">${msg3.send_date }</span>
                                                </div>
                                                <div class="title-note-row">
                                                    <span id="send-note-title">내용</span>
                                                    <%-- <span id="send-note-title">${msg.message_content  }</span> --%>
                                                </div>
                                        
                                                <div class="note-detail-content">
                                               		${msg3.message_content }
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                           
                                           <%--  <button type="button" class="btn" id="note-detail-store" data-bs-toggle="modal" data-bs-target="#note-detail-store" onclick="location.href='RevStoreDelete?message_no=${msg3.message_no}'">보관함에서 삭제</button> --%>
                                              <!-- 삭제버튼 -->
                                            <%-- <button type="button" class="btn" id="note-detail-delete" onclick="location.href='RevStoreDelete?message_no=${msg3.message_no}'">보관함에서 삭제</button> --%>
                                  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>${msg3.send_date }</td>
                        <td> <c:choose>
    					<c:when test="${msg3.messagerev_status_yn == 'Y' }">
        					<span class="completeRead"></span>
    					</c:when>
    					<c:otherwise>
        				<span class="noRead"></span>
						</c:otherwise>
						</c:choose></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div id="empty-store">
                <div id="empty-store-text">
                    보관함이 비었습니다.
                </div>
            </div>

            <span class="note-manage">
                <!-- <button type="button" class="btn" id="store-delete" onclick="chkStoreDelete();">보관함에서 삭제</button> -->
                
                  <button type="button" class="btn  deleteStoreChk" id="note-delete" data-bs-toggle="modal"  
                	data-bs-target="">보관함에서 삭제</button>
                                            
                                            
                                            
                   <div class="modal fade" id="staticBackdrop4" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close" onclick="chkStoreDelete()"></button>
                            </div>
                            <div class="modal-body">
                                삭제되었습니다.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" id="store-confirm" data-bs-dismiss="modal" onclick="chkStoreDelete()">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
                           
                
                
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
    
    
  <%--    <nav aria-label="Page navigation example">
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
    </nav>  --%>
</div>
</main>

<script>
        var sendMessage = "${nullMsg}";
        if (sendMessage) {
            alert(sendMessage);
        }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>