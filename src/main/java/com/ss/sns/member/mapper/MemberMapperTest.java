package com.ss.sns.member.mapper;

import java.time.LocalDate;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ss.sns.member.dto.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {
	@Autowired
	private MemberMapper memberMapper;
	
	@Test
	public void memberLogin() throws Exception{
		MemberDTO member = new MemberDTO();
		
		
		
		member.setMember_id("1244");
		member.setMember_pw("pw");
		
		System.out.println(member.toString());
		memberMapper.memberLogin(member);
	}
	
}
