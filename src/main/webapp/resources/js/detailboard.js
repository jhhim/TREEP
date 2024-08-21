var boardContent = $('#contentDiv').html();
    
    var formattedContent = boardContent.replace(/\n/g, '<br/>');
    $('#contentDiv').html(formattedContent);



let isProcessing = false;





// 좋아요 버튼 클릭 이벤트 핸들러
$('#like').on('click', function() {
    if (isProcessing) return; 

    let $likeImg = $(this);
    let currentSrc = $likeImg.attr('src');
    let newSrc = currentSrc.includes('white_heart.png') 
        ? `${basePath}/resources/img/detailboard/red_heart.png` 
        : `${basePath}/resources/img/detailboard/white_heart.png`;
    let action = currentSrc.includes('white_heart.png') ? 'like' : 'unlike';

    isProcessing = true;

    $.ajax({
        url: `${basePath}/updatelike`,
        type: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        data: $.param({
            board_no: boardNo,
            member_no: memberNo,
            action: action
        }),
        success: function(response) {
            if (response.success) {
                $likeImg.attr('src', newSrc);
                $('#likeCount').text(response.newLikeCount !== undefined ? response.newLikeCount : 0);
            } else {
                alert('좋아요 업데이트에 실패했습니다. 나중에 다시 시도해 주세요.');
            }
        },
        error: function(xhr, status, error) {
            console.error('Error status:', status);
            console.error('Error:', error);
            alert('서버와의 통신에 실패했습니다. 나중에 다시 시도해 주세요.');
        },
        complete: function() {
            isProcessing = false;
        }
    });
});

