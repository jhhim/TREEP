package com.ss.sns.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.mypage.dto.MyBoardDTO;
import com.ss.sns.mypage.dto.MypagePage;
import com.ss.sns.mypage.service.MypageService;


@Controller
public class WriteLikeController {

	
	@Autowired
	private MypageService service;
	
	@RequestMapping("/MyWrite")
	@ResponseBody
	public Map<String,Object> selecMyWrite(@RequestParam(value="page", defaultValue = "1") int currentPage, HttpSession session){
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		MemberDTO Session = (MemberDTO)session.getAttribute(("member"));
		int member_no = Session.getMember_no();
		int pageSize = 2;
		int BoardTotalCount = service.selectBoardTotalCount(member_no);
		MypagePage mypage = new MypagePage(pageSize, BoardTotalCount, currentPage);
		Map<String, Integer> myBmap = new HashMap<String,Integer>();
		
		myBmap.put("startNo", mypage.getStartNo());
		myBmap.put("endNo", mypage.getEndNo());
		myBmap.put("member_no", member_no);
		
		mypage.setBoardList(service.selectMyBoardList(myBmap));
		
		result.put("startNo", mypage.getStartNo());
		result.put("endNo", mypage.getEndNo());
		result.put("member_no", member_no);
		result.put("MyWriteBoard", mypage.getBoardList());
		
		return result;
	}
	
	
	
	
}
