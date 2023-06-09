package com.sist.haebollangce.challenge.service;

import java.util.List;

import com.sist.haebollangce.challenge.dao.challengeVO;

public interface InterChallengeService {

	// 챌린지 불러오기
	List<challengeVO> challengeList();

	// 카테고리 불러오기
	List<challengeVO> categoryList();

	// 카테고리별 챌린지 불러오기
	List<challengeVO> challengelist();

	



	
}
