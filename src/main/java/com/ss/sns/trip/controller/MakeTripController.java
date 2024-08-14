package com.ss.sns.trip.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MakeTripController {
		
	@RequestMapping("/maketrip")
	public String maketrip(Locale locale, Model model) {		
		return "trip/maketrip";
	}

	
}