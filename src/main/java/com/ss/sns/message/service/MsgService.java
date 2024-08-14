package com.ss.sns.message.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.message.dto.MsgRevDTO;
import com.ss.sns.message.dto.MsgSenDTO;
import com.ss.sns.message.mapper.MsgMapper;

@Service
public class MsgService {

	@Autowired
	private MsgMapper mapper;
	
	public int selectMessageRevCount(int member_no) {
		return mapper.selectMessageRevCount(member_no);
	}

	public ArrayList<MsgRevDTO> selectMessageRevList(Map<String, Integer> hmap) {
		return mapper.selectMessageRevList(hmap);
	}

	public ArrayList<MsgSenDTO> selectMessageSenList(Map<String, Integer> hmap2) {
		// TODO Auto-generated method stub
		return mapper.selectMessageSenList(hmap2);
	}

	public void deleteRevMessage(int msg_no) {
		mapper.deleteRevMessage(msg_no);
	}

	public void SendMessage(Map<String, Object> sendMsg) {
		mapper.SendMessage(sendMsg);		
	}

	public Integer selectMsgMemberNo(String name) {
		return mapper.selectMsgMemberNo(name);
	}

	public void deleteSendMessage(int msg_no) {
		mapper.deleteSendMessage(msg_no);
		
	}

	public void updateRevStatus(int msg_no) {
		mapper.updateRevStatus(msg_no);
			
	}

	public void RevStore(Map<String, Object> sendMsg) {
		mapper.RevStore(sendMsg);
		
	}

	public int selectMessageSenCount(int temp) {
		return mapper.selectMessageSenCount(temp);
	}

	public void updateSenStatus(int msg_no) {
		mapper.updateSenStatus(msg_no);
	}

	public void updateRevStore(int msg_no) {
		mapper.updateRevStore(msg_no);
	}

	public int selectMessageStoreCount(int temp) {
		return mapper.selectMessagesStoreCount(temp);
	}

	public ArrayList<MsgRevDTO> selectMessageRevStoreList(Map<String, Integer> hmap3) {
		return mapper.selectMessageRevStoreList(hmap3);
	}

	public void updateRevStoreDelete(int msg_no) {
		mapper.updateRevStoreDelete(msg_no);
	}

	public int getMemberNo(String Nickname) {
		// TODO Auto-generated method stub
		return mapper.getMemberNo(Nickname);
	}

}