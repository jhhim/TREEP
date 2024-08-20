package com.ss.sns.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ss.sns.board.service.BoardService;

@RestController
public class BoardRestController {
	@Autowired
	BoardService service;

	@PostMapping("/updatelike")
	public ResponseEntity<Map<String, Object>> updateLike(@RequestParam("board_no") int boardNo,
			@RequestParam("member_no") int memberNo, @RequestParam("action") String action) {
		Map<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("boardNo", boardNo);
		hmap.put("memberNo", memberNo);

		Map<String, Object> response = new HashMap<>();
		try {
			boolean success;
			if ("like".equals(action)) {
				success = service.addLike(hmap);
			} else if ("unlike".equals(action)) {
				success = service.removeLike(hmap);
			} else {
				response.put("success", false);
				response.put("message", "Invalid action");
				return ResponseEntity.badRequest().body(response);
			}

			if (success) {
				int newLikeCount = service.getLikeCount(boardNo);
				response.put("success", true);
				response.put("newLikeCount", newLikeCount);
				return ResponseEntity.ok(response);
			} else {
				response.put("success", false);
				response.put("message", "Failed to update like");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "Internal server error");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	// 좋아요 수 조회
	@GetMapping("/getLikeCount")
	public ResponseEntity<Map<String, Integer>> getLikeCount(@RequestParam("board_no") int boardNo) {
		Map<String, Integer> response = new HashMap<>();
		try {
			int likeCount = service.getLikeCount(boardNo);
			response.put("newLikeCount", likeCount);
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("newLikeCount", 0);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	@GetMapping("/isLiked")
	public ResponseEntity<Map<String, Boolean>> isLiked(@RequestParam("board_no") int boardNo,
			@RequestParam("member_no") int memberNo) {
		Map<String, Integer> params = new HashMap<>();
		params.put("boardNo", boardNo);
		params.put("memberNo", memberNo);

		Map<String, Boolean> response = new HashMap<>();
		try {
			boolean liked = service.isLiked(params);
			response.put("liked", liked);
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("liked", false);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}
	
	
}
