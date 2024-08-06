package com.ss.sns.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	@RequestMapping("/mypage/setting")
	public String setting() {
		return "mypage/setting";
	}
}
