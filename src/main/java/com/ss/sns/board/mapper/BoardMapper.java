package com.ss.sns.board.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.member.dto.MemberDTO;


@Mapper
public interface BoardMapper {

	public int countBoard(int board_kind);
	public ArrayList<BoardDTO> selectBoardList(Map<String, Integer> hmap);
	public BoardDTO selectByBoardNo(Map<String, Integer> hmap);
	public MemberDTO selectJoinBoardMember(Map<String, Integer> hmap);

}
