package com.ss.sns.message.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.sns.message.dto.MsgPage;
import com.ss.sns.message.service.MsgService;

@Controller
public class MsgController {
	
	@Autowired
	MsgService service;
	
	
	@RequestMapping("/message")
	public String message(@RequestParam(value="page", defaultValue = "1") int currentPage, Model model) {
		// session이 누군지에 따라서 보여주기(현재는 임의로 1인애 찾기)\
		
		int temp = 1020;
		int who = service.selectMemberNo(temp);
		System.out.println("회원번호 : " + who);
		
		// 세션에 있는 멤버한테 온 메시지 전체 개수
		int MessageTotalCount = service.selectMessageCount(temp);
		int pageSize = 2;
		
//		받은 쪽지함
		MsgPage msgPage = new MsgPage(pageSize, MessageTotalCount, currentPage);
		Map<String, Integer> hmap = new HashMap<String,Integer>();
		
		hmap.put("startNo", msgPage.getStartNo());
		hmap.put("endNo", msgPage.getEndNo());
		hmap.put("message_rev", temp);
		
		
		msgPage.setMsgList(service.selectMessageRevList(hmap));
		model.addAttribute("msgPage",msgPage);
		
//		보낸쪽지함
		MsgPage msgPage2 = new MsgPage(pageSize, MessageTotalCount, currentPage);
		Map<String, Integer> hmap2 = new HashMap<String,Integer>();
		
		hmap2.put("startNo", msgPage2.getStartNo());
		hmap2.put("endNo", msgPage2.getEndNo());
		hmap2.put("message_sen", temp);
		
		msgPage2.setMsgList(service.selectMessageSenList(hmap2));
		model.addAttribute("msgPage2", msgPage2);
		
		
		return "message/message";
	}
	
	
	@RequestMapping("/delete")
	public String Delete(@RequestParam(value="message_no") int msg_no){
		
		service.deleteRevMessage(msg_no);
		
		return "redirect:/message";
	}
	
	
	@RequestMapping("/SendMessage")
	public String SendMessage(@RequestParam(value="recipient_name") String id, @RequestParam(value="message_text") String msgText){
		Map<String, Object> sendMsg = new HashMap<String, Object>();
		
		
//		INSERT INTO MESSAGE(MESSAGE_NO, MESSAGE_CONTENT, MESSAGE_SEN, MESSAGE_REV, SEND_DATE, MESSAGE_STATUS_YN)
//		VALUES (DEFAULT,'안녕하세요10.',1020,1026,'2024-08-02','Y');

		int temp = 1020;
		System.out.println(id);
		System.out.println(msgText);
		
		int member_no = service.selectMsgMemberNo(id);
		
		
		sendMsg.put("message_sen", temp);
		sendMsg.put("message_rev", member_no);
		sendMsg.put("text",msgText);
		
		service.SendMessage(sendMsg);
		
		return "redirect:/message";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
