package com.ss.sns.message.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.message.dto.MsgDTO;

@Mapper
public interface MsgMapper {

	int selectMemberNo(int member_no);

	int selectMessageCount(int member_no);

	ArrayList<MsgDTO> selectMessageRevList(Map<String, Integer> hmap);

	ArrayList<MsgDTO> selectMessageSenList(Map<String, Integer> hmap2);

	void deleteRevMessage(int msg_no);
	
	void SendMessage(Map<String, Object> sendMsg);

	int selectMsgMemberNo(String id);

}
