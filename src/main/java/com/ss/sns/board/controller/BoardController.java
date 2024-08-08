package com.ss.sns.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.sns.board.dto.BoardPage;
import com.ss.sns.board.service.BoardService;

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
		System.out.println(boardPage);
		model.addAttribute("boardPage", boardPage);
		return "board/freeboard";
	}
	@RequestMapping("/joinboard")
	public String joinboard() {
		
		return "board/joinboard";
	}
	@RequestMapping("/askboard")
	public String askboard() {
		return "board/askboard";
	}
	
	
}
