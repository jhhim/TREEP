package com.ss.sns.trip.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.trip.dto.TripDTO;

import com.ss.sns.trip.service.TripService;

@Controller
@SessionAttributes("tripData")
public class MakeTripController {
		
    
    @Autowired
    private TripService tripService;
    
	@RequestMapping("/maketrip")
	public String maketrip(Locale locale, Model model) {		
		return "trip/maketrip";
	}
	


	    @PostMapping("/submittrip")
	    @ResponseBody
	    public String submittrip(@ModelAttribute TripDTO tripdto, HttpSession session) {
	        MemberDTO loggedInMember = (MemberDTO) session.getAttribute("member");

	        if (loggedInMember == null) {
	            return "redirect:/login";
	        }

	        session.setAttribute("tripData", tripdto);
	        System.out.println("TripDTO : " + tripdto);
	        tripService.saveTrip(tripdto, loggedInMember);

	        return "mypage/mypage"; // Respond with a success message or status
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