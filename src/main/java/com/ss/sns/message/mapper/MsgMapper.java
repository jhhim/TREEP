package com.ss.sns.message.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.message.dto.MsgRevDTO;
import com.ss.sns.message.dto.MsgSenDTO;

@Mapper
public interface MsgMapper {

	int selectMemberNo(int member_no);

	int selectMessageRevCount(int member_no);

	ArrayList<MsgRevDTO> selectMessageRevList(Map<String, Integer> hmap);

	ArrayList<MsgSenDTO> selectMessageSenList(Map<String, Integer> hmap2);

	void deleteRevMessage(int msg_no);
	
	void SendMessage(Map<String, Object> sendMsg);

	int selectMsgMemberNo(String id);

	void deleteSendMessage(int msg_no);

	void updateRevStatus(int msg_no);

	void RevStore(Map<String, Object> sendMsg);

	int selectMessageSenCount(int member_no);

	void updateSenStatus(int msg_no);

	void updateRevStore(int msg_no);

	int selectMessagesStoreCount(int member_no);

	ArrayList<MsgRevDTO> selectMessageRevStoreList(Map<String, Integer> hmap3);

	void updateRevStoreDelete(int msg_no);

}
