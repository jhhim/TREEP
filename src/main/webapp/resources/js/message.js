//전체 선택
function allCheckRev() {


    console.log("전체 선택 버튼 클릭");
    let check = document.getElementsByName('allcheck')[0].checked;

    const checkBoxs = document.getElementsByName('checkrev');

    for (let checkbox of checkBoxs) {
        checkbox.checked = check;
    }
    
    for(let i = 0; i < checkBoxs.length; i++){
    	if(checkBoxs[i].checked){
		
		
		$('.deleteRevChk').attr('data-bs-target','#staticBackdrop2');
		$('.StoreRevChk').attr('data-bs-target','#staticBackdrop');
		break;

		}else{
		$('.deleteRevChk').removeAttr('data-bs-target');	
		$('.StoreRevChk').removeAttr('data-bs-target');			
		
		}
    
    }
        
}


function allCheckSend() {


    console.log("전체 선택 버튼 클릭");
    let check = document.getElementsByName('allcheck')[1].checked;

    const checkBoxs = document.getElementsByName('checksend');

    for (let checkbox of checkBoxs) {
        checkbox.checked = check;
    }
    
    for(let i = 0; i < checkBoxs.length; i++){
    	if(checkBoxs[i].checked){
		
		
		$('.deleteSenChk').attr('data-bs-target','#staticBackdrop3');
		
		break;

		}else{
		$('.deleteSenChk').removeAttr('data-bs-target');	
					
		
		}
    
    }
    
}



function allCheckStore() {


    console.log("전체 선택 버튼 클릭");
    let check = document.getElementsByName('allcheck')[2].checked;

    const checkBoxs = document.getElementsByName('checkstore');

    for (let checkbox of checkBoxs) {
        checkbox.checked = check;
    }
    
    for(let i = 0; i < checkBoxs.length; i++){
    	if(checkBoxs[i].checked){
		
		
		$('.deleteStoreChk').attr('data-bs-target','#staticBackdrop4');
		break;

		}else{
		$('.deleteStoreChk').removeAttr('data-bs-target');
		
		}
    
    }
        
}




function chkSelectrev() {
    //전체 선택된 상태에서 체크가 풀릴경우 전체선택 체크도 풀리는 기능
    const checkBoxs = document.getElementsByName('checkrev');
	
	for(let i = 0; i < checkBoxs.length; i++){
		if(checkBoxs[i].checked){
		
		
		$('.deleteRevChk').attr('data-bs-target','#staticBackdrop2');
		$('.StoreRevChk').attr('data-bs-target','#staticBackdrop');

		
		break;

		}else{
		$('.deleteRevChk').removeAttr('data-bs-target');	
		$('.StoreRevChk').removeAttr('data-bs-target');		
	
		
		}
		
		
	}
		
	
    let flag = true;
    for (let checkbox of checkBoxs) {
        if (!checkbox.checked) {
            flag = false;
        }
    }
    document.getElementsByName('allcheck')[0].checked = flag;
}


function chkSelectsend() {
    //전체 선택된 상태에서 체크가 풀릴경우 전체선택 체크도 풀리는 기능
    const checkBoxs = document.getElementsByName('checksend');
	

	for(let i = 0; i < checkBoxs.length; i++){
		if(checkBoxs[i].checked){
		
		$('.deleteSenChk').attr('data-bs-target','#staticBackdrop3');
		
		break;

		}else{
		$('.deleteSenChk').removeAttr('data-bs-target');	
					
		
		}
		
		
	}
    let flag = true;
    for (let checkbox of checkBoxs) {
        if (!checkbox.checked) {
            flag = false;
        }
    }
    document.getElementsByName('allcheck')[1].checked = flag;
}


function chkSelectStore() {
    //전체 선택된 상태에서 체크가 풀릴경우 전체선택 체크도 풀리는 기능
    const checkBoxs = document.getElementsByName('checkstore');
	
	for(let i = 0; i < checkBoxs.length; i++){
		if(checkBoxs[i].checked){
		
		

		$('.deleteStoreChk').attr('data-bs-target','#staticBackdrop4');
		
		break;

		}else{
		
	    $('.deleteStoreChk').removeAttr('data-bs-target');	
		
		}
		
		
	}
		
	
    let flag = true;
    for (let checkbox of checkBoxs) {
        if (!checkbox.checked) {
            flag = false;
        }
    }
    document.getElementsByName('allcheck')[2].checked = flag;
}





