package com.ss.sns.message.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.message.dto.MsgDTO;
import com.ss.sns.message.mapper.MsgMapper;

@Service
public class MsgService {

	@Autowired
	private MsgMapper mapper;
	
	public int selectMemberNo(int temp) {
		return mapper.selectMemberNo(temp);
	}
	
	public int selectMessageCount(int temp) {
		return mapper.selectMessageCount(temp);
	}

	public ArrayList<MsgDTO> selectMessageRevList(Map<String, Integer> hmap) {
		return mapper.selectMessageRevList(hmap);
	}

	public ArrayList<MsgDTO> selectMessageSenList(Map<String, Integer> hmap2) {
		// TODO Auto-generated method stub
		return mapper.selectMessageSenList(hmap2);
	}

	public void deleteRevMessage(int msg_no) {
		mapper.deleteRevMessage(msg_no);
	}

}
