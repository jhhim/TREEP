package com.ss.sns.trip.dto;

import java.time.LocalDate;

import com.ss.sns.mypage.dto.MypageDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TripPlaceDTO {
    private int place_no;
    private String place_name;
}
