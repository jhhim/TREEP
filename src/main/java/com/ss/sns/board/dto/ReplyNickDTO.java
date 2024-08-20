package com.ss.sns.board.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReplyNickDTO {
	private int reply_no; 
	private int rereply_no;
	private List<ReplyNickDTO> reReplyList;
	private int board_no; 
	private int member_no;
	private String reply_content; 
	private String reply_status_yn;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private LocalDateTime reply_date;
	private String member_nickName;
}