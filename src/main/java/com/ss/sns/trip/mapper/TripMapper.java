package com.ss.sns.trip.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.ss.sns.trip.dto.ScheduleDTO;
import com.ss.sns.trip.dto.TripDTO;
import com.ss.sns.trip.dto.TripPlaceDTO;

@Mapper
public interface TripMapper {
    
	@Insert("INSERT INTO TRIP (trip_title, trip_start, trip_end) VALUES (#{trip_title}, #{trip_start}, #{trip_end})")
    @Options(useGeneratedKeys = true, keyColumn = "trip_no", keyProperty = "trip_no")
    void insertTrip(TripDTO trip);
	
	@Insert("INSERT INTO SCHEDULE (trip_no, schedule_date, schedule_content) VALUES (#{trip_no}, #{schedule_date}, #{schedule_content})")
    @Options(useGeneratedKeys = true, keyColumn = "schedule_no", keyProperty = "schedule_no")
    void insertSchedule(ScheduleDTO schedule);

    @Insert("INSERT INTO TRIP_PLACE (place_name, schedule_no) VALUES (#{place_name}, #{schedule_no})")
    void insertPlace(TripPlaceDTO place);}
