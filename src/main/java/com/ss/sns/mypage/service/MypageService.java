package com.ss.sns.mypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.mypage.dto.MyBoardDTO;
import com.ss.sns.mypage.mapper.MypageMapper;
import com.ss.sns.trip.dto.TripDTO;

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
}
