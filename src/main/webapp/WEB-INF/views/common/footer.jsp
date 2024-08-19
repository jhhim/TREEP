<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<footer>
	<div class="inner">
		<ul class="menu">
			<li><a href="">개인정보처리방침</a></li>
			<li><a href="">홈페이지 이용약관</a></li>
			<li><a href="">고객 지원</a></li>
		</ul>

		<div class="info">
			<span>사업자등록번호 201-81-21515</span> <span>(주)TREEP 대표이사 ***</span> <span>TEL
				: 02) 3015-1100 / FAX : 02) 3015-1106</span>
		</div>

		<p class="copyright">
			&copy; <span class="this-year"></span> TREEP Company. All Rights
			Reseved.
		</p>
	
    <button class="login_button" type="submit" id="createDefaultButton" onclick="sendLinkDefault()" value="Default">대충 카카오 공유 버튼</button>

	</div>
</footer>


<!-- AOS -->
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
	AOS.init();
</script>
<!-- 로그인 기능 -->
<script  type='text/javascript'>
document.addEventListener('DOMContentLoaded', function() {
    // Kakao 객체가 존재하는지 확인
    if (typeof Kakao !== 'undefined') {
        console.log('Kakao SDK가 로드되었습니다.');
        Kakao.init('f5be83671ab1fd039f403cdb875c42a3');  // 여기에 실제 앱 키를 입력하세요
    } else {
        console.error('Kakao SDK가 로드되지 않았습니다.');
    }
});
try {
    /*<![CDATA[*/
  function sendLinkDefault() {
    Kakao.Link.sendDefault({
    	
      objectType: 'feed',
      content: {
        title: 'TREEP',
        description: 'TREEP과 함께 여행을 시작해보세요!',
        imageUrl:
          '원하는 이미지',
        link: {
            mobileWebUrl: 'http://localhost:8080/sns/',
            webUrl: 'http://localhost:8080/sns/',
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:8080/sns/',
            webUrl: 'http://localhost:8080/sns/',
          },
        },
      ],
    })
  }
;
window.kakaoDemoCallback && window.kakaoDemoCallback();
/*]]>*/}
catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) 
	}
	
</script>
<script>
/* 로그인 버튼 클릭 메서드 */
$(".login_btn").click(function() {
	
	$("#login_form").attr("action", "/sns/login");
	$("#login_form").submit();
	
});

</script>


</body>
</html>