package com.ss.sns.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.mypage.mapper.MypageMapper;

@Service
public class MypageService {

	@Autowired
	private MypageMapper mapper;
	
	public int getMemberNo(String member_nickname) {
		return mapper.getMemberNo(member_nickname);
	}

}
