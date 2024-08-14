package com.ss.sns.mypage.dto;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MypageDTO {
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_nickname;
	private String member_email;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate member_birth;
	private String member_gender;
	private LocalDate member_enroll;
	private String member_phone;
	private String member_type;
	private String member_img;
	private String member_grade;
	private String manager_yn;
}
