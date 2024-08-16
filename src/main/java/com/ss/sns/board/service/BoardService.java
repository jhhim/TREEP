package com.ss.sns.board.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.board.dto.ReplyDTO;
import com.ss.sns.board.mapper.BoardMapper;
import com.ss.sns.member.dto.MemberDTO;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	public int countBoard(int board_kind) {
		return mapper.countBoard(board_kind);
	}

	public ArrayList<BoardDTO> selectBoardList(Map<String, Integer> hmap) {
		return mapper.selectBoardList(hmap);
	}

	public BoardDTO selectByBoardNo(Map<String, Integer> hmap) {
		return mapper.selectByBoardNo(hmap);
	}
	public MemberDTO selectJoinBoardMember(Map<String, Integer> hmap) {
		return mapper.selectJoinBoardMember(hmap);
	}

	public void updateHit(Map<String, Integer> hmap) {
		mapper.updateHit(hmap);
	}

	public void insertReply(ReplyDTO insertReply) {
		mapper.insertReply(insertReply);	
	}

	public ArrayList<ReplyDTO> selectReply(int board_no) {		
	    ArrayList<ReplyDTO> replies = mapper.selectReply(board_no);
	    for (ReplyDTO reply : replies) {
	        ArrayList<ReplyDTO> rereplies = mapper.selectReReply(reply.getReply_no());
	        reply.setReReplyList(rereplies);
	    }
	    return replies;
	}

	public boolean deleteReply(Map<String, Integer> hmap) {
		mapper.deleteReReply(hmap);
	    return mapper.deleteReply(hmap) > 0;
	}

	public boolean updateReply(Map<String, Object> hmap) {
		return mapper.updateReply(hmap) > 0;
	}
}
	

	
	

