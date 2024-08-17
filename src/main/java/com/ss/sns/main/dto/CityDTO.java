package com.ss.sns.main.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CityDTO {
	private int city_no;
	private String city_kor;
	private String city_name;
	private String city_img;
	private String city_info;
}
