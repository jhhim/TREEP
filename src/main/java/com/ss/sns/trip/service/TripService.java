package com.ss.sns.trip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.sns.trip.dto.ScheduleDTO;
import com.ss.sns.trip.dto.TripDTO;
import com.ss.sns.trip.dto.TripPlaceDTO;
import com.ss.sns.trip.mapper.TripMapper;

@Service
@Transactional
public class TripService {

    @Autowired
    private TripMapper tripMapper;


    public void saveTrip(TripDTO trip) {
        // Step 1: Insert trip and get trip_no
        tripMapper.insertTrip(trip);
        
        // Step 2: Iterate over schedules and insert them
        for (ScheduleDTO schedule : trip.getSchedules()) {
            schedule.setTrip_no(trip.getTrip_no());
            tripMapper.insertSchedule(schedule);

            // Step 3: Iterate over places and insert them
            for (TripPlaceDTO place : schedule.getPlaces()) {
                place.setSchedule_no(schedule.getSchedule_no());
                tripMapper.insertPlace(place);
            }
        }
    }
}