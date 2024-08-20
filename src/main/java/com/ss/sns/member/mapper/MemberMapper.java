package com.ss.sns.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.member.dto.kakaoDTO;
import com.ss.sns.trip.dto.shareBO;

@Mapper
public interface MemberMapper {
	public void memberSignup(MemberDTO member) ;
	public MemberDTO memberLogin(MemberDTO member);
	public int idcheck(String member_id);
	public int nicknamecheck(String member_nickname);
	public int emailcheck(String member_email);
	public int kakaocheck(String kakao_email);
	public void kakaoSignup(MemberDTO member) ;
	public void naverSignup(MemberDTO member) ;
	public void googleSignup(MemberDTO member);
	public MemberDTO kakaomemberCheck(MemberDTO member);
	public MemberDTO navermemberCheck(MemberDTO member);
	public MemberDTO googlememberCheck(MemberDTO member);
	public MemberDTO getmemberbyEmail(String email);
	public shareBO getShareInfo(int trip_no);
	
	
	
}
