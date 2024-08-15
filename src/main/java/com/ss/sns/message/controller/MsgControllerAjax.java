package com.ss.sns.message.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.message.dto.MsgPage;
import com.ss.sns.message.service.MsgService;

@RequestMapping("/Msg")
@RestController
public class MsgControllerAjax {

	@Autowired
	private MsgService service;
	
	
	@RequestMapping("/RevList")
	public ResponseEntity<MsgPage> selectMsgRev (@RequestParam(value="page", defaultValue = "1") int currentPage, Model model, HttpSession session) {
		// session이 누군지에 따라서 보여주기(현재는 임의로 1인애 찾기)\
		
		MemberDTO Session = (MemberDTO)session.getAttribute("member");
	
		// 세션에 있는 memberDTO에서 닉네임 값 받아서 디비에서 member_no값 가져오기
		int member_no = service.getMemberNo(Session.getMember_nickname());
		
		// 세션에 있는 멤버한테 온 메시지 전체 개수
		int MessageTotalCount = service.selectMessageRevCount(member_no);
		int pageSize = 2;
		
//		받은 쪽지함
		MsgPage msgPage = new MsgPage(pageSize, MessageTotalCount, currentPage);
		Map<String, Integer> hmap = new HashMap<String,Integer>();
		
		hmap.put("startNo", msgPage.getStartNo());
		hmap.put("endNo", msgPage.getEndNo());
		hmap.put("message_rev", member_no);
		
		
		// map 형식의 변수를 넘겨줘서 MsgList1(RevDTO)에 디비에서 넘어온 값 모두 저장하기
		msgPage.setMsgList1(service.selectMessageRevList(hmap));
		System.out.println("RevDTOList"+msgPage.getMsgList1());
//		model.addAttribute("msgPage",msgPage);
		

		
		return ResponseEntity.status(HttpStatus.OK).body(msgPage);
	}
	
}
