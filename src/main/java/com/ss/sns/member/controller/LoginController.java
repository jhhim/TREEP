package com.ss.sns.member.controller;



import javax.inject.Inject;

import org.apache.ibatis.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.member.sevice.MemberService;

@Controller
public class LoginController {
	@Autowired
	public MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/emailcheck")
    public String signup() {
        return "signup/email";
    }
	
	@GetMapping("/signupinfo")
	public String signupInfoGET(){
		logger.info("회원가입 입력 페이지 get");
//		service.memberSignup(member);
		
		logger.info("회원가입 성공");
		return "signup/signup";
		
	}
	@PostMapping("/signupinfo")
	public String signupInfo(MemberDTO member) throws Exception {
		logger.info("회원가입 입력 페이지 post");
		System.out.println(member.toString());
		service.memberSignup(member);
		
		
		logger.info("회원가입 성공");
		
		return "redirect:/";
	}
	@RequestMapping("/searchid")
	public String searchID() {
		return "signup/searchID";
	}
	@RequestMapping("/searchpw")
	public String searchPW() {
		return "signup/searchPW";
	}
	@RequestMapping("/changepw")
	public String changePW() {
		return "signup/changePW";
	}
}
