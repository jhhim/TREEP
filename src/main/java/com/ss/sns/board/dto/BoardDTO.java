package com.ss.sns.board.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/***************************** 페이징 해야함 *****************************/
@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardDTO {
	private int BOARD_NO;
	private int MEMBER_NO;
	private String BOARD_TYPE;
	private LocalDateTime DATE;
	private String BOARD_TITLE;
	private String BOARD_CONTENT;
	private String BOARD_IMG;
	private int BOARD_HIT;
	private int BOARD_LIKE;
	private int BOARD_KIND;
	private String BOARD_STATUS;
}
