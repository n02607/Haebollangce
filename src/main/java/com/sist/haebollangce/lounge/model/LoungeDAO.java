package com.sist.haebollangce.lounge.model;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.haebollangce.common.mapper.InterMapper;

@Repository
public class LoungeDAO implements InterLoungeDAO {

	// === 의존객체 주입 (Type 에 따라 알아서 Bean 을 주입해준다.)
//  @Resource
//  private SqlSessionTemplate sqlsession;
	@Autowired
	private InterMapper mapper;

	// === #2. 게시판 글쓰기 완료 요청 ===
	@Override
	public int loungeAdd(LoungeBoardDTO lgboarddto) throws Exception {
		
//      int n = sqlsession.insert("user.test_insert",userid);
//      int n = mapper.test_insert(userid);
		int n = mapper.loungeAdd(lgboarddto);
		return n;
	}

	// --- #3-1. 페이징 처리 안한 검색어 없는 전체 글 목록 보기 ---
	@Override
	public List<LoungeBoardDTO> lgboardListNoSearch() {
		List<LoungeBoardDTO> lgboardList = mapper.lgboardListNoSearch();
		return lgboardList;
	}

	// --- #4-1.글 조회수 증가와 함께 글 1개를 조회 해주는 것 ---
	@Override
	public LoungeBoardDTO lggetView(Map<String, String> paraMap) {
		LoungeBoardDTO lgboarddto = mapper.lggetView(paraMap);
		return lgboarddto;
	}

	// --- #4-1-1. 글 조회수 1 증가 ---
	@Override
	public void lgsetAddReadCount(String seq) {
		mapper.lgsetAddReadCount(seq);
	}

	// === #6. 라운지 글 수정 페이지 요청 완료 ===
	@Override
	public int lgedit(LoungeBoardDTO lgboarddto) {
		int n = mapper.lgedit(lgboarddto);
		return n;
	}

	// === #8. 라운지 글 삭제 페이지 요청 완료 ===
	@Override
	public int lgdel(Map<String, String> paraMap) {
		int n = mapper.lgdel(paraMap);
		return n;
	}
	
}
