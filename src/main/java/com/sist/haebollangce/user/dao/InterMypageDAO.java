package com.sist.haebollangce.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sist.haebollangce.user.dto.UserDTO;

public interface InterMypageDAO {
	
	// 결제하기 시작
	int go_purchase(Map<String, String> paraMap);

	// 결제한 예치금을 보유예치금에 추가하기
	int plus_deposit(Map<String, String> paraMap);
	
	// 전환한 상금 감소하기
	int reward_minus(Map<String, String> paraMap);

	// 상금 전환 테이블에 전환된 내용 넣기
	int reward_convert(Map<String, String> paraMap);

	// 결제 현황 페이지에서 예치금 내역 알아오기
	List<Map<String, Object>> search_data(Map<String, Object> paraMap);

	// 결제 현황 페이지에서 상금 내역 알아오기
	List<Map<String, Object>> search_reward(Map<String, Object> paraMap);

	// 비밀번호 확인 후 회원 정보수정 페이지 가기
	UserDTO select_info(Map<String, String> paraMap);

	// 이메일 중복확인 하기
	int select_change_email(String change_email);

	// 사용자 정보 수정하기
	int mypage_info_edit(Map<String, Object> paraMap);

<<<<<<< HEAD
=======
	// 회원 탈퇴하기
	int delete_user(Map<String, String> paraMap);

	// 찜한 챌린지 불러오기
	List<Map<String, Object>> select_like_challenge(String userid);
	
	// 찜한 라운지 불러오기
	List<Map<String, Object>> select_like_lounge(String userid);

	// 진행중인 챌린지 페이지 정보 가지고오기
	List<Map<String, String>> mypage_challenging(Map<String, String> paraMap);

	// 마이페이지 홈화면 사용자 정보 불러오기
	List<Map<String, String>> user_information(String userid);
	
	// 진행중인 챌린지 중 오늘 하루 인증했는지 여부
	List<Map<String, String>> mypage_certify_challenge(Map<String, String> paraMap);

	// 완료한 챌린지 갯수 불러오기
	int finish_count(Map<String, String> paraMap);
	
	// 마이페이지 100% 인증한 챌린지 갯수 불러오기
	int finish_100_count(Map<String, String> paraMap);

	// 마이페이지 홈 챌린지 그래프-챌린지 참여 횟수
	List<Map<String, String>> chart_challenging(Map<String, String> paraMap);
	List<Map<String, String>> chart_category(Map<String, String> paraMap);


	
>>>>>>> branch 'main' of https://github.com/n02607/Haebollangce.git

}
