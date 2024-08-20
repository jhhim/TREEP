package com.ss.sns.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.board.dto.BoardPage;
import com.ss.sns.board.dto.ReplyDTO;
import com.ss.sns.board.dto.ReplyNickDTO;
import com.ss.sns.board.mapper.BoardMapper;
import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.trip.dto.ScheduleDTO;
import com.ss.sns.trip.dto.TripDTO;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	public Object updateBoard;

	public int countBoard(int board_kind) {
		return mapper.countBoard(board_kind);
	}

	public ArrayList<BoardDTO> selectBoardList(Map<String, Integer> hmap) {
		return mapper.selectBoardList(hmap);
	}

	public BoardDTO selectByBoardNo(int board_no) {
		return mapper.selectByBoardNo(board_no);
	}

	public MemberDTO selectJoinBoardMember(int board_no) {
		return mapper.selectJoinBoardMember(board_no);
	}

	public void updateHit(int board_no) {
		mapper.updateHit(board_no);
	}

	public void insertReply(ReplyDTO insertReply) {
		mapper.insertReply(insertReply);
	}

	/*
	 * public ArrayList<ReplyDTO> selectReply(int board_no) { ArrayList<ReplyDTO>
	 * replies = mapper.selectReply(board_no); for (ReplyDTO reply : replies) {
	 * ArrayList<ReplyDTO> rereplies = mapper.selectReReply(reply.getReply_no());
	 * reply.setReReplyList(rereplies); } return replies; }
	 */

	public List<ReplyNickDTO> selectReply(int boardNo) {
		List<ReplyNickDTO> replies = mapper.selectReply(boardNo);

		for (ReplyNickDTO reply : replies) {
			List<ReplyNickDTO> reReplies = mapper.selectReReply(reply.getReply_no());
			reply.setReReplyList(reReplies);
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

	public BoardPage filteredFreePage(int board_kind, List<String> postTypes, String sortOrder, String searchText,
			int currentPage, int pageSize, HttpSession session) {
		Map<String, Object> countParams = new HashMap<>();
		countParams.put("board_kind", board_kind);
		countParams.put("postTypes", postTypes);
		countParams.put("sortOrder", sortOrder);
		countParams.put("searchText", searchText);
		int totalCount = 0;

		Map<String, Object> listParams = new HashMap<>();
		listParams.put("board_kind", board_kind);
		listParams.put("postTypes", postTypes);
		listParams.put("sortOrder", sortOrder);
		listParams.put("searchText", searchText);
		listParams.put("startNo", (currentPage - 1) * pageSize + 1);
		listParams.put("endNo", currentPage * pageSize);

		MemberDTO Session = (MemberDTO) session.getAttribute("member");
		String manager_yn = null;
		List<BoardDTO> boardList = null;

		if (Session == null) {
			totalCount = mapper.totalCountFreeFilter(countParams);
			boardList = mapper.selectFilterFreeBoardList(listParams);
		} else {

			manager_yn = Session.getManager_yn();

			if (manager_yn.equals("Y")) {
				totalCount = mapper.totalCountFreeFilterMG(countParams);
				boardList = mapper.selectFilterFreeBoardListMG(listParams);

			} else {
				totalCount = mapper.totalCountFreeFilter(countParams);
				boardList = mapper.selectFilterFreeBoardList(listParams);
			}

		}

		BoardPage boardPage = new BoardPage(pageSize, totalCount, currentPage);
		boardPage.setBoardList(new ArrayList<>(boardList));
		return boardPage;
	}

	public BoardPage filteredjoinPage(int board_kind, List<String> locations, String sortOrder, String searchText,
			int currentPage, int pageSize, HttpSession session) {
		Map<String, Object> countParams = new HashMap<>();
		countParams.put("board_kind", board_kind);
		countParams.put("locations", locations);
		countParams.put("sortOrder", sortOrder);
		countParams.put("searchText", searchText);
		int totalCount = 0;

		Map<String, Object> listParams = new HashMap<>();
		listParams.put("board_kind", board_kind);
		listParams.put("locations", locations);
		listParams.put("sortOrder", sortOrder);
		listParams.put("searchText", searchText);
		listParams.put("startNo", (currentPage - 1) * pageSize + 1);
		listParams.put("endNo", currentPage * pageSize);

		MemberDTO Session = (MemberDTO) session.getAttribute("member");
		String manager_yn = null;
		List<BoardDTO> boardList = null;

		if (Session == null) {
			totalCount = mapper.totalCountJoinFilter(countParams);
			boardList = mapper.selectFilterJoinBoardList(listParams);
		} else {

			manager_yn = Session.getManager_yn();

			if (manager_yn.equals("Y")) {
				totalCount = mapper.totalCountJoinFilterMG(countParams);
				boardList = mapper.selectFilterJoinBoardListMG(listParams);

			} else {
				totalCount = mapper.totalCountJoinFilter(countParams);
				boardList = mapper.selectFilterJoinBoardList(listParams);
			}
		}

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

	public void insertBoard(Map<String, Object> hmap) {
		mapper.insertBoard(hmap);

	}

	public void updateBoard(Map<String, Object> hmap) {
		mapper.updateBoard(hmap);
	}

	public List<ReplyDTO> selectReplyList(List<Integer> boardNo) {
		return mapper.selectReplyList(boardNo);
	}

	public void insertAskBoard(Map<String, Object> hmap) {
		mapper.insertAskBoard(hmap);

	}

	public void updateAskBoard(Map<String, Object> hmap) {
		mapper.updateAskBoard(hmap);
	}

	public void deleteAsk(int no) {
		mapper.deleteAsk(no);

	}

	public void insertAnswer(Map<String, Object> hmap) {
		mapper.insertAnswer(hmap);

	}

	public void updateAnswer(Map<String, Object> hmap) {
		mapper.updateAnswer(hmap);
	}

	public void deleteAnswer(int no) {
		mapper.deleteAnswer(no);

	}

	public void updateBoardStatus(Integer askUpdateNo) {
		mapper.updateBoardStatus(askUpdateNo);

	}

	public void updateAnswerStatus(int no) {
		mapper.updateAnswerStatus(no);

	}

	/****************************************
	 * 좋아요 추가
	 ************************************************/
	public boolean addLike(Map<String, Integer> params) {
	    // 좋아요 추가
	    boolean success = mapper.addLike(params);
	    if (success) {
	        // 좋아요 수 업데이트
	        Map<String, Integer> updateParams = new HashMap<>();
	        updateParams.put("boardNo", params.get("boardNo"));
	        updateParams.put("num", 1);
	        mapper.updateBoardLike(updateParams);
	    }
	    return success;
	}

	public boolean removeLike(Map<String, Integer> params) {
	    // 좋아요 삭제
	    boolean success = mapper.removeLike(params);
	    if (success) {
	        // 좋아요 수 업데이트
	        Map<String, Integer> updateParams = new HashMap<>();
	        updateParams.put("boardNo", params.get("boardNo"));
	        updateParams.put("num", -1);
	        mapper.updateBoardLike(updateParams);
	    }
	    return success;
	}

	public int getLikeCount(int boardNo) {
		return mapper.getLikeCount(boardNo);
	}

	public void updateBoardLike(Map<String, Integer> hashMap) {
		mapper.updateBoardLike(hashMap);	
	}

	public boolean isLiked(Map<String, Integer> params) {
	    int count = mapper.isLiked(params);
	    return count > 0;
	}
	
	public List<TripDTO> getTripsByMemberNo(int memberNo) {
        return mapper.getTripDetails(memberNo);
    }

    public List<ScheduleDTO> getSchedulesAndPlaces(int trip_no) {
        return mapper.getSchedulesAndPlaces(trip_no);
    }


}
