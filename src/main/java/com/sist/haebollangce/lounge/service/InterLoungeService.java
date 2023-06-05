package com.sist.haebollangce.lounge.service;

import java.util.List;
import java.util.Map;

import com.sist.haebollangce.lounge.model.LoungeBoardDTO;
import com.sist.haebollangce.lounge.model.LoungeCommentDTO;

public interface InterLoungeService {

	// === #2. 게시판 글쓰기 완료 요청 ===
	int loungeAdd(LoungeBoardDTO lgboarddto);

	// === #2-1. 파일첨부가 있는 게시판 글쓰기 완료 요청 ===
	int loungeAdd_withFile(LoungeBoardDTO lgboarddto);
	
	// --- #3-1. 페이징 처리 안한 검색어 있는 전체 글 목록 보기 ---
	List<LoungeBoardDTO> lgboardListSearch(Map<String, String> paraMap);

	// === #11. 검색어 입력시 자동글 완성하기 (Ajax 로 처리) ===
	List<String> lgwordSearchShow(Map<String, String> paraMap);

	// --- #4-1. 글 조회수 증가와 함께 글 1개를 조회 해주는 것 ---
	LoungeBoardDTO lggetView(Map<String, String> paraMap);

	// --- #4-2. 글 조회수 증가는 없고, 단순히 글 1개만 조회해주는 것 ---
	LoungeBoardDTO lggetViewWithNoAddCount(Map<String, String> paraMap);

	// === #6. 라운지 글 수정 페이지 요청 완료 ===
	int lgedit(LoungeBoardDTO lgboarddto);

	// === #8. 라운지 글 삭제 페이지 요청 완료 ===
	int lgdel(Map<String, String> paraMap);

	// === #9. 댓글쓰기(transaction 처리) ===
	// --- 댓글쓰기(insert) / 원게시물에 댓글수 증가(update)
	int loungeaddComment(LoungeCommentDTO lgcommentdto) throws Throwable;

	// === #10. 원 게시물에 딸린 댓글들을 조회 ===
	List<LoungeCommentDTO> lggetCommentList(String parentSeq);

	
	
}
