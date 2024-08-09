const images = ['./img/white_heart.png', './img/red_heart.png'];
let currentIndex = 0;
const imageElement = document.getElementById("like")

// 좋아요 버튼 클릭
document.getElementById('like').addEventListener('click', function (event) {
    console.log("좋아요버튼 클릭")
    currentIndex = (currentIndex + 1) % images.length;
    imageElement.src = images[currentIndex];
    console.log(imageElement.src)
});
// 댓글 작성 버튼 클릭

function addComment(parentId = null) {
    console.log("댓글 작성 버튼 클릭!");

    // 댓글 테이블 가져오기
    var replyTable;
    if (parentId) {
        replyTable = document.getElementById(`replies-${parentId}`);
    } else {
        replyTable = document.querySelector("#comment-container");
    }
    console.log("")

    // 첫 번째 행(작성자, 신고,쪽지,수정,삭제버튼)
    var row1 = document.createElement("div");


    var nameCell = document.createElement("span");
    nameCell.className = 'reply-writer';

    // 작성자 입력
    nameCell.innerText = "po********";
    var manageCell = document.createElement("span");
    manageCell.innerHTML = `<span class="reply-manage dropdown">
                            <button class="btn dropdown-toggle no-arrow" type="button" data-bs-toggle="dropdown"
                                aria-expanded="false" style="font-weight: bold;">⋮
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">신고하기</a></li>
                                <li><a class="dropdown-item" href="#">쪽지보내기</a></li>
                                <li><a class="dropdown-item" href="#">수정</a></li>
                                <li><a class="dropdown-item" href="#">삭제</a></li>
                            </ul>
                        </span>`;
    row1.append(nameCell);
    row1.append(manageCell);

    // 두 번째 행(댓글 내용)
    var row2 = document.createElement("div");
    var contentCell = document.createElement("span");

    const inputReply = parentId ? document.getElementById(`reply-content-${parentId}`).value : document.getElementById('reply-content').value;
    console.log("부모ID:" + parentId + " 댓글내용:" + inputReply);
    contentCell.innerText = inputReply;
    row2.append(contentCell);

    // 세 번째 행(날짜, 답글 칸)
    var row3 = document.createElement("div");

    // 현재 시간을 가져옴
    var currentDate = new Date();
    var dateTimeString = currentDate.toLocaleString();

    var dayCell = document.createElement("span");

    // 자식에게 물려주기 위한 키

    var commentId = Date.now();
    console.log("commentId:" + commentId)
    dayCell.innerHTML = `<span style="color: gray;">${dateTimeString}</span>
                        <button type="button" class="btn" id="replyreply" onclick="showReplyContainer(${commentId})">↳답글쓰기</button>
                        <div id="replies-${commentId}" class="replies"></div>`;
    row3.append(dayCell);

    replyTable.append(row1);
    replyTable.append(row2);
    replyTable.append(row3);


    if (parentId) {
        document.getElementById(`reply-content-${parentId}`).value = '';
    } else {
        document.getElementById('reply-content').value = '';

    }

}

function showReplyContainer(commentId) {

    var row4 = document.createElement("div");
    let replyInputContainer = document.getElementById(`reply-input-container-${commentId}`);


    if (!replyInputContainer) {

        replyInputContainer = document.createElement('div');
        replyInputContainer.id = `reply-input-container-${commentId}`;
        replyInputContainer.innerHTML = `
        <style>
        .input-reply {
            border: solid 1px #e0e0e0;
            border-radius: 5px;

        }

        .input-reply:focus {

            box-shadow: #caf7b6 0px 0px 0px 2px;
            border: solid 1px #caf7b6;
        }
            
        .reply-reply-submit{
            border: 1px solid #7FD858;
        }
        .reply-reply-submit:hover{
            background-color: #7FD858;
            color: white;
        }

    </style>
        <div class="container-md input-group mb-3" >
        <textarea id="reply-content-${commentId}" class="form-control input-reply" placeholder="댓글을 작성해주세요"></textarea>
        <button class="btn reply-reply-submit" type="button" onclick="addComment(${commentId})">등록</button>
        </div>
    
    `;
        row4.append(replyInputContainer);
        document.getElementById(`replies-${commentId}`).append(row4);

    } else {
        replyInputContainer.style.display = replyInputContainer.style.display === 'none' ? 'block' : 'none';
    }

}

