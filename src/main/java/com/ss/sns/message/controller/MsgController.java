package com.ss.sns.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MsgController {
	@RequestMapping("/message")
	public String message() {
		return "message/message";
	}
}
