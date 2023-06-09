package com.sist.haebollangce.user.service;

<<<<<<< HEAD
import java.io.File;
import java.util.Iterator;
=======
import java.util.HashMap;
>>>>>>> branch 'main' of https://github.com/n02607/Haebollangce.git
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.sist.haebollangce.common.FileManager;
=======
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
>>>>>>> branch 'main' of https://github.com/n02607/Haebollangce.git
import com.sist.haebollangce.user.dao.InterMypageDAO;
import com.sist.haebollangce.user.dto.UserDTO;
import com.sist.haebollangce.user.util.AES256;

@Service
public class MypageService implements InterMypageService {

	@Autowired // DAO
	private InterMypageDAO dao;
 
	@Autowired // 암호, 이메일 복호화
	private AES256 aes;
	  
	@Autowired // 파일 업로드
	private FileManager fileManager;
 
	// 결제하기
	@Override
	public int go_purchase(Map<String, String> paraMap) {

		int n = dao.go_purchase(paraMap);

		return n;
	}

	// 결제한 예치금을 보유예치금에 추가하기
	@Override
	public int plus_deposit(Map<String, String> paraMap) {

		int plus = dao.plus_deposit(paraMap);

		return plus;
	}

	// 전환한 상금 감소시키기
	@Override
	public int reward_minus(Map<String, String> paraMap) {

		int n = dao.reward_minus(paraMap);

		return n;
	}

	// 상금 전환 테이블에 전환된 내용 넣기
	@Override
	public int reward_convert(Map<String, String> paraMap) {

		int n = dao.reward_convert(paraMap);

		return n;
	}

	// 결제 현황 페이지에서 내역 알아오기
	@Override
	public String search_data(Map<String, Object> paraMap) {

		List<Map<String, Object>> search_list = null;

		int sort = Integer.parseInt(((String) paraMap.get("sort")));

		JSONArray jsonArr = new JSONArray();

		if (sort == 2) {

			search_list = dao.search_data(paraMap);

			if (search_list != null && search_list.size() > 0) {
				for (Map<String, Object> map : search_list) {

					JSONObject jsonObj = new JSONObject();

					jsonObj.put("purchase_date", map.get("purchase_date"));
					jsonObj.put("purchase_price", map.get("purchase_price"));
					jsonObj.put("purchase_status", map.get("purchase_status"));
					jsonObj.put("deposit", map.get("deposit"));

					jsonArr.put(jsonObj);
				}
			}

		} // end of if( sort == 2 ) -----

		else if (sort == 5) {
			search_list = dao.search_reward(paraMap);

			if (search_list != null && search_list.size() > 0) {
				for (Map<String, Object> map : search_list) {

					JSONObject jsonObj = new JSONObject();

					jsonObj.put("reward_date", map.get("reward_date"));
					jsonObj.put("reward", map.get("reward"));
					jsonObj.put("challenge_name", map.get("challenge_name"));
					jsonObj.put("reward_balance", map.get("reward_balance"));
					jsonObj.put("convert_reward", map.get("convert_reward"));

					jsonArr.put(jsonObj);
				}
			}

		} // end of else if( sort == 5 ) {} -----

		return jsonArr.toString();
	}

	// 비밀번호 확인 후 회원 정보수정 페이지 가기
	@Override
	public UserDTO select_info(Map<String, String> paraMap) {

		UserDTO udto = dao.select_info(paraMap);

		return udto;
	}

