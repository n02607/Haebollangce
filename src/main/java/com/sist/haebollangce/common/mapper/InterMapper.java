package com.sist.haebollangce.common.mapper;

import com.sist.haebollangce.challenge.dto.ChallengeDTO;
import com.sist.haebollangce.lounge.model.LoungeBoardDTO;
import com.sist.haebollangce.lounge.model.LoungeCommentDTO;
import com.sist.haebollangce.user.dto.UserDTO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InterMapper {
 
    int test_insert(String userid);

    int fromBoard2(String userid);

    String findById(String id);

    UserDTO getDetail(String userid);

    // === #2. 게시판 글쓰기 완료 요청 ===
	int loungeAdd(LoungeBoardDTO lgboarddto) throws Exception;

	// --- #3-1. 페이징 처리 안한 검색어 있는 전체 글 목록 보기 --- 
	List<LoungeBoardDTO> lgboardListSearch(Map<String, String> paraMap);

	// === #11. 검색어 입력시 자동글 완성하기 (Ajax 로 처리) === 
	List<String> lgwordSearchShow(Map<String, String> paraMap);

	
	// --- #4-1. 글 조회수 증가와 함께 글 1개를 조회 해주는 것 ---
	LoungeBoardDTO lggetView(Map<String, String> paraMap);
	
	// --- #4-1-1. 글 조회수 1 증가 ---
	void lgsetAddReadCount(String seq);

	// === #6. 라운지 글 수정 페이지 요청 완료 ===
	int lgedit(LoungeBoardDTO lgboarddto);

	// === #8. 라운지 글 삭제 페이지 요청 완료 ===
	int lgdel(Map<String, String> paraMap); 
	
	// --- #9-1. tbl_lounge_comment 댓글쓰기(insert)--- 
	int loungeaddComment(LoungeCommentDTO lgcommentdto);

	// --- #9-2. tbl_lounge_board 댓글수증가(update)--- 
	int loungeupdateCount(String parentSeq);
	
	// --- #9-3. tbl_lounge_comment 테이블에서 groupno 컬럼의 최대값 알아오기 ---
	// -> 원댓글쓰기 : groupno 컬럼의 최대값(max)+1 로 해서 insert 해야한다
	/* int getGroupno_max(); */
	
	// === #10. 원 게시물에 딸린 댓글들을 조회 ===
	List<LoungeCommentDTO> lggetCommentList(String parentSeq);

	
	List<ChallengeDTO> getJoinedChaList();
	// 참가중인 챌린지 리스트 가져오기

	
	


}
