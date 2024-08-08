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
	private int MESSAGE_NO;	//메세지 번호
	private int MEMBER_NO;	//얘가 보낸거 아님?
	private String MESSAGE_CONTENT;	//메세지 내용
	private int MESSAGE_SEN;	//	댁은 뉘슈
	private int MESSAGE_REV;	//	?????
	private LocalDateTime SEND_DATE;	//보낸 날짜,시간
	private String MESSAGE_STATUS_YN;	//읽음 상태
}