	// 이메일 중복확인 하기
	@Override
	public String select_change_email(String change_email) {

		int n = dao.select_change_email(change_email);

		JSONObject jsonObj = null;

		if (n == 1) {
			jsonObj = new JSONObject();

			jsonObj.put("n", n);
		} else {
			jsonObj = new JSONObject();

			jsonObj.put("n", n);
		}

		return jsonObj.toString();
	}

	
	// 사용자 정보 수정하기
	@Override
	public String mypage_info_edit(Map<String, Object> paraMap) {

		int n = dao.mypage_info_edit(paraMap);
		  
		// System.out.println("service n " + n);
		
		JSONObject jsonObj = null;
		
		if (n == 1) {
			jsonObj = new JSONObject();

			jsonObj.put("n", n);
		} else {
			jsonObj = new JSONObject();

			jsonObj.put("n", n);
		}
		
		return jsonObj.toString();
	}
<<<<<<< HEAD
	/*
	 * @Override public String profile_upload_ajax(UserDTO udto,
	 * MultipartHttpServletRequest mrequest, MultipartFile profile_pic_file) {
	 * 
	 * JSONObject jsonObj = null;
	 * 
	 * int n = 0;
	 * 
	 * MultipartFile attach = udto.getAttach();
	 * 
	 * if( !attach.isEmpty()) {
	 * 
	 * HttpSession session = mrequest.getSession(); String root =
	 * session.getServletContext().getRealPath("/");
	 * 
	 * String path = root + "resourse" + File.separator + "static" + File.separator
	 * + "images";
	 * 
	 * System.out.println(path);
	 * 
	 * File dir = new File(path); if(!dir.exists()) { dir.mkdirs(); }
	 * 
	 * String newFileName = "";
	 * 
	 * byte[] bytes = null; // 첨부파일의 내용물을 담는 것
	 * 
	 * long fileSize = 0; // 첨부파일의 크기
	 * 
	 * try { bytes = attach.getBytes(); // 첨부파일의 내용물을 읽어오는 것
	 * 
	 * String originalFilename = attach.getOriginalFilename();
	 * 
	 * newFileName = fileManager.doFileUpload(bytes, originalFilename, path); // 파일
	 * 업로드
	 * 
	 * System.out.println(">>> 확인용 newFileName => " + newFileName);
	 * 
	 * udto.setFileName(newFileName);
	 * 
	 * udto.setOrgFilename(originalFilename); // 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때
	 * 사용. // 또한 사용자가 파일을 다운로드 할때 사용되어지는 파일명으로 사용.
	 * 
	 * fileSize = attach.getSize(); // 첨부파일의 크기(단위는 byte임)
	 * udto.setFileSize(String.valueOf(fileSize));
	 * 
	 * n = 1;
	 * 
	 * jsonObj.put("n", n); } catch (Exception e) { e.printStackTrace(); n = 0;
	 * 
	 * jsonObj.put("n", n); }
	 * 
	 * }
	 * 
	 * return jsonObj.toString(); }
	 */
=======

	// 회원 탈퇴하기
	@Override
	public int delete_user(Map<String, String> paraMap) {
		
		int n = dao.delete_user(paraMap);
		
		return n;
	}

	// 찜한 챌린지 불러오기
	@Override
	public String like_challenge(String userid) {
		
		List<Map<String, Object>>  like_challenge_list = dao.select_like_challenge(userid);
		
		JsonArray jsonArr = new JsonArray();
		
		if(like_challenge_list != null && like_challenge_list.size() > 0) {
			
			for(Map<String, Object> map : like_challenge_list) {
				
				JsonObject jsonObj = new JsonObject();
				
				jsonObj.addProperty("thumbnail", (String) map.get("thumbnail"));
				jsonObj.addProperty("challenge_code", (int) map.get("challenge_code"));
				jsonObj.addProperty("challenge_name", (String) map.get("challenge_name"));
				jsonObj.addProperty("startdate", (String) map.get("startdate"));
				jsonObj.addProperty("enddate", (String) map.get("enddate"));
				
				jsonArr.add(jsonObj);
			}
			
		}
		
		return new Gson().toJson(jsonArr);
	}
	
