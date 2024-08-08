package com.ss.sns.message.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/***************************** 페이징 해야함 *****************************/
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MsgDTO {
	private int MESSAGE_NO;				// 메세지 번호
	private String MESSAGE_CONTENT;		// 메세지 내용
	private int MESSAGE_SEN;			// 메세지 보낸 멤버 번호
	private int MESSAGE_REV;			// 메세지 받은 멤버 번호
	private LocalDateTime SEND_DATE;	// 보낸 날짜,시간
	private String MESSAGE_STATUS_YN;	// 읽음 상태
}
