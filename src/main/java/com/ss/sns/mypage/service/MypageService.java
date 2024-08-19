package com.ss.sns.mypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.mypage.dto.MyBoardDTO;
import com.ss.sns.mypage.mapper.MypageMapper;
import com.ss.sns.trip.dto.ScheduleDTO;
import com.ss.sns.trip.dto.TripDTO;
import com.ss.sns.trip.dto.TripPlaceDTO;

@Service
public class MypageService {

	@Autowired
	private MypageMapper mapper;
	
	public int getMemberNo(String member_nickname) {
		return mapper.getMemberNo(member_nickname);
	}

	public void profileModify(Map<String, Object> userDataMap) {
		mapper.profileModify(userDataMap);
	}

	public int selectBoardTotalCount(int member_no) {
		return mapper.selectBoardTotalCount(member_no);
	}

	public ArrayList<MyBoardDTO> selectMyBoardList(Map<String, Integer> myBmap) {
		return mapper.selectMyBoardList(myBmap);
	}

	public List<TripDTO> getTripsByMemberNo(int memberNo) {
        return mapper.selectTripsByMemberNo(memberNo);
    }

	public ArrayList<MyBoardDTO> selectMyLikeBoardList(Map<String, Integer> myBLmap) {
		// TODO Auto-generated method stub
		return mapper.selectMyLikeBoardList(myBLmap);
	}

	public TripDTO getTripDetails(int tripNo) {
        TripDTO trip = mapper.getTripDetails(tripNo);
        if (trip != null) {
            // 스케줄 리스트를 가져와서 TripDTO에 설정
            List<ScheduleDTO> schedules = mapper.getSchedulesByTripNo(tripNo);
            for (ScheduleDTO schedule : schedules) {
                // 각 스케줄에 대해 장소 리스트를 가져와서 ScheduleDTO에 설정
                List<TripPlaceDTO> places = mapper.getPlacesByScheduleNo(schedule.getSchedule_no());
                schedule.setPlaces(places);
            }
            trip.setSchedules(schedules);
        }
        return trip;
    }

	public int getMyBoardCount(int member_no) {
		return mapper.getMyBoardCount(member_no);
	}

	public void UpdateGrade(Map<String, Object> gmap) {
		mapper.UpdateGrade(gmap);
	}

	public String selectGradeImg(String genderGrade) {
		return mapper.selectGradeImg(genderGrade);
	}
}
