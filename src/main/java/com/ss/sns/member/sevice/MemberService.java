package com.ss.sns.member.sevice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.member.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired
	MemberMapper membermapper;
	
	
	public void memberSignup(MemberDTO member) throws Exception{
		membermapper.memberSignup(member);
	}
	
	public MemberDTO memberLogin(MemberDTO member) throws Exception {
		
		return membermapper.memberLogin(member);
		
		
	}

	
}
