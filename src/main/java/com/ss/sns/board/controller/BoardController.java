package com.ss.sns.board.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ss.sns.board.dto.BoardDTO;
import com.ss.sns.board.dto.BoardPage;
import com.ss.sns.board.service.BoardService;
import com.ss.sns.member.dto.MemberDTO;

@Controller
public class BoardController {

	@Autowired
	BoardService service;

	@RequestMapping("/freeboard")
	public String freeboard(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		// session이 누군지
		MemberDTO Session = (MemberDTO) session.getAttribute("member");

		int board_kind = 1;
		int freeTotalCount = service.countBoard(board_kind);
		int pageSize = 8;
		BoardPage boardPage = new BoardPage(pageSize, freeTotalCount, currentPage);

		// 세션에 있는 memberDTO에서 manager_yn값 가져오기
		String manager_yn = null;
		Map<String, Integer> hmap = new HashMap<String, Integer>();

		if (Session == null) {

			hmap.put("startNo", boardPage.getStartNo());
			hmap.put("endNo", boardPage.getEndNo());
			hmap.put("board_kind", board_kind);
			boardPage.setBoardList(service.selectBoardList(hmap));
			model.addAttribute("boardPage", boardPage);

		} else {
			manager_yn = Session.getManager_yn();

			if (manager_yn.equals("Y")) {
				hmap.put("startNo", boardPage.getStartNo());
				hmap.put("endNo", boardPage.getEndNo());
				hmap.put("board_kind", board_kind);
				boardPage.setBoardList(service.selectBoardListAll(hmap));
				model.addAttribute("boardPage", boardPage);

				boardPage.setBoardList(service.selectBoardListAll(hmap));
				model.addAttribute("boardPage", boardPage);
			} else {
				hmap.put("startNo", boardPage.getStartNo());
				hmap.put("endNo", boardPage.getEndNo());
				hmap.put("board_kind", board_kind);
				boardPage.setBoardList(service.selectBoardList(hmap));
				model.addAttribute("boardPage", boardPage);
			}
		}

		return "board/freeboard";
	}

	@RequestMapping("/joinboard")
	public String joinboard(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		// session이 누군지
		MemberDTO Session = (MemberDTO) session.getAttribute("member");
		// 세션에 있는 memberDTO에서 manager_yn값 가져오기
		String manager_yn = null;

		int board_kind = 2;
		int freeTotalCount = service.countBoard(board_kind);
		int pageSize = 8;
		BoardPage boardPage = new BoardPage(pageSize, freeTotalCount, currentPage);
		Map<String, Integer> hmap = new HashMap<String, Integer>();

		if (Session == null) {

			hmap.put("startNo", boardPage.getStartNo());
			hmap.put("endNo", boardPage.getEndNo());
			hmap.put("board_kind", board_kind);
			boardPage.setBoardList(service.selectBoardList(hmap));
			model.addAttribute("boardPage", boardPage);

		} else {

			manager_yn = Session.getManager_yn();
			if (manager_yn.equals("Y")) {
				hmap.put("startNo", boardPage.getStartNo());
				hmap.put("endNo", boardPage.getEndNo());
				hmap.put("board_kind", board_kind);
				boardPage.setBoardList(service.selectBoardListAll(hmap));
				model.addAttribute("boardPage", boardPage);

				boardPage.setBoardList(service.selectBoardListAll(hmap));
				model.addAttribute("boardPage", boardPage);
			} else {
				hmap.put("startNo", boardPage.getStartNo());
				hmap.put("endNo", boardPage.getEndNo());
				hmap.put("board_kind", board_kind);
				boardPage.setBoardList(service.selectBoardList(hmap));
				model.addAttribute("boardPage", boardPage);
			}

		}

		return "board/joinboard";
	}

