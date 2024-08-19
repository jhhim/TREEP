//전체 선택
function allCheck(){

    console.clear();
    let check =  document.getElementsByName('allcheck')[0].checked;
    
    const checkBoxs = document.getElementsByName('check');
    
    for(let checkbox of checkBoxs){
        checkbox.checked = check;
    }
}

//전체 선택된 상태에서 체크가 풀릴경우 전체선택 체크도 풀리는 기능
function chkSelect(){

    const checkBoxs = document.getElementsByName('check');

    let flag = true;
    for(let checkbox  of checkBoxs){
        if(!checkbox.checked){
           flag = false; 
        }
    }
    document.getElementsByName('allcheck')[0].checked = flag;


}
//프로필 사진 변경
document.getElementById('profile-upload-img').addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const imagePreview = document.getElementById('image-preview');
            imagePreview.src = e.target.result;
            imagePreview.style.display = 'block';
        };
        reader.readAsDataURL(file);
    }
});
const defaultimage = './img/mypage/profile2.png'; 

//삭제 버튼 클릭시 기본 이미지로 돌아옴
document.getElementById('delete').addEventListener('click',function(event){
    console.log("삭제버튼 클릭");
    const imagePreview = document.getElementById('image-preview');
    imagePreview.src = defaultimage;
});



/*

$('#save').click(()=>{
	let name = $('#nickname').val();
	let img = $('#profile-upload-img').val();

  $.ajax({
  	method:'post',
  	url:'${path}/profileModify/',
  	contentType: 'application/json',
  	dateType: 'json',
  	data: JSON.stringify({name,img}),
  	success:(result)=>{
  	alert("전송 성공");
  	$('#save').html(JSON.stringify(result));
  	},
  	error:(e) => {alert("전송 실패");
  	
  	
  	}
  	
  });




});

*/


$(document).ready(function(){
	loadWrite();

});


/*

function loadWrite(){

	$.ajax({
		method:'get',
		url:`${MypageBasePath}/MyWrite`,
		contentType: 'application/json',
		dataType: 'json',
		success :function(WriteList){
			
			
			$('#writeTbody').empty();
		
	
			WriteList.forEach(function(write) {
			
			var boardList = write.MyWriteBoard;			
			var startNo = write.startNo;
			var endNo = write.endNo;
			
			
			


			
			const td = document.createElement('td');
			td.innerHTML = '<td>' + write.MyWriteBoard.board_type + '</td>';
			
						
						<tr>
								
								<td>${write.board_type }</td>
								<td>${write.board_type }</td>
								<td style="width: 40%;"><a href="detailboard?kind=${write.board_kind}&no=${write.board_no}" >${write.board_title }</a></td>
								
								<td>
									<c:choose>
										<c:when
											test="${fn:substring(write.create_date, 0, 10) eq today}">
											<fmt:parseDate value="${write.create_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
											 <fmt:formatDate pattern="HH:mm" value="${parsedDateTime}"/>
										</c:when>
										<c:otherwise>
											 <fmt:parseDate value="${write.create_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
											 <fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${write.board_hit }</td>
							</tr>
							
			
				$('#writeTbody').appendChild(td);
			});
		
		
		
			
			
		
		}, error : function(){
			alert("에러");
		}
	
	});


}

*/

