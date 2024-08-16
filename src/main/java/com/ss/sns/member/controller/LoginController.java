package com.ss.sns.member.controller;




import java.util.HashMap;
import java.util.Map;
import java.util.Random;


import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.member.dto.kakaoDTO;
import com.ss.sns.member.sevice.MemberService;

@Controller
public class LoginController {
	@Autowired
	public MemberService service;
	@Autowired
	private JavaMailSender mailsender;
	
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
	
	@GetMapping("/emailcheck")
    public String signup() {
        return "signup/email";
    }
	@RequestMapping("kakao/login")
	public String kakaoLogin(String code,Model model) throws Exception {
		String token = service.kakaoGetToken(code,model);
		
		 System.out.println("컨트롤러 토큰:" + token);
		 
		 // 사용자 정보 받아오기!
		 // 위에 받아온 access_token값을
		 // 이용해서 정보 받기 위해 매개변수로 
		 // 넘겨준다.
		 HashMap<String, String> userinfo = service.getUserInfo(token);
		 String nickname = userinfo.get("nickname");
		 String email = userinfo.get("email");
		 MemberDTO member = new MemberDTO();
		 member.setMember_email(email);
		 member.setMember_nickname(nickname);
		 System.out.println(member.toString());
		 model.addAttribute("nickname", nickname);
		 int result = service.kakaocheck(email);
		 System.out.println(result);
		 if (result == 0) {
			 service.kakaoSignup(member);
			 System.out.println("회원가입은 됐어유");
			 return "redirect:/kako/login";
		 }else {
			 return "redirect:/login/end";
		 }
		 
		 //System.out.println("닉네임:" + nickname);
		 
		 // 받아온 정보를 jsp 전송
 
	}
	
	@RequestMapping("/login/end")
	public String loginend(HttpServletRequest request,MemberDTO member,RedirectAttributes attr) throws Exception {
		
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
			
			
	
	@GetMapping("/emailchk")
	@ResponseBody
    public String mailCheckGet(String email) throws Exception{
		 logger.info("이메일 확인");
		 logger.info("인증번호 : " + email);
		 
		 Random random =new Random();
		 int checkNum = random.nextInt(888888) + 111111;
		 logger.info("인증번호 : " +checkNum);
		 
		 String setFrom = "alsehdns@naver.com";
			String toMail = email;
			String title = "회원가입 인증 이메일 입니다.";
			String content = "홈페이지를 방문해주셔서 감사합니다." +
							"<br><br>" +
							"인증 번호는 " + checkNum + " 입니다." +
							"<br>" +
							"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			
			try {
				
				MimeMessage message = mailsender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailsender.send(message);
				
			} catch (AddressException e) {
	            logger.error("잘못된 이메일 주소: " + toMail, e);
	            return "잘못된 이메일 주소입니다.";
	        } catch (MessagingException e) {
	            logger.error("메일 전송 실패", e);
	            return "메일 전송에 실패했습니다.";
	        } catch (Exception e) {
	            logger.error("기타 예외 발생", e);
	            return "오류가 발생했습니다.";
	        }
			System.out.println();
			String num = Integer.toString(checkNum);
        return num;
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
		
		return "redirect:/login";
	}
	@PostMapping("/signinfo/memberIdChk")
	@ResponseBody
	public String memberIdChk(String member_id) {
		logger.info("memberIdChk 실행");
		int result = service.idcheck(member_id);
		logger.info("결과 : " + result);
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
	}
	@PostMapping("/signinfo/memberNicknameChk")
	@ResponseBody
	public String memberNicknameChk(String member_nickname) {
		logger.info("memberIdChk 실행");
		int result = service.memberNicknameChk(member_nickname);
		logger.info("결과 : " + result);
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
	}
	@GetMapping("/emailcheck/memberemailChk")
	public String memberEmailChkGet(String member_email) {
	
		return "/emailcheck/memberemailChk";
		
	}
	@PostMapping("/emailcheck/memberemailChk")
	@ResponseBody
	public String memberEmailChk(String member_email) {
		
		
		int result = service.memberemailChk(member_email);
		logger.info("결과 : " + result);
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
	
	}
	@GetMapping("/logout")
	public String logoutGet(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
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
