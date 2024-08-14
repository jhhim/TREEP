package com.ss.sns.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.board.dto.BoardPage;
import com.ss.sns.board.service.BoardService;
import com.ss.sns.member.dto.MemberDTO;


@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/freeboard")
	public String freeboard(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		int board_kind = 1;
		int freeTotalCount = service.countBoard(board_kind);
		int pageSize = 8;
		BoardPage boardPage = new BoardPage(pageSize, freeTotalCount, currentPage);
		Map<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", boardPage.getStartNo());
		hmap.put("endNo", boardPage.getEndNo());
		hmap.put("board_kind", board_kind);
		boardPage.setBoardList(service.selectBoardList(hmap));
		model.addAttribute("boardPage", boardPage);
		return "board/freeboard";
	}
	@RequestMapping("/joinboard")
	public String joinboard(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		int board_kind = 2;
		int freeTotalCount = service.countBoard(board_kind);
		int pageSize = 8;
		BoardPage boardPage = new BoardPage(pageSize, freeTotalCount, currentPage);
		Map<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", boardPage.getStartNo());
		hmap.put("endNo", boardPage.getEndNo());
		hmap.put("board_kind", board_kind);
		boardPage.setBoardList(service.selectBoardList(hmap));
		model.addAttribute("boardPage", boardPage);
		return "board/joinboard";
	}
	@RequestMapping("/askboard")
	public String askboard(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		int board_kind = 3;
		int freeTotalCount = service.countBoard(board_kind);
		int pageSize = 10;
		BoardPage boardPage = new BoardPage(pageSize, freeTotalCount, currentPage);
		Map<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", boardPage.getStartNo());
		hmap.put("endNo", boardPage.getEndNo());
		hmap.put("board_kind", board_kind);
		boardPage.setBoardList(service.selectBoardList(hmap));
		model.addAttribute("boardPage", boardPage);
		return "board/askboard";
	}
	@RequestMapping("/detailboard")
	public String detailboard(int kind,int no,Model model) {
		
		Map<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("board_kind", kind);
		hmap.put("board_no", no);
		service.updateHit(hmap);
		BoardDTO board = service.selectByBoardNo(hmap);
		MemberDTO writeMember = service.selectJoinBoardMember(hmap);
		//이밑에만 날리면된다~~~
		switch (board.getBoard_continent()) {
	    case "c1": board.setBoard_continent("국내"); break;
	    case "c2": board.setBoard_continent("일본"); break;
	    case "c3": board.setBoard_continent("중국"); break;
	    case "c4": board.setBoard_continent("아시아"); break;
	    case "c5": board.setBoard_continent("미국"); break;
	    case "c6": board.setBoard_continent("캐나다"); break;
	    case "c7": board.setBoard_continent("중남미"); break;
	    case "c8": board.setBoard_continent("유럽"); break;
	    case "c9": board.setBoard_continent("중동"); break;
	    case "c10": board.setBoard_continent("아프리카"); break;
	    case "c11": board.setBoard_continent("남태평양"); break;
	    default:board.setBoard_continent("");break;
	}

	  model.addAttribute("board", board); model.addAttribute("writeMember",
	  writeMember);
	  
	 /* ArrayList<ReplyDTO>repliList= service.selectReply(no);
	 * model.addAttribute("repliList",repliList);
	 */
		return "board/detail";
	}
	/*
	 * @PostMapping("/reply") public String reply(String replyContent,int kind,int
	 * no,@RequestParam(value = "rereply_no", required = false) Integer rereply_no)
	 * { Map<String, Object> hmap = new HashMap<String, Object>();
	 * hmap.put("board_no", no); hmap.put("member_no", 1002); //로그인 세션값으로 변경 예정
	 * hmap.put("replyContent", replyContent); // 비밀글 여부 체크박스 생성 후 관련 쿼리 추가예정
	 * hmap.put("rereply_no", rereply_no); service.insertReply(hmap); return
	 * "redirect:/detailboard?kind=" + kind + "&no=" + no; }
	 * 
	 * @GetMapping("/writeboard") public String writeboard() { return
	 * "board/insertBoard"; }
	 * 
	 * @RequestMapping("/deletereply") public String deleteReply(int kind,int no,int
	 * reply_no,Model model) { System.out.println(reply_no); Map<String,Integer>
	 * hmap = new HashMap<String, Integer>(); hmap.put("member_no", 1000);
	 * hmap.put("reply_no", reply_no); int deleteResult = service.deleteReply(hmap);
	 * System.out.println(deleteResult);
	 * model.addAttribute("deleteResult",deleteResult); return
	 * "redirect:/detailboard?kind=" + kind + "&no=" + no; }
	 */
}
