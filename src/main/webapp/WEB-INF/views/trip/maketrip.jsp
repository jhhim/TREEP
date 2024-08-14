<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<title>여행 일정 만들기</title>
 
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>

        <div class="Plan-Total-container container-fluid w-100" style="margin: 0; padding: 0;">
        <div class="row w-100">
            <div class="detail-trip col-md-3" style="padding: 0;">
            
                            <div class="trip-title-input input-group mb-3" id="trip-title-input">
                    <input type="text" class="form-control" id="trip-detail-title" placeholder="여행 제목을 입력해주세요.">
                </div>
                <div class="Plan-Calendar-container">



                    <!-- Modal -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal tisstle</h1>
                                    <button type="button" class="offclose" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="Calendar-container">

                                        <div class="sec_cal" style="margin-left: 100px;">
                                            <div class="cal_nav">
                                                <a href="javascript:;" class="nav-btn go-prev">prev</a>
                                                <div class="year-month1"></div>
                                                <div class="year-month2"></div>
                                                <a href="javascript:;" class="nav-btn go-next">next</a>
                                            </div>

                                            <div class="cal_wrap_container">
                                                <div class="cal_wrap">
                                                    <div class="days">
                                                        <div class="day">SUN</div>
                                                        <div class="day">MON</div>
                                                        <div class="day">TUE</div>
                                                        <div class="day">WED</div>
                                                        <div class="day">THU</div>
                                                        <div class="day">FRI</div>
                                                        <div class="day">SAT</div>
                                                    </div>
                                                    <div class="dates1"></div>
                                                </div>

                                                <div class="cal_wrap">
                                                    <div class="days">
                                                        <div class="day">SUN</div>
                                                        <div class="day">MON</div>
                                                        <div class="day">TUE</div>
                                                        <div class="day">WED</div>
                                                        <div class="day">THU</div>
                                                        <div class="day">FRI</div>
                                                        <div class="day">SAT</div>
                                                    </div>
                                                    <div class="dates2"></div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                        onclick="appendSmallCalendar()">선택</button>
                                </div>
                            </div>
                        </div>
                    </div>





                    <div class="Small-Calendar">
                        

                    </div>


                    <div class="Plan-write-container">
                        
                    </div>

                   
                </div>
                
                <div class="final-submit-Container" style="display: none;">
                    <button type="button" class="btn fixed-button" id="final-submit">저장</button>
                </div>
            </div>




            <!-- 오프캔버스 -->
            <div class="place-offcanvas" style="width: 470px;">
                <div class="offcanvas-content">
                    <button class="btn-close closeOff"></button>
                    <div class="p-3">
                        <h4>장소 검색</h4>
                        <input type="text" id="autocomplete" class="form-control" placeholder="장소 입력" />

                        <div class="selected-places-section p-3">
                            <hr id="top-border" style="display: none;">
                            <div id="select-place-list"></div>
                            <div id="place-select-btnContainer"><button type="button" class="btn"
                                    id="place-select-button" data-bs-toggle="modal"
                                    data-bs-target="#placeSelectComplete" style="display: none;">선택한 장소적용</button>




                                <button type="button" class="btn" id="select-place-reset" style="display: none;"><i
                                        class="fa-solid fa-arrow-rotate-left"></i></button>
                            </div>
                            <hr id="bottom-border" style="display: none;">
                            <p id="no-places-message">아직 장소를 선택하지 않았습니다.</p>
                        </div>

                        <div class="place-list" id="placeList"></div>
                    </div>
                </div>
            </div>

            <div class="col-md-9" style="padding: 0;">
                <div id="map"></div>
            </div>

        </div>

        <!-- 선택완료 모달 -->
        <div class="modal fade" id="placeSelectComplete" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">메시지</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        선택한 장소들이 적용되었습니다.!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn" id="selectPlaceCombtn" data-bs-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
