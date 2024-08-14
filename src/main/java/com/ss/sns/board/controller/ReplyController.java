package com.ss.sns.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ss.sns.board.dto.ReplyDTO;
import com.ss.sns.board.service.BoardService;

@RequestMapping("/reply")
@RestController
public class ReplyController {
	@Autowired
	private BoardService service;

	@GetMapping("")
	public ResponseEntity<List<ReplyDTO>> selectReply(@RequestParam("kind") int kind, @RequestParam("no") int no) {
		List<ReplyDTO> repliList = service.selectReply(no);
		return ResponseEntity.status(HttpStatus.OK).body(repliList);
	}

	@PostMapping("")
	public ResponseEntity<Void> insertReply(@RequestBody ReplyDTO insertReply) {
		service.insertReply(insertReply);
	    return ResponseEntity.status(HttpStatus.CREATED).build();
	}
	
	@PostMapping("/reply")
	public ResponseEntity<Void> insertReplyReply(@RequestBody ReplyDTO insertReply) {
		service.insertReply(insertReply);
	    return ResponseEntity.status(HttpStatus.CREATED).build();
	}
	
	@DeleteMapping("/{reply_no}")
	public ResponseEntity<Void> deleteReply(@PathVariable("reply_no")int reply_no, @RequestHeader("member_no") int memberNo){
		Map<String, Integer>hmap = new HashMap<String, Integer>();
		hmap.put("reply_no", reply_no);
		hmap.put("member_no", memberNo);
		if (service.deleteReply(hmap)) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	
	
}
