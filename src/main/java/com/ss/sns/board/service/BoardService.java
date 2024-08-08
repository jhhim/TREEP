package com.ss.sns.board.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.board.dto.BoardPage;
import com.ss.sns.board.mapper.BoardMapper;

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
	
	
}
