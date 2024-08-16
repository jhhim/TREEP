package com.ss.sns.trip.dto;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ScheduleDTO {
    private int schedule_no;
    private int trip_no;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate schedule_date;
    private String schedule_content;
    
    private List<TripPlaceDTO> places; // 해당일에 방문할 장소 리스트


}
