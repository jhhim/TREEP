package com.ss.sns.member.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDTO {
	private int MEMBER_NO;
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_NAME;
	private String MEMBER_NICKNAME;
	private String MEMBER_EMAIL;
	private LocalDate DATE;
	private String MEMBER_GENDER;
	private LocalDate MEMBER_ENROLL;
	private String MEMBER_PHONE;
	private String MEMBER_TYPE;
	private String MEMBER_IMG;
	private String MEMBER_GRADE;
	private String MANAGER_YN;
}
