package com.ss.sns.member.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.member.sevice.MemberService;

@Controller
public class LoginController {
	@Autowired
	public MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@GetMapping("/login")
	public String loginGET(){
		
		return "signup/login";
	}
	@PostMapping("/login")
	public String loginPost(HttpServletRequest request,MemberDTO member,RedirectAttributes attr) throws Exception {
		
//		System.out.println("login");
//		System.out.println("value" + member);
		HttpSession session = request.getSession();
		MemberDTO nowMem = service.memberLogin(member);
		System.out.println(nowMem);
		 if(nowMem == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
	            
	            int result = 0;
	            attr.addFlashAttribute("result", result);
	            return "redirect:/login";
	            
	        }
	        
	        session.setAttribute("member", nowMem);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
	        
	        return "redirect:/"; 
	}
	
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
