package com.ss.sns.message.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/***************************** 페이징 해야함 *****************************/
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MsgRevDTO {
	private int message_no;               // 메세지 번호
	private String message_content;       // 메세지 내용
	private int message_sen;              // 메세지 보낸 멤버 번호
	private int message_rev;              // 메세지 받은 멤버 번호
	private LocalDateTime send_date;      // 보낸 날짜, 시간
	private String messagerev_status_yn;     // 읽음 상태
	private String store_status_yn; 		// 보관상태
}
