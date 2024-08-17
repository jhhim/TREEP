package com.ss.sns.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.main.dto.CityDTO;
import com.ss.sns.main.mapper.MainPageMapper;

@Service
public class MainPageService {
	@Autowired
	MainPageMapper mapper;

	public List<CityDTO> searchCity(String searchText) {
		return mapper.searchCity(searchText);
	}

	public List<CityDTO> selectAllCity() {
		return mapper.selectAllCity();
	}
	
	
}
