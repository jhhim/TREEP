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

			success : function(replyList) {
								$('#comment-container').empty();
								replyList.forEach(function(reply) {
							        if (reply.rereply_no === 0) {
							            let commentHtml = 
							                '<div class="comment" id="comment-' + reply.reply_no + '">' +
							                    '<div class="row">' +
							                        '<div class="col-12">' +
							                            '<span class="reply-writer">작성자</span>' +
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
                                '<textarea id="reply-textarea-' + reply.reply_no + '">' + reply.reply_content + '</textarea>' +
                                '<button id="save-btn-' + reply.reply_no + '">저장</button>' +
                            '</div>' +
							                    '<div class="row">' +
							                        '<div class="col-12">' +
							                            '<span style="color: gray;">' + reply.reply_date + '</span>' +
							                            '<button type="button" class="btn btn-secondary" onclick="showReplyContainer('+reply.reply_no+')">↳답글쓰기</button>' +
							                        '</div>' +
							                    '</div>' +
							                    '<div id="replies-' + reply.reply_no + '" class="replies">';

							            reply.reReplyList.forEach(function(subReply) {
							                commentHtml += 
							                    '<div class="comment sub-comment">' +
							                        '<div class="row">' +
							                            '<div class="col-12">' +
							                                '<span class="reply-writer">작성자</span>' +
							                                '<span class="reply-manage dropdown">' +
							                                    '<button class="btn dropdown-toggle no-arrow" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-weight: bold;">⋮</button>' +
							                                    '<ul class="dropdown-menu">' +
							                                        '<li><a class="dropdown-item" href="#">신고하기</a></li>' +
							                                        '<li><a class="dropdown-item" href="#">쪽지보내기</a></li>' +
							                                        '<li><a class="dropdown-item" href="#">수정</a></li>' +
							                     				     '<li><a class="dropdown-item delete-sub-reply-btn" href="#" data-reply-no="' + subReply.reply_no + '">삭제</a></li>' +
							                                    '</ul>' +
							                                '</span>' +
							                            '</div>' +
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
							error : function(e) {
								console.error(e);
								alert('전송 실패!!');
							}
						});
			}


$(document).ready(function() {
    loadReply();
});

/****************************************** 댓글 추가 *************************************************/
  $('#reply-submit').click(function() {
        const replyContent = $('#reply-content').val();
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
        const reReplyContent = $(`#reply-content-${commentId}`).val();

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
            'member_no': memberNo // 댓글 수정 권한을 확인하기 위한 헤더
        },
        contentType: 'application/json',
        data: JSON.stringify({
            reply_content: updatedContent
        }),
        success: function() {
            alert('댓글이 수정되었습니다.');
            loadReply(); // 댓글 목록 갱신
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

    // 수정된 내용을 표시하고 편집 영역 숨기기
    const replyContentElement = $(`#comment-${replyNo} .reply-content`);
    replyContentElement.text(updatedContent).css('display', 'block');
    
    const editSection = $(`#edit-section-${replyNo}`);
    editSection.css('display', 'none');
});
