package com.ss.sns.mypage.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.mypage.dto.MyBoardDTO;
import com.ss.sns.trip.dto.TripDTO;

@Mapper
public interface MypageMapper {

	int getMemberNo(String member_nickname);

	void profileModify(Map<String, Object> userDataMap);

	int selectBoardTotalCount(int member_no);

	ArrayList<MyBoardDTO> selectMyBoardList(Map<String, Integer> myBmap);
	
    List<TripDTO> selectTripsByMemberNo(int memberNo);


}
