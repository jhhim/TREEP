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
    <textarea id="reply-content-${commentId}" class="form-control input-reply" placeholder="대댓글을 작성해주세요" name="replyContent"></textarea>
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
							                                    '<li><a class="dropdown-item" href="#">수정</a></li>' +
							                                    '<li><a class="dropdown-item" href="#">삭제</a></li>' +
							                                '</ul>' +
							                            '</span>' +
							                        '</div>' +
							                    '</div>' +
							                    '<div class="row">' +
							                        '<div class="col-12">' +
							                            '<span class="reply-content">' + reply.reply_content + '</span>' +
							                        '</div>' +
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
							                                        '<li><a class="dropdown-item" href="#">삭제</a></li>' +
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
                member_no: memberId
            }),
           success: function() {
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
                member_no: memberId,
                reply_content: reReplyContent,
                rereply_no: commentId 
            }),
            success: function() {
                alert('댓글이 등록되었습니다.');
                loadReply();
                $(`#reply-content-${commentId}`).val('');
            },
            error: function(error) {
                console.error('대댓글 등록 실패:', error);
                alert('댓글 등록에 실패했습니다.');
            }
        });
    });





