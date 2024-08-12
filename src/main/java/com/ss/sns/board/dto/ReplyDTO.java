package com.ss.sns.board.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReplyDTO {
	private int reply_no; 
	private int rereply_no;
	private ArrayList<ReplyDTO> reReplyList;
	private int board_no; 
	private int member_no;
	private String reply_content; 
	private String reply_status_yn;
	private LocalDateTime reply_date;
}