//보관함 비었습니다. 메시지
function EmptyMessage(){

    var StoreTable = document.getElementById('store-note-table');
    var rowCount = StoreTable.rows.length-1;
    console.log(rowCount);
    if(rowCount==0){
        document.getElementById('empty-store').style.display='block';
    }
    else{
        document.getElementById('empty-store').style.display='none';
    }
};

EmptyMessage();

function storeNote() {
    // 기존 테이블과 새로운 테이블을 가져오기
    console.log("쪽지 보관 클릭")
  //  var ReceiveNoteTable = document.getElementById('receive-note-table').getElementsByTagName('tbody')[0];
  //  var StoreNoteTable = document.getElementById('store-note-table').getElementsByTagName('tbody')[0];

//    var checkboxes = document.getElementsByName("check");
    
    const checkBoxs = document.getElementsByName('checkrev');
 


	for(let i = 0; i < checkBoxs.length; i++){
		if(checkBoxs[i].checked){
		
		 location.href='RevStore?message_no=' + checkBoxs[i].value;
		  
		}
	}
	
	
    // 체크된 행을 새로운 테이블에 추가하기
/*    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            // 선택된 행 가져오기
            var selectedRow = checkboxes[i].parentElement.parentElement;
            var name = selectedRow.cells[1].textContent; // 첫 번째 셀은 체크박스, 두 번째 셀은 이름
        
            // 새로운 테이블에 동일한 이름의 행이 있는지 확인
            var checkDupStore = false;
            for (var j = 0; j < StoreNoteTable.rows.length; j++) {
                if (StoreNoteTable.rows[j].cells[1].textContent === name) {
                    checkDupStore = true;
                    break;
                }
            }

            // 만약 새로운 테이블에 행이 없으면 추가
            if (!checkDupStore) {
                var newRow = StoreNoteTable.insertRow();

                var checkBoxCell = newRow.insertCell();
                var checkBox = document.createElement('input');
                checkBox.type = 'checkbox';
                checkBox.name='check';
                checkBoxCell.appendChild(checkBox);
                for (var k = 1; k < selectedRow.cells.length; k++) {
                    var newCell = newRow.insertCell();
                    newCell.textContent = selectedRow.cells[k].textContent;
                }
            }
        }
    }

*/
 //   EmptyMessage();
}

//읽음, 읽지 않음 상태 표시

let completeReads = document.querySelectorAll('.completeRead');
const noReads = document.getElementsByClassName('noRead');

for(read of completeReads){
    read.innerHTML=`<i class="fa-solid fa-circle" style="color: green; font-size: 0.5rem;"></i> 읽음`;
}
for (no of noReads){
    no.innerHTML=`<i class="fa-solid fa-circle" style="color: red; font-size: 0.5rem;"></i> 읽지 않음`;
}


function sendMessage() {
    var recipientName = document.getElementById('send-recipient-name').value;
    var messageText = document.getElementById('send-message-text').value;
    location.href = 'SendMessage?recipient_name=' + recipientName + '&message_text=' + messageText;
}




function deleteRevCheck(){
 const checkBoxs = document.getElementsByName('checkrev');
 


	for(let i = 0; i < checkBoxs.length; i++){
		if(checkBoxs[i].checked){
		
		 location.href='deleteRev?message_no=' + checkBoxs[i].value;
		  
		}
	}

	
}


function deleteSendCheck(){
 const checkBoxs = document.getElementsByName('checksend');
 


	for(let i = 0; i < checkBoxs.length; i++){
		if(checkBoxs[i].checked){
		
		 location.href='deleteSend?message_no=' + checkBoxs[i].value;
		  
		}
	}

	
}

function chkStoreDelete(){
 const checkBoxs = document.getElementsByName('checkstore');

 for(let i = 0; i < checkBoxs.length; i++){
		if(checkBoxs[i].checked){
			
		 location.href='RevStoreDelete?message_no=' + checkBoxs[i].value;
		 		
		
		}

		

		
	}

}



function resetSendMsg(){
console.log($('#send-recipient-name'));
	
	$('#send-recipient-name').val('');
	$('#send-message-text').val('');

}