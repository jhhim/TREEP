package com.ss.sns.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.main.dto.CityDTO;

@Mapper
public interface MainPageMapper {

	List<CityDTO> searchCity(String searchText);
	List<CityDTO> selectAllCity();
	List<CityDTO> FilterCity(String category);

}
