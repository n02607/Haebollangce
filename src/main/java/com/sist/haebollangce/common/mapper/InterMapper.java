package com.sist.haebollangce.common.mapper;

import com.sist.haebollangce.challenge.dao.challengeVO;
import com.sist.haebollangce.user.dto.UserDTO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InterMapper {

    int test_insert(String userid);

    int fromBoard2(String userid);

    String findById(String id);

    UserDTO getDetail(String userid);
    
    List<challengeVO> challengeList();
    
    List<challengeVO> categoryList();

	List<challengeVO> challengelist();
}
