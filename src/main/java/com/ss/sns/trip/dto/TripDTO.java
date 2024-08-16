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
public class TripDTO {
    private int trip_no;
    private String trip_title;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate trip_start;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate trip_end;
    
    private List<ScheduleDTO> schedules; // 여행 일자별 스케줄 리스트

}