// 페이지 로드 시 좋아요 수 가져오기

    $.ajax({
        url: `${basePath}/getLikeCount`,
        type: 'GET',
        data: {
            board_no: boardNo
        },
        success: function(response) {
            $('#likeCount').text(response.newLikeCount !== undefined ? response.newLikeCount : 0);
        },
        error: function(xhr, status, error) {
            console.error('Error status:', status);
            console.error('Error:', error);
            $('#likeCount').text('0');
        }
    });
    $.ajax({
        url: `${basePath}/isLiked`,
        type: 'GET',
        data: {
            board_no: boardNo,
            member_no: memberNo
        },
        success: function(response) {
            let liked = response.liked;
            let $likeImg = $('#like');
            let newSrc = liked
                ? `${basePath}/resources/img/detailboard/red_heart.png`
                : `${basePath}/resources/img/detailboard/white_heart.png`;
            $likeImg.attr('src', newSrc);
        },
        error: function(xhr, status, error) {
            console.error('Error status:', status);
            console.error('Error:', error);
        }
    });
    
    function showReplyContainer(commentId, boardKind, boardNo) {
    let replyInputContainer = document.getElementById(`reply-input-container-${commentId}`);
    if (!replyInputContainer) {
        replyInputContainer = document.createElement('div');
        replyInputContainer.id = `reply-input-container-${commentId}`;
        replyInputContainer.innerHTML = `
<div id="reply-container-${commentId}">
    <textarea id="reply-content-${commentId}" class="form-control input-reply" placeholder="댓글을 작성해주세요" name="replyContent"></textarea>
    <button class="btn" id="reply-reply-submit" type="button">등록</button>
</div>
        `;
        document.getElementById(`replies-${commentId}`).appendChild(replyInputContainer);
    } else {
        replyInputContainer.style.display = replyInputContainer.style.display === 'none' ? 'block' : 'none';
    }
}
/****************************************** 댓글 조회 *************************************************/
function loadReply() {
    $.ajax({
        method: 'get',
        url: `${basePath}/reply`,
        data: {
            kind: boardKind,
            no: boardNo
        },
        contentType: 'application/json',
        dataType: 'json',
        success: function(replyList) {
            $('#comment-container').empty();
            replyList.forEach(function(reply) {
                if (reply.rereply_no === 0) {
                    let commentHtml = 
                        '<div class="comment" id="comment-' + reply.reply_no + '">' +
                            '<div class="row">' +
                                '<div class="col-12">' +
                                    '<span class="reply-writer">' + reply.member_nickName + '</span>' + // member_nickName으로 수정
                                    '<span class="reply-manage dropdown">' +
                                        '<button class="btn dropdown-toggle no-arrow" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-weight: bold;">⋮</button>' +
                                        '<ul class="dropdown-menu">' +
                                            '<li><a class="dropdown-item" href="#">신고하기</a></li>' +
                                            '<li><a class="dropdown-item" href="#">쪽지보내기</a></li>' +
                                            '<li><a class="dropdown-item update-reply-btn" href="#">수정</a></li>' +
                                            '<li><a class="dropdown-item delete-reply-btn" href="#" data-reply-no="' + reply.reply_no + '">삭제</a></li>' +
                                        '</ul>' +
                                    '</span>' +
                                '</div>' +
                            '</div>' +
                            '<div class="row">' +
                                '<div class="col-12">' +
                                    '<span class="reply-content">' + reply.reply_content + '</span>' +
                                '</div>' +
                            '</div>' +
                             '<div id="edit-section-' + reply.reply_no + '" class="edit-section" style="display: none;">' +
                                '<textarea id="reply-textarea-' + reply.reply_no + '" class="reply-modify">' + reply.reply_content + '</textarea>' +
                                '<button id="save-btn-' + reply.reply_no + '">저장</button>' +
                            '</div>' +
                            '<div class="row">' +
                                '<div class="col-12">' +
                                    '<span style="color: gray;">' + reply.reply_date + '</span>' +
                                    '<button type="button" class="btn btn-secondary" onclick="showReplyContainer(' + reply.reply_no + ')">↳답글쓰기</button>' +
                                '</div>' +
                            '</div>' +
                            '<div id="replies-' + reply.reply_no + '" class="replies">';

                    reply.reReplyList.forEach(function(subReply) {
                        commentHtml += 
                            '<div class="comment sub-comment">' +
                                '<div class="row">' +
                                    '<div class="col-12">' +
                                        '<span class="reply-writer">' + subReply.member_nickName + '</span>' + // member_nickName으로 수정
                                        '<span class="reply-manage dropdown">' +
                                            '<button class="btn dropdown-toggle no-arrow" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-weight: bold;">⋮</button>' +
                                            '<ul class="dropdown-menu">' +
                                                '<li><a class="dropdown-item" href="#">신고하기</a></li>' +
                                                '<li><a class="dropdown-item" href="#">쪽지보내기</a></li>' +
                                                '<li><a class="dropdown-item update-sub-reply-btn" href="#">수정</a></li>' +
                                                '<li><a class="dropdown-item delete-sub-reply-btn" href="#" data-reply-no="' + subReply.reply_no + '">삭제</a></li>' +
                                            '</ul>' +
                                        '</span>' +
                                    '</div>' +
                                '</div>' +
                                '<div id="edit-sub-section-' + subReply.reply_no + '" class="edit-section" style="display: none;">' +
                                    '<textarea id="sub-reply-textarea-' + subReply.reply_no + '" class="reply-modify">' + subReply.reply_content + '</textarea>' +
                                    '<button id="save-sub-btn-' + subReply.reply_no + '">저장</button>' +
                                '</div>' +
                                '<div class="row">' +
                                    '<div class="col-12">' +
                                        '<span class="reply-content">' + subReply.reply_content + '</span>' +
                                    '</div>' +
                                '</div>' +
                                '<div class="row">' +
                                    '<div class="col-12">' +
                                        '<span style="color: gray;">' + subReply.reply_date + '</span>' +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                    });

                    commentHtml += '</div></div>';
                    $('#comment-container').append(commentHtml);
                }
            });
        },
        error: function(e) {
            console.error(e);
            alert('전송 실패!!');
        }
    });
}

loadReply();

