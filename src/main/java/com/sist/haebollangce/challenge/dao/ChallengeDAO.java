package com.sist.haebollangce.challenge.dao;





import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.sist.haebollangce.common.mapper.InterMapper;


@Repository
public class ChallengeDAO implements InterChallengeDAO {


	@Autowired
    private InterMapper mapper;
	
	// 챌린지 불러오기
	@Override
	public List<challengeVO> challengeList() {
	    
		return mapper.challengeList();
	}

	// 카테고리 불러오기
	@Override
	public List<challengeVO> categoryList() {
		
		
		return mapper.categoryList();
	}

	// 카테고리별 챌린지 불러오기
	@Override
	public List<challengeVO> challengelist() {
		
		
		return mapper.challengelist();
	}

	

    
}
