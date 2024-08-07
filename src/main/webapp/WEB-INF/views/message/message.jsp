<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <th scope="col">제목</th>
                        <th scope="col">날짜</th>
                        <th scope="col">읽음 상태</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <tr>
                        <th><input type="checkbox" name="check" value="first" onclick="chkSelect()" /></th>
                        <th scope="row">sdffsdf</th>
                        <td style="width: 40%;"><a href="#" id="note-title-click" data-bs-toggle="modal" data-bs-target="#note-title" >
                                엄청 기이이이이이이잉이이이이인 제목
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
                                                    <span id="send-person">보낸사람</span><span id="detail-send-person">po********</span>   
                                                </div>
                                                <div class="recieveDate-note-row">
                                                    <span id="receive-date">받은시간</span><span id="detail-receive-date">2024.08.07 [09:11]</span>
                                                </div>
                                                <div class="title-note-row">
                                                    <span id="send-note-title">제목</span><span id="send-note-title">기이이이이이이잉이이이이인 제목</span>
                                                </div>
                                        
                                                <div class="note-detail-content">
                                                    (광고) 인기 가전을 시즌 할인 특가로 만난다!
                                                    알렛츠X하이마트 인기 가전 모음! 시즌 한정 할인 특가!
                                                    ▶ https://vvd.bz/eYr6
                                        
                                        
                                                    ▣ Z플립6·폴드6 등 최신 스마트폰 특별 구매 혜택!
                                                    ▶ https://vvd.bz/e4Vh
                                        
                                        
                                                    ▣ 자동차보험료 확인하고 네이버페이 8천원 받기!
                                                    ▶ https://vvd.bz/cM9i
                                        
                                                    본 내용은 상업적 내용이 포함될 수 있으며, 쪽지의 내용 및 제품 설명은 각 광고 업체가 제공한 것으로 카페는 별도의 책임을 지지 않습니다.
                                                    수신을 원하지 않을 경우 상단 버튼 수신 거부가 가능합니다.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                           <!-- 보관 버튼 -->
                                            <button type="button" class="btn" id="note-detail-store" data-bs-toggle="modal" data-bs-target="#note-detail-store">보관</button>
                                              <!-- 삭제버튼 -->
                                            <button type="button" class="btn" id="note-detail-delete">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>2024.07.31</td>
                        <td><span class="completeRead"></span></td>
                    </tr>
                    <tr>
                        <th><input type="checkbox" name="check" value="second" onclick="chkSelect()" /></th>
                        <th scope="row">kossds</th>
                        <td style="width: 40%;">엄청 기이이이이이이이이이이인 제목</td>
                        <td>2024.07.31</td>
                        <td><span class="completeRead"></span></td>
                    </tr>
                    <tr>
                        <th><input type="checkbox" name="check" value="third" onclick="chkSelect()" /></th>
                        <th scope="row">sfsdfsdf</th>
                        <td style="width: 40%;">엄청 기이이이이이이이이이이인 제목</td>
                        <td>2024.07.31</td>
                        <td><span class="noRead"></span></td>
                    </tr>
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
                    <tr>
                        <th><input type="checkbox" name="check" value="first" onclick="chkSelect()" /></th>
                        <th scope="row">sdffsdf</th>
                        <td style="width: 40%;">엄청 기이이이이이이이이이이인 제목</td>
                        <td>2024.07.31</td>
                        <td>읽음</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox" name="check" value="second" onclick="chkSelect()" /></th>
                        <th scope="row">kossds</th>
                        <td style="width: 40%;">엄청 기이이이이이이이이이이인 제목</td>
                        <td>2024.07.31</td>
                        <td>읽음</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox" name="check" value="third" onclick="chkSelect()" /></th>
                        <th scope="row">sfsdfsdf</th>
                        <td style="width: 40%;">엄청 기이이이이이이이이이이인 제목</td>
                        <td>2024.07.31</td>
                        <td>읽지 않음</td>
                    </tr>
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
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>

            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

