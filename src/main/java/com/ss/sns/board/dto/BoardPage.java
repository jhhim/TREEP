package com.ss.sns.board.dto;

import java.util.ArrayList;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class BoardPage {
	private ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
	private int pageSize;		// 한 페이지에 보여줄 게시글 수
	private int totalCount;		// 전체 게시글 수
	private int totalPage;		// 전체 페이지 수
	private int currentPage;	// 현재 페이지 번호
	private int startNo; 		// 현재 페이지의 첫번째 게시글 번호
	private int endNo;			// 현재 페이지의 첫번째 게시글 번호
	private int startPage;		// 시작 페이지
	private int endPage; 		// 끝 페이지
	
	public BoardPage(int pageSize, int totalCount, int currentPage) {
		
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		
		init();
	}
	
	private void init() {
		totalPage = (int) Math.ceil((double) totalCount / pageSize);
		currentPage = Math.min(currentPage, totalPage);
		
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		endNo = Math.min(endNo, totalCount);
		
		int block = 5;
		int currentBlock = (currentPage - 1) / block;
		startPage = currentBlock * block + 1;
		endPage = Math.min(startPage + block - 1, totalPage);
	}

}