package com.ss.sns.board.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.board.dto.BoardDTO;


@Mapper
public interface BoardMapper {

	public int countBoard(int board_kind);
	public ArrayList<BoardDTO> selectBoardList(Map<String, Integer> hmap);

}