	// 찜한 라운지 불러오기
	@Override
	public String like_lounge(String userid) {
		
		List<Map<String, Object>>  like_lounge_list = dao.select_like_lounge(userid);
		
		JsonArray jsonArr = new JsonArray();
		
		if(like_lounge_list != null && like_lounge_list.size() > 0) {
			
			for(Map<String, Object> map : like_lounge_list) {
				
				JsonObject jsonObj = new JsonObject();
				
				jsonObj.addProperty("seq", (String) map.get("seq"));
				jsonObj.addProperty("name", (String) map.get("name"));
				jsonObj.addProperty("subject", (String) map.get("subject"));
				jsonObj.addProperty("content", (String) map.get("content"));
				jsonObj.addProperty("likeCount", (String) map.get("likeCount"));
				jsonObj.addProperty("commentCount", (String) map.get("commentCount"));
				jsonObj.addProperty("readCount", (String) map.get("readCount"));
				jsonObj.addProperty("profile_pic", (String) map.get("profile_pic"));
				jsonObj.addProperty("filename", (String) map.get("filename"));
				
				jsonArr.add(jsonObj);
			}
			
		}
		
		return new Gson().toJson(jsonArr);
	}

	
	// 진행중인 챌린지 페이지 정보 가지고오기
	@Override
	public String mypage_challenging(Map<String, String> paraMap) {
		
		// 진행중인 챌린지 알아오기
		List<Map<String, String>> mypage_challenging_list = dao.mypage_challenging(paraMap); 
		
		JsonArray jsonArr = new JsonArray();
		
		if(mypage_challenging_list != null && mypage_challenging_list.size() > 0) {
			
			for(Map<String, String> map : mypage_challenging_list ) {
				
				JsonObject jsonObj = new JsonObject();
				
				jsonObj.addProperty("fk_challenge_code", map.get("fk_challenge_code"));
				jsonObj.addProperty("thumbnail", map.get("thumbnail"));
				jsonObj.addProperty("challenge_name", map.get("challenge_name"));
				jsonObj.addProperty("set_date", map.get("set_date"));
				jsonObj.addProperty("startdate", map.get("startdate"));
				jsonObj.addProperty("fk_userid", map.get("fk_userid"));
				jsonObj.addProperty("hour_start", map.get("hour_start"));
				jsonObj.addProperty("hour_end", map.get("hour_end"));
				jsonObj.addProperty("finish_day", map.get("finish_day"));
				jsonObj.addProperty("freq_type", map.get("freq_type"));
				jsonObj.addProperty("frequency", map.get("frequency"));
				
				jsonArr.add(jsonObj);
				
			}
			
		}
		
		return new Gson().toJson(jsonArr);
	}
	
	// 챌린지 추천하기
	@Override
	public String recommend(String userid) {
		
		List<Map<String, String>> interest_list = dao.interest(userid);
		
		JsonArray jsonArr = new JsonArray();
		
		
		if(interest_list != null && interest_list.size() > 0) {
			for(Map<String,String> map : interest_list) {
				
				JsonObject jsonObj = new JsonObject();
				
				jsonObj.addProperty("thumbnail", (String) map.get("thumbnail"));
				jsonObj.addProperty("challenge_name", (String) map.get("challenge_name"));
				jsonObj.addProperty("regDate", (String) map.get("regDate"));
				jsonObj.addProperty("startdate", (String) map.get("startdate"));
				jsonObj.addProperty("member_count", (String) map.get("member_count"));
				jsonObj.addProperty("fk_userid", (String) map.get("fk_userid"));
				
				jsonArr.add(jsonObj);
				
			}
		}
		
		return new Gson().toJson(jsonArr);
	}

