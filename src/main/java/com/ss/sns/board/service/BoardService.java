package com.ss.sns.board.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.board.dto.BoardPage;
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

	public void insertReply(Map<String, Integer> hmap) {
		mapper.insertReply(hmap);	
	}
	

	
	
}
