package com.ss.sns.board.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardDTO {
	private int BOARD_NO;			// 게시글 번호
	private int MEMBER_NO;			// 게시글 작성 멤버 번호
	private String BOARD_TYPE;		// 자유게시판 타입-잡담,정보,후기 어드민-공지
	private LocalDateTime DATE;		// 게시글 작성 날짜(시간)
	private String BOARD_TITLE;		// 게시글 제목
	private String BOARD_CONTENT;	// 게시글 내용
	private String BOARD_IMG;		// 게시글 이미지
	private int BOARD_HIT;			// 게시글 조회수
	private int BOARD_LIKE;			// 게시글 좋아요수
	private int BOARD_KIND;			// 게시글 분류 1-자유게시판 2-동행게시판 3-문의게시판
	private String BOARD_STATUS;	// 문의 게시판에서 게시글 상태 (답변대기,답변완료)
	private String BOARD_CONTINENT;	// 대륙 코드
}
