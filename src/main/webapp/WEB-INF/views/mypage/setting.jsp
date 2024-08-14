<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
        <!-- 프로필 배경화면 -->
    <div class="profile-background">
        <div class="profile-img-container">
            <img src="${path}/resources/img/mypage/profile2.png" id="profile-img"></img>
        </div>
    </div>

    <!-- 프로필 닉네임 -->
    <div class="profile-content-container container-md">
        <div class="profile_nickname" >${nickname }</div>
    </div>

    <!-- 프로필 설정 -->
    <div class="profile-setting container-sm" style="max-width: 480px;">
        <div class="profile-setting-title">프로필 설정</div>
        <div class="profile-setting-nickname">
            <!-- 닉네임 입력 -->
            <div>닉네임</div>
            <div class="input-nickname">
                <input type="text" value=" ${nickname}" class="form-control" id="nickname">
               
            </div>
        </div>
        <div class="profile-setting-photo">
            <!-- 프로필 사진 입력 -->
            <div>프로필 사진</div>
            <div class="photo-upload input-group ">
                <input type="file" class="form-control" id="profile-upload-img">
                <label class="input-group-text" for="profile-upload-img">업로드</label>
            </div>
            <div id="preview-container" class="mt-3">
                <img src="${path}/resources/img/mypage/profile2.png" id="image-preview" src="#" alt="Image Preview" style="max-width: 100%;">
            </div>
            <br>
            <button type="button" class="btn" id="delete">삭제</button> 
        </div><br>
        <div class="profile-setting-email">
            <br>
            <div>이메일</div>
            <div class="input-email">
                <input type="text" value="Username@gmail.com" class="form-control" id="email" readonly>
            </div>
        </div>
        <div class="profile-setting-resign">
            <a href="#" class="resign">
                <div>회원 탈퇴</div>
            </a>
        </div><br>
        <!-- 마이페이지 설정 돌아가기, 저장 -->
        <div class="row profile-setting-button">
            <div class="col">
                <button type="button" class="btn" id="back" onclick="history.back()">돌아가기</button>
            </div>
            <div class="col">
                <button type="button" class="btn" id="save">저장</button>
            </div>
        </div>
    </div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>