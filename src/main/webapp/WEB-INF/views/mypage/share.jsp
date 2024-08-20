<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<main>
	<div class="share_info_container">
        <img src="${path}/resources/img/login/free-icon-tree-7650988.png" class="share_img">
        <p class="share_info"> ${info.member_nickname} 님의  ${info.trip_title} 일정에 초대되셨습니다.</p>
        <p class="share_info">초대를 수락하시겠습니까?</p>
        <div class="share_button_div">
            <button type="button" class="share_button" id="share_ok" onclick="location.href='${path}/insertMemberTrip?trip_no=${info.trip_no}'">추가하기</button>
            <button type="button" class="share_button" id="share_no">취소하기</button>
        </div>
        <div>
        <a href="javascript:sendLinkDefaultTrip();"><img
							src="${path}/resources/img/detailboard/kakao.png" class="sns_img mt-3"
							alt="kakao"></a>
		
		</div>
    </div>
</main>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Kakao 객체가 존재하는지 확인
    if (typeof Kakao !== 'undefined') {
        console.log('Kakao SDK가 로드되었습니다.');
        Kakao.init('f5be83671ab1fd039f403cdb875c42a3');  // 여기에 실제 앱 키를 입력하세요
    } else {
        console.error('Kakao SDK가 로드되지 않았습니다.');
    }
});
function sendLinkDefaultTrip() {
    Kakao.Link.sendDefault({
    	
      objectType: 'feed',
      content: {
        title: '${info.trip_title}',
        description: 'TREEP과 함께 일정을 공유하고 친구들과 함께하세요!',
        imageUrl:
          'https://ibb.co/pJHk10N',
        link: {
            mobileWebUrl: 'http://localhost:8080/sns/share?trip_no=${info.trip_no}',
            webUrl: 'http://localhost:8080/sns/share?trip_no=${info.trip_no}',
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:8080/sns/share?trip_no=${info.trip_no}',
            webUrl: 'http://localhost:8080/sns/share?trip_no=${info.trip_no}',
          },
        },
      ],
    })
  };
window.kakaoDemoCallback && window.kakaoDemoCallback();

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>