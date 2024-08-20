package com.ss.sns.message.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.message.dto.MsgPage;
import com.ss.sns.message.service.MsgService;

@Controller
public class MsgController {
	
	@Autowired
	private MsgService service;
	
	
	@RequestMapping("/message")
	public String message(@RequestParam(value="page", defaultValue = "1") int currentPage,
						  @RequestParam(value="page2", defaultValue = "1") int currentPage2,
						  @RequestParam(value="page3", defaultValue = "1") int currentPage3,
						  Model model, HttpSession session) {
		// session이 누군지
		
		MemberDTO Session = (MemberDTO)session.getAttribute("member");
	
		// 세션에 있는 memberDTO에서 닉네임 값 받아서 디비에서 member_no값 가져오기
		int member_no = service.getMemberNo(Session.getMember_nickname());
		
		// 세션에 있는 멤버한테 온 메시지 전체 개수
		int MessageTotalCount = service.selectMessageRevCount(member_no);
		int pageSize = 8;
		
//		받은 쪽지함
		MsgPage msgPage = new MsgPage(pageSize, MessageTotalCount, currentPage);
		Map<String, Integer> hmap = new HashMap<String,Integer>();
		
		hmap.put("startNo", msgPage.getStartNo());
		hmap.put("endNo", msgPage.getEndNo());
		hmap.put("message_rev", member_no);
		
		
		// map 형식의 변수를 넘겨줘서 MsgList1(RevDTO)에 디비에서 넘어온 값 모두 저장하기
		msgPage.setMsgList1(service.selectMessageRevList(hmap));
//		System.out.println("DTOList"+msgPage.getMsgList1());
		
//		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		 DateTimeFormatter parseFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		 String formattedDate = null;
//		 
//		for (int i = 0; i < msgPage.getMsgList1().size(); i++) {
//			LocalDateTime send_date = msgPage.getMsgList1().get(i).getSend_date();
//			formattedDate = send_date.format(formatter);
//			LocalDateTime parsedDate = LocalDateTime.parse(formattedDate, parseFormatter);
//			msgPage.getMsgList1().get(i).setSend_date(parsedDate);
//		}
		
//		System.out.println(msgPage.getMsgList1());
		model.addAttribute("msgPage",msgPage);
		
//		보낸쪽지함
		
		int MessageTotalCount2 = service.selectMessageSenCount(member_no);
		MsgPage msgPage2 = new MsgPage(pageSize, MessageTotalCount2, currentPage2);
		Map<String, Integer> hmap2 = new HashMap<String,Integer>();
		
		hmap2.put("startNo", msgPage2.getStartNo());
		hmap2.put("endNo", msgPage2.getEndNo());
		hmap2.put("message_sen", member_no);
		
		msgPage2.setMsgList2(service.selectMessageSenList(hmap2));
		model.addAttribute("msgPage2", msgPage2);
		
//      보관쪽지함
		int MessageTotalCount3 = service.selectMessageStoreCount(member_no);
		MsgPage msgPage3 = new MsgPage(pageSize, MessageTotalCount3, currentPage3);
		
		Map<String, Integer> hmap3 = new HashMap<String,Integer>();
		
		hmap3.put("startNo", msgPage3.getStartNo());
		hmap3.put("endNo", msgPage3.getEndNo());
		hmap3.put("message_rev", member_no);
		msgPage3.setMsgList1(service.selectMessageRevStoreList(hmap3));
		model.addAttribute("msgPage3",msgPage3);
		
		return "message/message";
	}
	

	
	
	// 받은쪽지함에서 쪽지 삭제
	@RequestMapping("/deleteRev")
	public String DeleteRev(@RequestParam(value="message_no") int msg_no){
		
		service.deleteRevMessage(msg_no);
		
		return "redirect:/message";
	}
	
	// 보낸쪽지함에서 쪽지 삭제
	@RequestMapping("/deleteSend")
	public String DeleteSend(@RequestParam(value="message_no") int msg_no){
		
		service.deleteSendMessage(msg_no);
		
		return "redirect:/message";
	}
	
	
	// 받은쪽지함에서 쪽지상세모달 들어가면 읽음처리 & 보낸쪽지함쪽에서도 처리
	@RequestMapping("/updateRev")
	public String updateRev(@RequestParam(value="message_no") int msg_no){
		
		service.updateRevStatus(msg_no);
		service.updateSenStatus(msg_no);
		return "redirect:/message";
	}
	
	// 받은쪽지 보관함으로 이동
	@RequestMapping("/RevStore")
	public String RevStore(@RequestParam(value="message_no") int msg_no) {
		service.updateRevStore(msg_no);
		service.updateRevStatus(msg_no);
		service.updateSenStatus(msg_no);
		
		return "redirect:/message";
	}
	
	// 보관함에서 삭제하여 받은쪽지로 다시 이동
	@RequestMapping("/RevStoreDelete")
	public String RevStoreDelete(@RequestParam(value="message_no") int msg_no) {
		service.updateRevStoreDelete(msg_no);
		
		return "redirect:/message";
	}
	
	// 쪽지 보내기
	@RequestMapping("/SendMessage")
	public String SendMessage(@RequestParam(value="recipient_name") String name, 
							  @RequestParam(value="message_text") String msgText,
							  HttpSession session,
							  RedirectAttributes redirectAttributes){
		Map<String, Object> sendMsg = new HashMap<String, Object>();
		

		MemberDTO Session = (MemberDTO)session.getAttribute("member");
		
		// 세션에 있는 memberDTO에서 닉네임 값 받아서 디비에서 member_no값 가져오기
		int SessionMember_No = service.getMemberNo(Session.getMember_nickname());

		Integer member_no = service.selectMsgMemberNo(name);
		
		if(member_no == null) {
			redirectAttributes.addFlashAttribute("nullMsg","존재하지 않는 닉네임 입니다.");
			return "redirect:/message";
		}

		sendMsg.put("message_sen", SessionMember_No);
		sendMsg.put("message_rev", member_no);
		sendMsg.put("text",msgText);
		
		service.SendMessage(sendMsg);
		service.RevStore(sendMsg);
		
		return "redirect:/message";
	}
	
	
	// 쪽지 보내기
		@RequestMapping("/SendMessageb")
		public String SendMessageb(@RequestParam(value="recipient_name") String name, 
								  @RequestParam(value="message_text") String msgText,
								  HttpSession session,
								  RedirectAttributes redirectAttributes){
			Map<String, Object> sendMsg = new HashMap<String, Object>();
			

			MemberDTO Session = (MemberDTO)session.getAttribute("member");
			
			// 세션에 있는 memberDTO에서 닉네임 값 받아서 디비에서 member_no값 가져오기
			int SessionMember_No = service.getMemberNo(Session.getMember_nickname());

			Integer member_no = service.selectMsgMemberNo(name);
			
			if(member_no == null) {
				redirectAttributes.addFlashAttribute("nullMsg","존재하지 않는 닉네임 입니다.");
				return "redirect:/message";
			}

			sendMsg.put("message_sen", SessionMember_No);
			sendMsg.put("message_rev", member_no);
			sendMsg.put("text",msgText);
			
			service.SendMessage(sendMsg);
			service.RevStore(sendMsg);
			
			return "redirect:/freeboard";
		}
	
	
	
}