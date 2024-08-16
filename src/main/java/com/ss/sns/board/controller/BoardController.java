package com.ss.sns.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String detailboard(int kind, int no, Model model) {

		Map<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("board_kind", kind);
		hmap.put("board_no", no);
		service.updateHit(hmap);
		BoardDTO board = service.selectByBoardNo(hmap);
		MemberDTO writeMember = service.selectJoinBoardMember(hmap);
		// 이밑에만 날리면된다~~~
		switch (board.getBoard_continent()) {
		case "c1":
			board.setBoard_continent("국내");
			break;
		case "c2":
			board.setBoard_continent("일본");
			break;
		case "c3":
			board.setBoard_continent("중국");
			break;
		case "c4":
			board.setBoard_continent("아시아");
			break;
		case "c5":
			board.setBoard_continent("미국");
			break;
		case "c6":
			board.setBoard_continent("캐나다");
			break;
		case "c7":
			board.setBoard_continent("중남미");
			break;
		case "c8":
			board.setBoard_continent("유럽");
			break;
		case "c9":
			board.setBoard_continent("중동");
			break;
		case "c10":
			board.setBoard_continent("아프리카");
			break;
		case "c11":
			board.setBoard_continent("남태평양");
			break;
		default:
			board.setBoard_continent("");
			break;
		}

		model.addAttribute("board", board);
		model.addAttribute("writeMember", writeMember);

		return "board/detail";
	}

	@PostMapping("/freefilterboard")
	public String filterboard(@RequestParam(value = "postType", required = false) List<String> postTypes,
			@RequestParam(value = "sortOrder", required = false) String sortOrder,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		
		System.out.println(sortOrder);
		System.out.println(searchText);

		int boardKind = 1;
		int pageSize = 8;

		BoardPage boardPage = service.filteredFreePage(boardKind, postTypes, sortOrder, searchText, currentPage,
				pageSize);
		model.addAttribute("boardPage", boardPage);
		return "board/freeboard";
	}

	@PostMapping("/joinfilterboard")
	public String joinfilterboard(@RequestParam(value = "location", required = false) List<String> locations,
			@RequestParam(value = "sortOrder", required = false) String sortOrder,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {

		int boardKind = 2;
		int pageSize = 8;

		System.out.println(locations);
		System.out.println(sortOrder);
		System.out.println(searchText);

		
		 BoardPage boardPage = service.filteredjoinPage(boardKind, locations,
		 sortOrder, searchText, currentPage, pageSize);

		 model.addAttribute("boardPage", boardPage);
		return "board/joinboard";
	}

}
