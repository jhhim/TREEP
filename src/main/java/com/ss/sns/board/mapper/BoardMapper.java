package com.ss.sns.board.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.board.dto.ReplyDTO;
import com.ss.sns.member.dto.MemberDTO;


@Mapper
public interface BoardMapper {

	public int countBoard(int board_kind);
	public ArrayList<BoardDTO> selectBoardList(Map<String, Integer> hmap);
	public BoardDTO selectByBoardNo(Map<String, Integer> hmap);
	public MemberDTO selectJoinBoardMember(Map<String, Integer> hmap);
	public void updateHit(Map<String, Integer> hmap);
	public void insertReply(ReplyDTO insertReply);
	public ArrayList<ReplyDTO> selectReply(int board_no);
	public ArrayList<ReplyDTO> selectReReply(int reply_no);
	public int deleteReply(Map<String, Integer> hmap);
	public void deleteReReply(Map<String, Integer> hmap);
	public int updateReply(Map<String, Object> hmap);
	public ArrayList<BoardDTO> selectFilterFreeBoardList(Map<String, Object> hmap);
	public int totalCountFreeFilter(Map<String, Object> countParams);
	public int totalCountJoinFilter(Map<String, Object> countParams);
	public List<BoardDTO> selectFilterJoinBoardList(Map<String, Object> listParams);

}
