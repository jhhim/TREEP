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
/* function addComment(parentId = null) {
    const replyTable = parentId ? document.getElementById(`replies-${parentId}`) : document.getElementById("comment-container");
    
    const inputReply = parentId ? document.getElementById(`reply-content-${parentId}`).value : document.getElementById('reply-content').value;
    if (!inputReply.trim()) return; // 댓글 내용이 없으면 반환

    // 댓글 요소 생성
    const commentDiv = document.createElement("div");
    commentDiv.className = parentId ? 'sub-comment' : 'comment';

    commentDiv.innerHTML = `
        <div>
            <span class="reply-writer">작성자</span>
            <span class="reply-manage dropdown">
                <button class="btn dropdown-toggle no-arrow" type="button" data-bs-toggle="dropdown" aria-expanded="false">⋮</button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">신고하기</a></li>
                    <li><a class="dropdown-item" href="#">쪽지보내기</a></li>
                    <li><a class="dropdown-item" href="#">수정</a></li>
                    <li><a class="dropdown-item" href="#">삭제</a></li>
                </ul>
            </span>
        </div>
        <div><span class="reply-content">${inputReply}</span></div>
        <div style="color: gray;">
            ${new Date().toLocaleString()}
            ${!parentId ? `<button type="button" class="btn btn-secondary" onclick="showReplyContainer(${Date.now()})">↳답글쓰기</button>` : ''}
            <div id="replies-${Date.now()}" class="replies"></div>
        </div>
    `;

    replyTable.appendChild(commentDiv);

    // 입력 필드 초기화
    if (parentId) {
        document.getElementById(`reply-content-${parentId}`).value = '';
    } else {
        document.getElementById('reply-content').value = '';
    }
} */

function showReplyContainer(commentId, boardKind, boardNo) {
    let replyInputContainer = document.getElementById(`reply-input-container-${commentId}`);

    if (!replyInputContainer) {
        replyInputContainer = document.createElement('div');
        replyInputContainer.id = `reply-input-container-${commentId}`;
        replyInputContainer.innerHTML = `
            <form id="reply-form-${commentId}" method="post" action="reply?kind=${boardKind}&no=${boardNo}&rereply_no=${commentId}">
                <textarea id="reply-content-${commentId}" class="form-control input-reply" placeholder="대댓글을 작성해주세요" name="replyContent"></textarea>
                <button class="btn reply-reply-submit" type="submit">등록</button>
            </form>
        `;
        document.getElementById(`replies-${commentId}`).appendChild(replyInputContainer);
    } else {
        replyInputContainer.style.display = replyInputContainer.style.display === 'none' ? 'block' : 'none';
    }
}