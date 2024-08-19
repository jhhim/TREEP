package com.ss.sns.trip.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.trip.dto.TripDTO;

import com.ss.sns.trip.service.TripService;

@Controller
public class MakeTripController {
		
    
    @Autowired
    private TripService tripService;
    
	@RequestMapping("/maketrip")
	public String maketrip(Locale locale, Model model) {		
		return "trip/maketrip";
	}
	
	@RequestMapping("/submittrip")
    public String submittrip(@ModelAttribute TripDTO tripdto,
    					HttpSession session
    						) {
	
		// 세션에서 현재 로그인한 멤버 정보를 가져옴
        MemberDTO loggedInMember = (MemberDTO) session.getAttribute("member");
        
        if (loggedInMember == null) {
            // 만약 로그인이 안 되어 있다면 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
        session.setAttribute("tripData", tripdto);

    	System.out.println("TripDTO : "+tripdto);
    	tripService.saveTrip(tripdto, loggedInMember);
    	
        return "redirect:/mypage";
    }

	@RequestMapping("/editTrip")
	public String editTrip(HttpSession session, Model model) {
	    // 세션에서 데이터를 불러오기
	    TripDTO tripdto = (TripDTO) session.getAttribute("tripData");
	    if (tripdto != null) {
	        model.addAttribute("tripdto", tripdto);
	    }
	    return "trip/editTrip";
	}
	

	
}