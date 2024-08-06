package com.ss.sns.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	@RequestMapping("/signup")
    public String signup() {
        return "redirect:signup/email";
    }
	@RequestMapping("/signup/email")
    public String email() {
        return "signup/email";
    }
	@RequestMapping("/signup/signup")
	public String signup1() {
		return "signup/signup";
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
