package com.ss.sns.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
}
