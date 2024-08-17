package com.ss.sns.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ss.sns.main.dto.CityDTO;
import com.ss.sns.main.service.MainPageService;

@RestController
public class MainPageController {
	@Autowired
	MainPageService service;

	/*
	 * @GetMapping("/searchcity") public ResponseEntity<List<CityDTO>>searchCity(){
	 * 
	 * }
	 */
	
	
}
