package com.ss.sns.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.sns.member.dto.MemberDTO;

@Controller
public class MypageController {

	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		
		MemberDTO Session = (MemberDTO)session.getAttribute("member");
			return "mypage/mypage";
	}
	
	


	@RequestMapping("/profile")
	public String setting() {
		return "mypage/setting";
	}
}
