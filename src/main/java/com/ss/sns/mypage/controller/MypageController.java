package com.ss.sns.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.mypage.service.MypageService;


@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	
	
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		
		MemberDTO Session = (MemberDTO)session.getAttribute("member");
		
		model.addAttribute("nickname",Session.getMember_nickname()); 
//		int member_no = service.getMemberNo(Session.getMember_nickname());
		
	
		
		
			return "mypage/mypage";
	}
	
	


	@RequestMapping("/profile")
	public String setting(Model model, HttpSession session) {
		
		MemberDTO Session = (MemberDTO)session.getAttribute("member");
		
		model.addAttribute("nickname",Session.getMember_nickname()); 
		return "mypage/setting";
	}
	
	
	@RequestMapping("/profileModify")
	public String profileModify() {
		
		return "mypage/mypage";
	}
	
}
