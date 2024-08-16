package com.ss.sns.trip.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


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
    public String submittrip(@ModelAttribute TripDTO tripdto
    						) {
    	System.out.println("TripDTO : "+tripdto);
    	tripService.saveTrip(tripdto);
    	
        return "redirect:/"; 
    }
	
	

	
}