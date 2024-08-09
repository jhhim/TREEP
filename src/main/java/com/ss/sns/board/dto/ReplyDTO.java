package com.ss.sns.board.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReplyDTO {
	private int reply_no; // REPLY_NO
	private int rereply_no; // REREPLY_NO
	private int board_no; // BOARD_NO
	private int member_no; // MEMBER_NO
	private String reply_content; // REPLY_CONTENT
	private String reply_status_yn; // REPLY_STATUS_YN
	private LocalDateTime reply_date; // REPLY_DATE
}
