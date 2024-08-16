package com.ss.sns.trip.dto;

import java.time.LocalDate;

import org.springframework.lang.Nullable;

import com.ss.sns.mypage.dto.MypageDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TripPlaceDTO {
    private int place_no;
    
    @Nullable
    private String place_name;
    private int schedule_no; 

}