/****************************************** 댓글 추가 *************************************************/
 $('#reply-submit').click(function() {
    const replyContent = $('#reply-content').val().trim();
    if (!replyContent) {
        alert('댓글 내용을 입력해주세요.');
        return;
    }
        $.ajax({
            url: `${basePath}/reply`,
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                reply_content: replyContent,
                board_no: boardNo,
                member_no: memberNo
            }),
           success: function() {
             alert('댓글이 등록되었습니다.');
                loadReply();
                $('#reply-content').val('');
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });

});
/****************************************** 대댓글 추가 *************************************************/
     $(document).on('click', '#reply-reply-submit', function() {

        commentId = $(this).closest('[id^="reply-input-container-"]').attr('id').split('-').pop();
        const reReplyContent = $(`#reply-content-${commentId}`).val().trim();
 if (!reReplyContent) {
        alert('댓글 내용을 입력해주세요.');
        return;
    }
        $.ajax({
            method: 'POST',
          	 url: `${basePath}/reply/reply`,
            contentType: 'application/json',
            data: JSON.stringify({           
                board_no: boardNo,
                member_no: memberNo,
                reply_content: reReplyContent,
                rereply_no: commentId 
            }),
            success: function() {
                alert('댓글이 등록되었습니다.');
                loadReply();
                $(`#reply-content-${commentId}`).val('');
            },
            error: function(error) {
                console.error('댓글 등록 실패:', error);
                alert('댓글 등록에 실패했습니다.');
            }
        });
    });

/******************************************* 댓글 삭제 ****************************************************/
function deleteReply(replyNo) {
    $.ajax({
        method: 'DELETE',
        url: `${basePath}/reply/${replyNo}`,
        headers: {
            'member_no': memberNo
        },
        success: function() {
            alert('댓글이 삭제되었습니다.');
            loadReply();
        },
               error: function(xhr, status, error) {
            if (xhr.status === 403) {
                alert('본인이 작성한 댓글만 삭제 가능합니다.');
            } else {
                console.error('댓글 삭제 실패:', error);
                alert('댓글 삭제에 실패했습니다.');
            }
        }
    });
}


$(document).on('click', '.delete-reply-btn', function(e) {
    e.preventDefault();
    const replyNo = $(this).data('reply-no'); 
    if (confirm('이 댓글을 정말 삭제하시겠습니까?')) {
        deleteReply(replyNo);
    }
});
/******************************************* 대댓글 삭제 ****************************************************/
$(document).on('click', '.delete-sub-reply-btn', function(e) {
    e.preventDefault();
    const replyNo = $(this).data('reply-no'); 
    if (confirm('이 댓글을 정말 삭제하시겠습니까?')) {
        deleteReply(replyNo);
    }
});
/************************************* 댓글 수정 *******************************************/
$(document).on('click', '.update-reply-btn', function() {
	event.preventDefault();
    const replyNo = $(this).closest('.comment').attr('id').split('-').pop();
    const commentContent = $(`#comment-${replyNo} .reply-content`).text();
 	const replyContentElement = $(`#comment-${replyNo} .reply-content`);
 	replyContentElement.css('display', 'none');
    $(`#edit-section-${replyNo}`).show();
    $(`#reply-textarea-${replyNo}`).val(commentContent);
	
});
$(document).on('click', `[id^="save-btn-"]`, function() {
    const replyNo = $(this).attr('id').split('-').pop();
    const updatedContent = $(`#reply-textarea-${replyNo}`).val();

    $.ajax({
        method: 'PUT',
        url: `${basePath}/reply/${replyNo}`,
        headers: {
            'member_no': memberNo
        },
        contentType: 'application/json',
        data: JSON.stringify({
            reply_content: updatedContent
        }),
        success: function() {
            alert('댓글이 수정되었습니다.');
            loadReply();
        },
        error: function(xhr, status, error) {
            if (xhr.status === 403) {
                alert('본인이 작성한 댓글만 수정 가능합니다.');
            } else {
                console.error('댓글 수정 실패:', error);
                alert('댓글 수정에 실패했습니다.');
            }
        }
    });
    const replyContentElement = $(`#comment-${replyNo} .reply-content`);
    replyContentElement.text(updatedContent).css('display', 'block');
    
    const editSection = $(`#edit-section-${replyNo}`);
    editSection.css('display', 'none');
});

