package com.ss.sns.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.board.dto.BoardPage;
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

	public BoardPage filteredFreePage(int board_kind, List<String> postTypes, String sortOrder, String searchText, int currentPage, int pageSize) {
		 Map<String, Object> countParams = new HashMap<>();
		    countParams.put("board_kind", board_kind);
		    countParams.put("postTypes", postTypes);
		    countParams.put("sortOrder", sortOrder);
		    countParams.put("searchText", searchText);
		    int totalCount = mapper.totalCountFreeFilter(countParams);

		    Map<String, Object> listParams = new HashMap<>();
		    listParams.put("board_kind", board_kind);
		    listParams.put("postTypes", postTypes);
		    listParams.put("sortOrder", sortOrder);
		    listParams.put("searchText", searchText);
		    listParams.put("startNo", (currentPage - 1) * pageSize + 1);
		    listParams.put("endNo", currentPage * pageSize);

		    List<BoardDTO> boardList = mapper.selectFilterFreeBoardList(listParams);

        BoardPage boardPage = new BoardPage(pageSize, totalCount, currentPage);
        boardPage.setBoardList(new ArrayList<>(boardList));
        return boardPage;
    }

	public BoardPage filteredjoinPage(int board_kind, List<String> locations, String sortOrder, String searchText,
			int currentPage, int pageSize) {
		 Map<String, Object> countParams = new HashMap<>();
		    countParams.put("board_kind", board_kind);
		    countParams.put("locations", locations);
		    countParams.put("sortOrder", sortOrder);
		    countParams.put("searchText", searchText);
		    int totalCount = mapper.totalCountJoinFilter(countParams);
		  
		    Map<String, Object> listParams = new HashMap<>();
		    listParams.put("board_kind", board_kind);
		    listParams.put("locations", locations);
		    listParams.put("sortOrder", sortOrder);
		    listParams.put("searchText", searchText);
		    listParams.put("startNo", (currentPage - 1) * pageSize + 1);
		    listParams.put("endNo", currentPage * pageSize);

		    List<BoardDTO> boardList = mapper.selectFilterJoinBoardList(listParams);

     BoardPage boardPage = new BoardPage(pageSize, totalCount, currentPage);
     boardPage.setBoardList(new ArrayList<>(boardList));
     return boardPage;
	}

	public void boardStatusUpdate(Map<String, Object> singoMap) {
		mapper.boardStatusUpdate(singoMap);
	}

	public ArrayList<BoardDTO> selectBoardListAll(Map<String, Integer> hmap) {
		return mapper.selectBoardListAll(hmap);
	}

	public void boardDelete(Map<String, Object> deleteMap) {
		mapper.boardDelete(deleteMap);
	}
}
	

	
	

