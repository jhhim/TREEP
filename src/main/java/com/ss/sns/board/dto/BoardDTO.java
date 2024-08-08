package com.ss.sns.board.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardDTO {
	private int board_no;           // 게시글 번호
	private int member_no;          // 게시글 작성 멤버 번호
	private String board_type;      // 자유게시판 타입-잡담,정보,후기 어드민-공지 문의게시판-문의 동행게시판-동행
	private LocalDateTime date;    // 게시글 작성 날짜(시간)
	private String board_title;     // 게시글 제목
	private String board_content;   // 게시글 내용
	private String board_img;       // 게시글 이미지
	private int board_hit;          // 게시글 조회수
	private int board_like;         // 게시글 좋아요수
	private int board_kind;         // 게시글 분류 1-자유게시판 2-동행게시판 3-문의게시판
	private String board_status;    // 문의 게시판에서 게시글 상태 (답변대기,답변완료)
	private String board_continent; // 대륙 코드
}
