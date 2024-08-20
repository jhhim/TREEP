package com.ss.sns.mypage.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ss.sns.mypage.dto.MyBoardDTO;
import com.ss.sns.trip.dto.ScheduleDTO;
import com.ss.sns.trip.dto.TripDTO;
import com.ss.sns.trip.dto.TripPlaceDTO;

@Mapper
public interface MypageMapper {

	int getMemberNo(String member_nickname);

	void profileModify(Map<String, Object> userDataMap);

	int selectBoardTotalCount(int member_no);

	ArrayList<MyBoardDTO> selectMyBoardList(Map<String, Integer> myBmap);
	
    List<TripDTO> selectTripsByMemberNo(int memberNo);

	ArrayList<MyBoardDTO> selectMyLikeBoardList(Map<String, Integer> myBLmap);

	 TripDTO getTripDetails(@Param("tripNo") int tripNo);
	    
	 List<ScheduleDTO> getSchedulesByTripNo(@Param("tripNo") int tripNo);
	    
	 List<TripPlaceDTO> getPlacesByScheduleNo(@Param("scheduleNo") int scheduleNo);
	 
	 
	 
	    void deleteTripPlace(@Param("tripNo") int tripNo);
	    void deleteSchedule(@Param("tripNo") int tripNo);
	    void deleteMemberTrip(@Param("tripNo") int tripNo);
	    void deleteTrip(@Param("tripNo") int tripNo);

}