	@RequestMapping("/askboard")
	public String askboard(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {
		int board_kind = 3;
		int freeTotalCount = service.countBoard(board_kind);
		int pageSize = 8;
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
	public String detailboard(int no, Model model) {

		
		service.updateHit(no);
		BoardDTO board = service.selectByBoardNo(no);
		MemberDTO writeMember = service.selectJoinBoardMember(no);

		model.addAttribute("board", board);
		model.addAttribute("writeMember", writeMember);

		return "board/detail";
	}

	@PostMapping("/freefilterboard")
	public String filterboard(@RequestParam(value = "postType", required = false) List<String> postTypes,
			@RequestParam(value = "sortOrder", required = false) String sortOrder,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model, HttpSession session) {

		int boardKind = 1;
		int pageSize = 8;

		BoardPage boardPage = service.filteredFreePage(boardKind, postTypes, sortOrder, searchText, currentPage,
				pageSize, session);
		model.addAttribute("boardPage", boardPage);
		return "board/freeboard";
	}

	@PostMapping("/joinfilterboard")
	public String joinfilterboard(@RequestParam(value = "location", required = false) List<String> locations,
			@RequestParam(value = "sortOrder", required = false) String sortOrder,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model, HttpSession session) {

		int boardKind = 2;
		int pageSize = 8;
		BoardPage boardPage = service.filteredjoinPage(boardKind, locations, sortOrder, searchText, currentPage,
				pageSize, session);

		model.addAttribute("boardPage", boardPage);
		return "board/joinboard";
	}

	@RequestMapping("/MoveBoard")
	public String MoveBoard(@RequestParam(value = "kind") int kind, @RequestParam(value = "no") int boardNo) {

		Map<String, Object> singoMap = new HashMap<String, Object>();
		singoMap.put("kind", kind);
		singoMap.put("no", boardNo);
		service.boardStatusUpdate(singoMap);

		if (kind == 1) {
			return "redirect:/freeboard";
		} else {
			return "redirect:/joinboard";
		}
	}

	@RequestMapping("/deleteBoard")
	public String deleteBoard(@RequestParam(value = "kind") int kind, @RequestParam(value = "no") int boardNo) {
		Map<String, Object> DeleteMap = new HashMap<String, Object>();
		DeleteMap.put("kind", kind);
		DeleteMap.put("no", boardNo);
		service.boardDelete(DeleteMap);

		if (kind == 1) {
			return "redirect:/freeboard";
		} else {
			return "redirect:/joinboard";
		}
	}

	@GetMapping("/writeboard")
	public String writeBoard() {
		return "board/writeboard";
	}

	@Autowired
	private ServletContext context;

	@PostMapping("/insertboard")
	public String insertBoard(@RequestParam("board") String board,
			@RequestParam(value = "free-category", required = false) String freeCategory,
			@RequestParam(value = "join-category", required = false) String joinCategory,		
			@RequestParam("write_title") String title, @RequestParam("content") String content,
			@RequestParam(value = "files", required = false) MultipartFile file, HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		int member_no = member.getMember_no();
		int board_kind = "free".equals(board) ? 1 : 2;
		String fileReadName = null;

	    if (file != null && !file.isEmpty()) {

	        String originalFilename = file.getOriginalFilename();
	        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	        String newFilename = UUID.randomUUID().toString() + extension;

	        String uploadFolder = context.getRealPath("/resources/img/board");
	        File uploadDir = new File(uploadFolder);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }
	        File saveFile = new File(uploadFolder + File.separator + newFilename);

	        try {
	            file.transferTo(saveFile);
	            fileReadName = newFilename;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	       
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("board_kind", board_kind);
		hmap.put("member_no", member_no);
		hmap.put("board_type", freeCategory);
		hmap.put("board_title", title);
		hmap.put("board_content", content);
		hmap.put("board_img", fileReadName);
		hmap.put("board_continent", joinCategory);
		service.insertBoard(hmap);
		return "redirect:" + (board_kind == 2 ? "/joinboard" : "/freeboard");
	}
	@GetMapping("/updateboard")
	public String updateboard(int no, Model model) {

		BoardDTO board = service.selectByBoardNo(no);
		model.addAttribute("board", board);
		return "board/updateboard";
	}
	@PostMapping("/updateboard")
	public String updateBoard(int no,@RequestParam("board") String board,
			@RequestParam(value = "free-category", required = false) String freeCategory,
			@RequestParam(value = "join-category", required = false) String joinCategory,		
			@RequestParam("write_title") String title, @RequestParam("content") String content,
			@RequestParam(value = "files", required = false) MultipartFile file, HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		int member_no = member.getMember_no();
		int board_kind = "free".equals(board) ? 1 : 2;
		String fileReadName = null;
		
	    if (file != null && !file.isEmpty()) {

	        String originalFilename = file.getOriginalFilename();
	        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	        String newFilename = UUID.randomUUID().toString() + extension;

	        String uploadFolder = context.getRealPath("/resources/img/board");
	        File uploadDir = new File(uploadFolder);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }
	        File saveFile = new File(uploadFolder + File.separator + newFilename);

	        try {
	            file.transferTo(saveFile);
	            fileReadName = newFilename;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("board_kind", board_kind);
		hmap.put("member_no", member_no);
		hmap.put("board_type", freeCategory);
		hmap.put("board_title", title);
		hmap.put("board_content", content);
		hmap.put("board_img", fileReadName);
		hmap.put("board_continent", joinCategory);
		hmap.put("board_no", no);
		service.updateBoard(hmap);

		
		
		return "redirect:detailboard?no="+no;
	}
}
