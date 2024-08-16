package com.ss.sns.trip.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.trip.dto.ScheduleDTO;
import com.ss.sns.trip.dto.TripDTO;
import com.ss.sns.trip.dto.TripPlaceDTO;
import com.ss.sns.trip.mapper.TripMapper;

@Service
@Transactional
public class TripService {

    @Autowired
    private TripMapper tripMapper;

    
    public void saveTrip(TripDTO trip, MemberDTO member) {
        // TRIP 테이블에 trip 삽입
        tripMapper.insertTrip(trip);

        // member_trip 테이블에 member_no와 trip_no 삽입
        Map<String, Object> params = new HashMap<>();
        params.put("member_no", member.getMember_no());
        params.put("trip_no", trip.getTrip_no());
        tripMapper.insertMemberTrip(params);

        // SCHEDULE 및 TRIP_PLACE 삽입 처리
        if (trip.getSchedules() != null) {
            for (ScheduleDTO schedule : trip.getSchedules()) {
                schedule.setTrip_no(trip.getTrip_no());
                tripMapper.insertSchedule(schedule);

                if (schedule.getPlaces() != null) {
                    for (TripPlaceDTO place : schedule.getPlaces()) {
                        place.setSchedule_no(schedule.getSchedule_no());
                        tripMapper.insertPlace(place);
                    }
                }
            }
        }
    }

}