	// 진행중인 챌린지 페이지에서 그래프 그리기
	@Override
	public String graph_challenge_during(String userid) {

		List<Map<String, Object>> search_list = null;
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("sort", "0");
		
		JsonArray jsonArr = new JsonArray();
		
		search_list = dao.challenge_during_deposit(paraMap);  // 챌린지 참여에 사용된 예치금 알아오기
		
		if (search_list != null && search_list.size() > 0) {
			for (Map<String, Object> map : search_list) {

				JsonObject jsonObj = new JsonObject();
				
				jsonObj.addProperty("category_name", (String) map.get("category_name"));
				jsonObj.addProperty("fk_category_code", (String) map.get("fk_category_code"));
				
				jsonArr.add(jsonObj);
			}
		}
		
		return new Gson().toJson(jsonArr);
	}

	// 마이페이지 홈화면 사용자 정보 불러오기
	@Override
	public String user_information(String userid) {
		
		List<Map<String, String>> information_list = dao.user_information(userid);
		
		JsonArray jsonArr = new JsonArray();
		
		JsonObject jsonObj = new JsonObject();
		
		if(information_list != null && information_list.size() > 0) {
			
			for(Map<String, String> map:information_list) {
				
				jsonObj.addProperty("userid", (String) map.get("userid"));
				jsonObj.addProperty("name", (String) map.get("name"));
				jsonObj.addProperty("fk_level", (String) map.get("fk_level"));
				jsonObj.addProperty("exp", (String) map.get("exp"));
				jsonObj.addProperty("profile_pic", (String) map.get("profile_pic"));
				
			}
			
		}
		
		// 유저가 보유하고 있는 예치금
		int user_deposit = dao.user_deposit(userid);
		
		// 유저가 챌린지에 사용한 모든 예치금
		int user_challenge_deposit = dao.user_challenge_deposit(userid);
		
		// 유저가 현재 보유하고 있는 총 예치금
		int user_all_deposit = user_deposit - user_challenge_deposit;
		
		// 유저가 보유한 상금
		int user_reward = dao.user_reward(userid);
		
		// 유저가 전환한 상금
		int user_convert = dao.user_convert(userid);
		
		// 유저가 현재 보유하고 있는 총 상금
		int user_all_reward = user_reward - user_convert;
		
		
		jsonObj.addProperty("user_all_deposit", user_all_deposit);
		
		jsonObj.addProperty("user_all_reward", user_all_reward);
				
		jsonArr.add(jsonObj);
		
		return new Gson().toJson(jsonArr);
	}

	// 마이페이지 홈에서 인증 필요한 챌린지 불러오기
	@Override
	public String mypage_certify_challenging(Map<String, String> paraMap) {
		
			// 진행중인 챌린지 알아오기
			List<Map<String, String>> mypage_challenging_list = dao.mypage_challenging(paraMap); 
			
			// 진행중인 챌린지 중 오늘 하루 인증했는지 여부, 인증한 챌린지들 번호가 반환된다.
			List<Map<String, String>> certify_list = dao.mypage_certify_challenge(paraMap);
			
			// System.out.println("certify_list: " + certify_list.toString());
			
			// System.out.println("제거 전 : " + mypage_challenging_list.toString());
			
			// 인증한 챌린지 번호는 mypage_challenging_list에서 삭제해준다.
			for(int i=0; i<mypage_challenging_list.size(); i++) {
				
				for(int j=0; j<certify_list.size(); j++) {
					
					Map<String, String> map_cha = mypage_challenging_list.get(i);
					
					String cha_challenge_code = map_cha.get("fk_challenge_code");
					
					// System.out.println("cha_challenge_code " + cha_challenge_code + "[" + i + "]");
					
					Map<String, String> map_cer = certify_list.get(j);
					
					String cer_challenge_code = map_cer.get("fk_challenge_code");
					
					// System.out.println("cer_challenge_code " + cer_challenge_code + "[" + j + "]");
					
					if(cha_challenge_code.equals(cer_challenge_code)) {
						
						// System.out.println("cha_challenge_code " + cha_challenge_code);
						
						// System.out.println("cer_challenge_code " + cer_challenge_code);
						
						mypage_challenging_list.remove(i);
						
					}
					
				}
				
			}
			
			// System.out.println("제거 후 : " + mypage_challenging_list.toString());
			
			JsonArray jsonArr = new JsonArray();
			
			if(mypage_challenging_list != null && mypage_challenging_list.size() > 0) {
				
				for(Map<String, String> map : mypage_challenging_list ) {
					
					JsonObject jsonObj = new JsonObject();
					
					jsonObj.addProperty("fk_challenge_code", map.get("fk_challenge_code"));
					jsonObj.addProperty("thumbnail", map.get("thumbnail"));
					jsonObj.addProperty("challenge_name", map.get("challenge_name"));
					jsonObj.addProperty("set_date", map.get("set_date"));
					jsonObj.addProperty("startdate", map.get("startdate"));
					jsonObj.addProperty("fk_userid", map.get("fk_userid"));
					jsonObj.addProperty("hour_start", map.get("hour_start"));
					jsonObj.addProperty("hour_end", map.get("hour_end"));
					jsonObj.addProperty("finish_day", map.get("finish_day"));
					jsonObj.addProperty("freq_type", map.get("freq_type"));
					jsonObj.addProperty("frequency", map.get("frequency"));
					
					jsonArr.add(jsonObj);
					
				}
				
			}
			
			/*
			JsonObject resultObj = new JsonObject();
			resultObj.add("mypage_challenging", jsonArr);
			resultObj.add("certify_list", new Gson().toJsonTree(certify_list));
			*/
			
			return new Gson().toJson(jsonArr);
	}

