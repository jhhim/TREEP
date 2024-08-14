package com.ss.sns.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.member.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	public void memberSignup(MemberDTO member) ;
	public MemberDTO memberLogin(MemberDTO member);
	public int idcheck(String member_id);
	public int nicknamecheck(String member_nickname);
	public int emailcheck(String member_email);
	

}
