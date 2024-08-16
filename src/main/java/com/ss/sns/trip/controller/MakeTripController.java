package com.ss.sns.trip.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.sns.trip.dto.ScheduleDTO;
import com.ss.sns.trip.dto.ScheduleDetailDTO;
import com.ss.sns.trip.dto.TripDTO;
import com.ss.sns.trip.dto.TripPlaceDTO;

@Controller
public class MakeTripController {
		
	@RequestMapping("/maketrip")
	public String maketrip(Locale locale, Model model) {		
		return "trip/maketrip";
	}
	
	@RequestMapping("/submittrip")
    public String submittrip(@ModelAttribute TripDTO tripDTO,
    						@ModelAttribute TripPlaceDTO tripPlacedto,
    						@ModelAttribute ScheduleDTO scheduledto,
    						@ModelAttribute ScheduleDetailDTO scheduleDeatildto) {
    	System.out.println("TripDTO : "+tripDTO);
    	System.out.println("TripPlaceDTO: "+ tripPlacedto);
    	System.out.println("scheduledto: "+ scheduledto);
    	System.out.println("scheduleDeatildto: "+ scheduleDeatildto);
    	
        return "redirect:/"; 
    }
	
	

	
}