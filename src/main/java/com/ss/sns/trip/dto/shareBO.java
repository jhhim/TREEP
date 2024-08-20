package com.ss.sns.trip.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class shareBO {
	int trip_no;
	int member_no;
	String member_nickname;
	String trip_title;
}
