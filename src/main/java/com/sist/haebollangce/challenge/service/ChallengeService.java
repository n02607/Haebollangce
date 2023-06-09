package com.sist.haebollangce.challenge.service;

import com.sist.haebollangce.challenge.dao.InterChallengeDAO;
import com.sist.haebollangce.challenge.dao.categoryVO;
import com.sist.haebollangce.challenge.dao.challengeVO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChallengeService implements InterChallengeService {

    @Autowired
    private InterChallengeDAO dao;

    // 챌린지 불러오기
	@Override
	public List<challengeVO> challengeList() {
		
		List<challengeVO> challengeList = dao.challengeList();
		
		return challengeList;
		
	}

	// 카테고리 불러오기
	@Override
	public List<challengeVO> categoryList() {
		
		List<challengeVO> categoryLsit = dao.categoryList();
		
		return categoryLsit;
	}

	// 카테고리별 챌린지 불러오기
	@Override
	public List<challengeVO> challengelist() {
		
		List<challengeVO> challengelist = dao.challengelist();
		
		
		return challengelist;
		
		
	}

	

	

    
    
}
