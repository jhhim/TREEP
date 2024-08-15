package com.ss.sns.trip.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.sns.trip.dto.TripDTO;

@Controller
public class MakeTripController {
		
	@RequestMapping("/maketrip")
	public String maketrip(Locale locale, Model model) {		
		return "trip/maketrip";
	}
	
	@RequestMapping("/submittrip")
    public String submittrip(@ModelAttribute TripDTO tripDTO) {
    	System.out.println("TripDTO : "+tripDTO);
        return "redirect:/"; 
    }
	
	
}