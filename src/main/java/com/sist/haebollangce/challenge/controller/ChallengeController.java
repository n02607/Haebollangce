package com.sist.haebollangce.challenge.controller;


import com.sist.haebollangce.challenge.dao.categoryVO;
import com.sist.haebollangce.challenge.dao.challengeVO;
import com.sist.haebollangce.challenge.service.InterChallengeService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChallengeController {
	
	
    @Autowired
    private InterChallengeService service;
    
    // 메인페이지
    @RequestMapping(value="/main")
	public String mainpage(HttpServletRequest request) {

    	return "main_page.tiles1";
    	// /WEB-INF/views/tiles1/main_page.jsp 페이지를 만들어야 한다.
    }

    
    // 챌린지 불러오기
    @RequestMapping(value="/challenge_all")
	public ModelAndView challenge_all(ModelAndView mav, HttpServletRequest request) {

    	List<challengeVO> challengeList = null;
    	List<challengeVO> categoryList = null;
    	
    	challengeList = service.challengeList();
    	categoryList = service.categoryList();
    	
    	mav.addObject("challengeList", challengeList);
    	mav.addObject("categoryList", categoryList);
    	
		mav.setViewName("board/challenge_all.tiles1");
		
    	return mav;
    	
    }
    
    
 
    // 카테고리별 챌린지 불러오기
    @ResponseBody
    @RequestMapping(value="/challengelist", method=RequestMethod.GET)
    public Map<String, List<challengeVO>> challengelist(@RequestParam(value = "category_code", required = false) String categoryCode) {
        List<challengeVO> challengelist = service.challengelist();
        Map<String, List<challengeVO>> categoryMap = new HashMap<>();
        
        // 카테고리 별로 데이터 그룹화
        for (challengeVO cvo : challengelist) {
            String category = cvo.getFk_category_code();
            
            // 전체 카테고리인 경우 모든 데이터 추가
            if (categoryCode == null) {
                if (!categoryMap.containsKey(category)) {
                    categoryMap.put(category, new ArrayList<>());
                }
                categoryMap.get(category).add(cvo);
            }
            // 특정 카테고리인 경우 해당 카테고리에 속하는 데이터만 추가
            else if (category.equals(categoryCode)) {
                if (!categoryMap.containsKey(category)) {
                    categoryMap.put(category, new ArrayList<>());
                }
                categoryMap.get(category).add(cvo);
            }
        }

        return categoryMap;
    }







    	
    
    
}
