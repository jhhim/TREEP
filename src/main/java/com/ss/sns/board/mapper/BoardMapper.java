package com.ss.sns.board.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.board.dto.ReplyDTO;
import com.ss.sns.board.dto.ReplyNickDTO;
import com.ss.sns.member.dto.MemberDTO;


@Mapper
public interface BoardMapper {

	public int countBoard(int board_kind);
	public ArrayList<BoardDTO> selectBoardList(Map<String, Integer> hmap);
	public BoardDTO selectByBoardNo(int board_no);
	public MemberDTO selectJoinBoardMember(int board_no);
	public void updateHit(int board_no);
	public void insertReply(ReplyDTO insertReply);
	public List<ReplyNickDTO> selectReply(int board_no);
	public List<ReplyNickDTO> selectReReply(int reply_no);
	public int deleteReply(Map<String, Integer> hmap);
	public void deleteReReply(Map<String, Integer> hmap);
	public int updateReply(Map<String, Object> hmap);
	public ArrayList<BoardDTO> selectFilterFreeBoardList(Map<String, Object> hmap);
	public int totalCountFreeFilter(Map<String, Object> countParams);
	public int totalCountJoinFilter(Map<String, Object> countParams);
	public List<BoardDTO> selectFilterJoinBoardList(Map<String, Object> listParams);
	public void boardStatusUpdate(Map<String, Object> singoMap);
	public ArrayList<BoardDTO> selectBoardListAll(Map<String, Integer> hmap);
	public void boardDelete(Map<String, Object> deleteMap);
	public List<BoardDTO> selectFilterFreeBoardListMG(Map<String, Object> listParams);
	public List<BoardDTO> selectFilterJoinBoardListMG(Map<String, Object> listParams);
	public int totalCountFreeFilterMG(Map<String, Object> countParams);
	public int totalCountJoinFilterMG(Map<String, Object> countParams);
	public void insertBoard(Map<String, Object> hmap);
	public void updateBoard(Map<String, Object> hmap);
	public List<ReplyDTO> selectReplyList(List<Integer> boardNo);
	public void insertAskBoard(Map<String, Object> hmap);
	public void updateAskBoard(Map<String, Object> hmap);
	public void deleteAsk(int no);
	public void insertAnswer(Map<String, Object> hmap);
	public void updateAnswer(Map<String, Object> hmap);
	public void deleteAnswer(int no);
	public void updateBoardStatus(Integer askUpdateNo);
	public void updateAnswerStatus(int no);
	public boolean addLike(Map<String, Integer> hmap);
	public boolean removeLike(Map<String, Integer> hmap);
	public int getLikeCount(int boardNo);
	public void updateBoardLike(Map<String, Integer> hashMap);
	public int isLiked(Map<String, Integer> hmap);



}