/******************************대댓글 수정***************************************/
$(document).on('click', '.update-sub-reply-btn', function(event) {
    event.preventDefault();

    const commentElement = $(this).closest('.sub-comment');
    const editSectionId = commentElement.find('.edit-section').attr('id');
    
    if (editSectionId) {
        const replyNo = editSectionId.split('-').pop();
        const editSection = commentElement.find(`#edit-sub-section-${replyNo}`);
        editSection.show();     
        const replyContentElement = commentElement.find('.reply-content');
        $(`#sub-reply-textarea-${replyNo}`).val(replyContentElement.text());
        replyContentElement.hide();
    } else {
        console.error('대댓글 ID를 찾을 수 없습니다.');
    }
});
$(document).on('click', '[id^="save-sub-btn-"]', function() {
    const replyNo = $(this).attr('id').split('-').pop();
    const updatedContent = $(`#sub-reply-textarea-${replyNo}`).val();

    $.ajax({
        method: 'PUT',
        url: `${basePath}/reply/${replyNo}`,
        headers: {
            'member_no': memberNo
        },
        contentType: 'application/json',
        data: JSON.stringify({
            reply_content: updatedContent
        }),
        success: function() {
            alert('댓글이 수정되었습니다.');
            loadReply();
        },
        error: function(xhr, status, error) {
            if (xhr.status === 403) {
                alert('본인이 작성한 댓글만 수정 가능합니다.');
            } else {
                console.error('대댓글 수정 실패:', error);
                alert('댓글 수정에 실패했습니다.');
            }
        }
    });
    const commentElement = $(`#edit-sub-section-${replyNo}`).closest('.sub-comment');
    commentElement.find('.reply-content').text(updatedContent).show();
    commentElement.find(`#edit-sub-section-${replyNo}`).hide();
});


/**************************** 댓글 수 불러오기 ***************************/
function loadReplyCount() {
    $.ajax({
        method: 'GET',
        url: `${basePath}/reply/count`,
        data: {
            kind: boardKind,
            no: boardNo
        },
        contentType: 'application/json',
        dataType: 'json',
        success: function(response) {
            const replyCount = response || 0;
            $('.reply-count').text(replyCount);
        },
        error: function(xhr, status, error) {
            console.error('댓글 수 조회 실패:', error);
            $('.reply-count').text('댓글 수를 불러오는 데 실패했습니다.');
        }
    });
}
 loadReplyCount();


/**************************** 신고처리 ***************************/


function MoveBoard(){

const queryString = window.location.search;

const urlParams = new URLSearchParams(queryString);


const kind = urlParams.get('kind');
const no = urlParams.get('no');

 location.href='MoveBoard?kind=' + kind + '&no=' + no;


}

/**************************** 게시물 삭제처리 ***************************/


function DeleteBoard(){

const queryString = window.location.search;

const urlParams = new URLSearchParams(queryString);


const kind = urlParams.get('kind');
const no = urlParams.get('no');

 location.href='deleteBoard?kind=' + kind + '&no=' + no;


}


/*************************클립보드************************/

function clipboard(){
	let clip = document.createElement("input");
	const url = location.href;
	
	document.body.appendChild(clip);
	clip.value = url;
	clip.select();
	document.execCommand("copy");
	alert("클립보드에 복사했습니다.");
	document.body.removeChild(clip);
}


function sendMessageboard() {
    const recipientName = document.getElementById('send-recipient-nameb').value;
    const messageText = document.getElementById('send-message-textb').value;
    location.href = 'SendMessageb?recipient_name=' + recipientName + '&message_text=' + messageText;
}