	// 마이페이지 100% 인증한 챌린지 갯수 불러오기
	@Override
	public String finish_100_count(Map<String, String> paraMap) {
		
		int all_n = dao.finish_count(paraMap);  // 완료한 챌린지
		// 챌린지 갯수만 세는 것이므로 빠르게 계산하기 위해 전에 있던 완료된 챌린지를 쓰지 않고 실행한다.
		
		int n = dao.finish_100_count(paraMap); // 100% 완료한 챌린지
		
		int result = 0;
		
		if(all_n != 0) {
			result = (n/all_n) * 100;
		}
		
		// System.out.println(result);
	
		
		JsonObject jsonObj = new JsonObject();
		
		jsonObj.addProperty("result", result);
		
		return jsonObj.toString();
	}

	// 마이페이지 홈 챌린지 그래프-챌린지 참여 횟수
	@Override
	public String chart_challenging(Map<String, String> paraMap) {
		
		List<Map<String, String>> chart_challenging_list = dao.chart_challenging(paraMap);
		
		// System.out.println("chart_challenging_list " + chart_challenging_list.toString());
		
		JsonArray jsonArr = new JsonArray();
		
		if(chart_challenging_list != null && chart_challenging_list.size() > 0) {
			
			for(Map<String, String> map : chart_challenging_list) {
				
				JsonObject jsonObj = new JsonObject();
				
				jsonObj.addProperty("month", map.get("month"));
				jsonObj.addProperty("count", map.get("count"));
				
				jsonArr.add(jsonObj);
				
			}
			
		}
		
		return new Gson().toJson(jsonArr);
	}
	@Override
	public String chart_category(Map<String, String> paraMap) {

		List<Map<String, String>> category_list = dao.chart_category(paraMap);
		
		// System.out.println("servicee userid : " + paraMap.get("userid"));
		// System.out.println("servicee userid : " + paraMap.get("month"));
		
		// System.out.println("category_list " + category_list.toString());
		
		JsonArray jsonArr = new JsonArray();
		
		for(Map<String, String> map : category_list) {
			
			JsonObject jsonObj = new JsonObject();
			
			jsonObj.addProperty("category_name", map.get("category_name"));
			jsonObj.addProperty("percentage", map.get("percentage"));
			
			jsonArr.add(jsonObj);
		}
		
		return new Gson().toJson(jsonArr);
	}
	
>>>>>>> branch 'main' of https://github.com/n02607/Haebollangce.git

}
