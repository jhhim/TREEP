package com.ss.sns.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ss.sns.main.dto.CityDTO;
import com.ss.sns.main.service.MainPageService;

@RestController
public class MainPageController {
	@Autowired
	MainPageService service;

	@GetMapping("/searchcity")
	public ResponseEntity<List<CityDTO>> searchCity(@RequestParam(value = "searchText", defaultValue = "") String searchText) {
	
	    List<CityDTO> cityList;
	    
	    if (searchText == null || searchText.trim().isEmpty()) {
	        cityList = service.selectAllCity();
	    } else {
	        cityList = service.searchCity(searchText);
	    }
	    return ResponseEntity.ok(cityList);
	}
	@GetMapping("/filtercategory")
	public ResponseEntity<List<CityDTO>>filterCity(@RequestParam String category){
		List<CityDTO> cityList;
	    if ("all".equalsIgnoreCase(category)) {
	        category = "전체";
	    }
	    
	    if("전체".equalsIgnoreCase(category)) {
	    	cityList = service.selectAllCity();
	    }else {
	    	cityList = service.FilterCity(category);
	    }
	    return ResponseEntity.ok(cityList);
		
	}
	
}
