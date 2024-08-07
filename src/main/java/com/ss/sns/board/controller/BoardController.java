package com.ss.sns.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping("/freeboard")
	public String freeboard() {
		return "board/freeboard";
	}
	@RequestMapping("/joinboard")
	public String joinboard() {
		return "board/joinboard";
	}
	@RequestMapping("/inquiryboard")
	public String inquiryboard() {
		return "board/inquiryboard";
	}
	
	
}
