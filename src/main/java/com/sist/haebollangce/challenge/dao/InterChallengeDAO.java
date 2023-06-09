package com.sist.haebollangce.challenge.dao;

import java.util.List;

public interface InterChallengeDAO {

	// 챌린지 불러오기
	List<challengeVO> challengeList();

	// 카테고리 불러오기
	List<challengeVO> categoryList();

	// 카테고리별 챌린지 불러오기
	List<challengeVO> challengelist();

	


}
