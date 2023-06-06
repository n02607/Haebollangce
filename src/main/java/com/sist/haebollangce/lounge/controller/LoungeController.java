package com.sist.haebollangce.lounge.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sist.haebollangce.common.FileManager;
import com.sist.haebollangce.lounge.model.LoungeBoardDTO;
import com.sist.haebollangce.lounge.model.LoungeCommentDTO;
import com.sist.haebollangce.lounge.service.InterLoungeService;


@Controller
@RequestMapping("/lounge")
public class LoungeController {

	// === 의존객체 주입 (Type 에 따라 알아서 Bean 을 주입해준다.)
	@Autowired 
	private InterLoungeService service;
	
	// === 파일업로드 및 다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI : Dependency Injection) ===  
	@Autowired  
	private FileManager fileManager;
	
	
	// === #1. 라운지 글 작성하는 form 페이지 요청 === (#51. aop 사용으로 수정 필요)
	@GetMapping(value = "/loungeAdd")
	public ModelAndView loungeAdd(ModelAndView mav) {
	
		mav.setViewName("lounge/loungeAdd.tiles1");
		// => /WEB-INF/views/tiles1/lounge/loungeAdd.jsp view 단을 보여준다. 
		
		return mav;
	}
	
	// === #2. 라운지 글쓰기 완료 요청 === (#54.)
	@PostMapping(value = "/loungeAddEnd")
	public ModelAndView loungeAddEnd(ModelAndView mav, LoungeBoardDTO lgboarddto, MultipartHttpServletRequest mrequest) {
		
		// === #2-1. 첨부파일이 있는 경우 작업  ===
		MultipartFile attach =  lgboarddto.getAttach();
		
		if( !attach.isEmpty() ) { // attach(첨부파일)가 비어있지 않으면(즉, 첨부파일이 있는 경우라면)
			
			// 1. 사용자가 보낸 첨부파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다. 
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root+"resources"+File.separator+"files";
			//	System.out.println("~~~ 첨부파일이 저장될 WAS의 폴더 경로 path  : " + path); 
			//	~~~ 확인용 파일이 올라갈 경로 path  : C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\files
			//  ~~~ 첨부파일이 저장될 WAS의 폴더 경로 path  : C:\Users\\user\git\Haebollangce\src\main\webapp\resources\files
			// -> 왜 .metadata 폴더가 아니지..??
				
			// 2. 파일첨부를 위한 변수의 설정 및 값을 초기화 한 후 파일 올리기
			String newFilename = ""; 		// WAS(톰캣)의 디스크에 저장될 파일명
			long fileSize = 0;		 		// 첨부파일의 크기
			byte[] bytes = null; 	 		// 첨부파일의 내용물을 담는 것
			
			try {
				bytes = attach.getBytes();  // 첨부파일의 내용물을 읽어오는 것
				
				String originalFilename = attach.getOriginalFilename();
				//	System.out.println("~~~ 첨부파일의 파일명 originalFilename : " + originalFilename); 
				// ~~~ 첨부파일의 파일명 originalFilename : 댐벼.jpg
				
				newFilename = fileManager.doFileUpload(bytes, originalFilename, path);
				//	System.out.println("~~~ 확인용 newFilename : " + newFilename);
				// ~~~ 확인용 newFilename : 20230605160348266890041852700.jpg
				
				// 3. LoungeBoardDTO lgboarddto 에 fileName 값과 orgFilename 값과 fileSize 값을 넣어주기 	
				lgboarddto.setFileName(newFilename);	
				lgboarddto.setOrgFilename(originalFilename);

				fileSize = attach.getSize(); // 첨부파일의 크기 (단위는 byte)
				lgboarddto.setFileSize(String.valueOf(fileSize));
				
			} catch (Exception e) { // 모든 익셉션 수용가능
				e.printStackTrace();
			}	
			
		}//end of try~catch()------------------------------------------
		
		int n = 0;
		
		if( attach.isEmpty() ) {
			n = service.loungeAdd(lgboarddto); // -> 파일첨부 없음
		}
		else {
			n = service.loungeAdd_withFile(lgboarddto); // -> 파일첨부 있음
		}
		
		if(n==1) { // insert 가 성공하면 /loungeList 페이지  주소로 URL요청을 다시 한다.
			mav.setViewName("redirect:/lounge/loungeList");
		}
		else {     // insert 에 실패하면 error 페이지를 보여라.
			mav.setViewName("lounge/error/add_arror.tiles1");
			// => /WEB-INF/views/tiles1/lounge/error/add_arror.jsp view 단을 보여준다.
		}
		
		return mav;
	}

	// === #2-2. 스마트에디터. 드래그앤드롭을 사용한 다중사진 파일업로드 ===
	@PostMapping(value="/challenge/image/multiplePhotoUpload.action")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
	
		// 1. 사용자가 보낸 파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다.
		HttpSession session = request.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources"+File.separator+"lgphoto_upload";
	
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		try {
			String filename = request.getHeader("file-name"); // 파일명(문자열)을 받는다 - 일반 원본파일명
			// 네이버 스마트에디터를 사용한 파일업로드시 싱글파일업로드와는 다르게 멀티파일업로드는 파일명이 header 속에 담겨져 넘어오게 되어있다. 
			
			InputStream is = request.getInputStream(); // is는 네이버 스마트 에디터를 사용하여 사진첨부하기 된 이미지 파일임.
			
			String newFilename = fileManager.doFileUpload(is, filename, path);
			
			
			String ctxPath = request.getContextPath(); //  /board
			
			String strURL = "";
			strURL += "&bNewLine=true&sFileName="+newFilename; 
			strURL += "&sFileURL="+ctxPath+"/resources/photo_upload/"+newFilename;
			
			// === 웹브라우저 상에 사진 이미지를 쓰기 === //
			PrintWriter out = response.getWriter();
			out.print(strURL);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// === #3. 라운지 글목록 보기 페이지 요청 === (#58.)
	@GetMapping(value = "/loungeList")
	public ModelAndView loungeList(ModelAndView mav, HttpServletRequest request) {
	
		List<LoungeBoardDTO> lgboardList = null; // 글이 없을 수도 있으니까 default 값으로 null 설정
	
		// --- session 을 사용해 새로고침 할 때는 조회수 증가 없이 select 만 하게 하자 (#69.)
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
		/*
		session 에  "readCountPermission" 키값으로 저장된 value값은 "yes"(조회수 증가 권한이 있다) 이다. 
		session 에  "readCountPermission" 키값에 해당하는 value값 "yes"를 얻으려면 
		반드시 웹브라우저에서 주소창에 "/lounge/loungeList" 이라고 입력해야만 얻어올 수 있다. 
		*/
		
		String searchType = request.getParameter("searchType"); 
		String searchWord = request.getParameter("searchWord"); 
		//String str_currentShowPageNo = request.getParameter("currentShowPageNo"); // 페이징 처리를 위해 보여주는 현재 페이지 번호
		
		
		if(searchType == null) { searchType = ""; }
		if(searchWord == null) { searchWord = ""; }
		if(searchWord != null) { searchWord = searchWord.trim(); } // 공백제거
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);

		// --- #3-1. 페이징 처리 안한 검색어 있는 전체 글 목록 보기 (#102.)
		lgboardList = service.lgboardListSearch(paraMap);
				
		// ""이 아닐때만 view 단에 보내주겠따.
		// -- 아래는 검색대상 컬럼과 검색어를 유지시키기 위한 작업의 시작이다 --
		if( !"".equals(searchType) && !"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
				
		mav.addObject("lgboardList", lgboardList);
		mav.setViewName("lounge/loungeList.tiles1");
		// => /WEB-INF/views/tiles1/lounge/loungeList.jsp view 단을 보여준다.  
		
		return mav;
	}
	
	
	// === #11. 검색어 입력시 자동글 완성하기 (Ajax 로 처리) === (#108.)
	@ResponseBody
	@GetMapping(value = "/lgwordSearchShow", produces="text/plain;charset=UTF-8")
	public String lgwordSearchShow(HttpServletRequest request) {
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		List<String> lgwordList = service.lgwordSearchShow(paraMap);
		
		// lgwordList 를 json 형식으로 만들어 넘기면 끝
		JSONArray jsonArr = new JSONArray(); // []
			
		if(lgwordList != null) {
			
			for(String lgword : lgwordList) {
				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("lgword", lgword);
				jsonArr.put(jsonObj);
				
			}//end of for()--------------------
			
		}
		return jsonArr.toString();
	}
	
	
	// === #4. 라운지 글 1개 보는 페이지 요청 ===
	@GetMapping(value = "/loungeView")
	public ModelAndView loungeView(ModelAndView mav, HttpServletRequest request) {
	
		// === #9-4. 답변글쓰기가 추가된 경우 시작 === //
		String fk_seq = request.getParameter("fk_seq");
		String groupno = request.getParameter("groupno");
		String depthno = request.getParameter("depthno");
		String name = request.getParameter("name");
		
		if(fk_seq == null) { // null 이라는 글자로 알아듣는 것을 방지해주기 위해 없다는 의미로 "" 처리를 해줘야 한다
			fk_seq = "";
		}
		
		mav.addObject("fk_seq", fk_seq);
		mav.addObject("groupno", groupno);
		mav.addObject("depthno", depthno);
		mav.addObject("name", name); // -> 원글쓰기의 경우에는 위 4개의 값이 모두 null 일 것이다
		// === 답변글쓰기가 추가된 경우 끝 ===================================================
		
		// --- 조회하고자 하는 글번호 받아오기 ---
		String seq = request.getParameter("seq");
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		if(searchType == null) {
			searchType = "";
		}
		if(searchWord == null) {
			searchWord = "";
		}
		
		// get 방식도 허용되다 보니 '숫자가 아닌 값을 입력해 유저가 장난'칠 수 있으니 익셉션 처리가 필요하다
		try {
			Integer.parseInt(seq);
			
			Map<String,String> paraMap = new HashMap<>();
			paraMap.put("seq", seq);
			
			HttpSession session = request.getSession();
			
			// --- session 을 사용해 새로고침 할 때는 조회수 증가 없이 select 만 하게 하자
			LoungeBoardDTO lgboarddto = null;
			
			// --- 글목록보기 를 클릭한 다음에 특정글을 조회한 경우 ---
			if("yes".equals(session.getAttribute("readCountPermission"))) {
				
				lgboarddto = service.lggetView(paraMap); 
				// 글 조회수 증가와 함께 글 1개를 조회 해주는 것
				
				session.removeAttribute("readCountPermission");
				// !! [중요] session 에 저장된  readCountPermission 을 삭제한다.
			}
			// --- 웹브라우저에서 새로고침(F5)을 클릭한 경우 ---
			else {
				lgboarddto = service.lggetViewWithNoAddCount(paraMap); 
				// 글 조회수 증가는 없고, 단순히 글 1개만 조회해주는 것
			}
			
			mav.addObject("lgboarddto", lgboarddto); // 게시글을 넘겨주겠다(null이 올수도 있음)
		
		} catch (NumberFormatException e) {
			// 글번호seq 가 숫자가 아니면 무응답 ㅇㅇ
		}
		
		mav.setViewName("lounge/loungeView.tiles1");
		// => /WEB-INF/views/tiles1/lounge/loungeView.jsp 페이지를 만들어야 한다. 
		
		return mav;
	}
	
	
	// === #5. 라운지 글 수정 페이지 요청 ===
	@GetMapping(value = "/loungeEdit")
	public ModelAndView loungeEdit(ModelAndView mav, HttpServletRequest request) {
	
		// 수정하고자 하는 글번호 받아오기 
		String seq = request.getParameter("seq");
		
		// 수정하고자 하는 글내용 가져오기 (이 안에 작성자 정보고 포함되어있음)
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("seq", seq);
		
		// 파일첨부가 된 글이라면 글 수정 시 첨부파일이 있으면 paraMap 에 담아준다 
		paraMap.put("searchType", "");
		paraMap.put("searchWord", "");
		
		// 글조회수(readCount) 증가 없이 단순히 글 1개만 조회
		LoungeBoardDTO lgboarddto = service.lggetViewWithNoAddCount(paraMap); 
		
		mav.addObject("lgboarddto", lgboarddto);
		mav.setViewName("lounge/loungeEdit.tiles1");
		// => /WEB-INF/views/tiles1/lounge/loungeEdit.jsp view 단을 보여준다.
		
		return mav;
	}
	
	
	// === #6. 라운지 글 수정 페이지 요청 완료 ===
	@PostMapping(value = "/loungeEditEnd")
	public ModelAndView loungeEditEnd(ModelAndView mav, LoungeBoardDTO lgboarddto, HttpServletRequest request) {
		
		/* 글 수정은 원본글의 글암호와 수정시 입력한 암호가 일치할 때만 가능하도록 한다. */
		// n 이 1 이라면 정상적으로 글수정 완료, 0 이라면 글수정에 필요한 글암호가 틀린경우임
		int n = service.lgedit(lgboarddto);
		
		if(n==0) {
			mav.addObject("message", "암호가 일치하지 않아 글 수정이 불가합니다.");
			mav.addObject("loc", "javascript:history.back()");
		}
		else {
			mav.addObject("message", "글 수정 완료");
			mav.addObject("loc", request.getContextPath()+"/lounge/loungeView?seq="+lgboarddto.getSeq()); 
			// /lounge/loungeView 은 seq 를 넘겨줌
		}
		
		mav.setViewName("msg");
		
		return mav;
	}
	
	
	// === #7. 라운지 글 삭제 페이지 요청 ===
	@GetMapping(value = "/loungeDel")
	public ModelAndView loungeDel(ModelAndView mav, HttpServletRequest request) {
	
		// 삭제하고자 하는 글번호 받아오기 
		String seq = request.getParameter("seq");
		
		// 삭제하고자 하는 글내용 가져오기 (이 안에 작성자 정보고 포함되어있음 - 남이 쓴 글 삭제를 막기위해 필요)
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("seq", seq);
		
		// 파일첨부가 된 글이라면 글 수정 시 첨부파일이 있으면 paraMap 에 담아준다 
		paraMap.put("searchType", "");
		paraMap.put("searchWord", "");
		
		// 글조회수(readCount) 증가 없이 단순히 글 1개만 조회
		LoungeBoardDTO lgboarddto = service.lggetViewWithNoAddCount(paraMap); 
		
		mav.addObject("pw", lgboarddto.getPw()); // 삭제하려는 글의 암호
		mav.addObject("seq", seq);			     // 삭제하려는 글의 번호
		mav.setViewName("lounge/loungeDel.tiles1");
		// => /WEB-INF/views/tiles1/lounge/loungeDel.jsp view 단을 보여준다.
				
		return mav;
	}	
	
	
	// === #8. 라운지 글 삭제 페이지 요청 완료 ===
	@PostMapping(value = "/loungeDelEnd")
	public ModelAndView loungeDelEnd(ModelAndView mav, HttpServletRequest request) {
		
		// 삭제하고자 하는 글번호 받아오기 
		String seq = request.getParameter("seq");
		
		// 삭제하고자 하는 글내용 가져오기 (이 안에 작성자 정보도 포함되어있음 - 남이 쓴 글 삭제를 막기위해 필요)
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("seq", seq);
		
		// 파일첨부가 된 글이라면 글 수정 시 첨부파일이 있으면 paraMap 에 담아준다 
		paraMap.put("searchType", "");
		paraMap.put("searchWord", "");
		
		// -- 글조회수(readCount) 증가 없이 단순히 글 1개만 조회
		LoungeBoardDTO lgboarddto = service.lggetViewWithNoAddCount(paraMap);
		String fileName = lgboarddto.getFileName();
		
		if(fileName != null || !"".equals(fileName)) {
			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root+"resources"+File.separator+"files";
			
			paraMap.put("path", path);			// -> 삭제해야할 파일이 저장된 경로
			paraMap.put("fileName", fileName); 	// -> 삭제해야할 파일명
		}
				
		// 글 삭제는 원본글의 글암호와 삭제시 입력한 암호가 일치할 때만 가능하도록 한다.
		// -> n 이 1 이라면 정상적으로 글삭제 완료, 0 이라면 글삭제에 필요한 글암호가 틀린경우임
		int n = service.lgdel(paraMap);
		
		
		if(n==1) {
			mav.addObject("message", "글 삭제 완료");
			mav.addObject("loc", request.getContextPath()+"/lounge/loungeList");
		}
		else {
			mav.addObject("message", "글 삭제 실패");
			mav.addObject("loc", "javascript:history.back()"); 
		}
		
		mav.setViewName("msg");
		
		return mav;
	}
	
	
	// === #9. 라운지 글에 댓글달기 요청 (Ajax 처리)  ===
	@ResponseBody
	@PostMapping(value = "/loungeaddComment", produces="text/plain;charset=UTF-8")
	public String loungeaddComment(LoungeCommentDTO lgcommentdto, HttpServletRequest request) {
		
		// 댓글쓰기에 첨부파일이 없는 경우
		int n = 0;
		try {
			n = service.loungeaddComment(lgcommentdto);
			// 댓글쓰기(insert) 및 원게시물(tbl_board 테이블)에 댓글의 개수 증가(update 1씩 증가)하기 
	       
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n); // 정상이면 1, rollback 당하면 0 이 나올 것이다.
		jsonObj.put("name", lgcommentdto.getName());
		
		return jsonObj.toString(); // "{"n":1, "name":"???"}" -> "{"n":1, "name":"용수진"}" by produces="text/plain;charset=UTF-8"
								   // 또는 "{"n":0, "name":"용수진"}"
	}
	
	
	// === #10. 라운지 글에 댓글읽기 요청 (Ajax 처리)  ===
	@ResponseBody
	@GetMapping(value = "/loungereadComment", produces="text/plain;charset=UTF-8")
	public String loungeaddComment(HttpServletRequest request) {
	
		// 보고자하는 댓글들의 게시글번호 받아오기 
		String parentSeq = request.getParameter("parentSeq");
		
		List<LoungeCommentDTO> lgcommentList = service.lggetCommentList(parentSeq);
		
		JSONArray jsonArr = new JSONArray(); // []
		
		if(lgcommentList != null) {
			for(LoungeCommentDTO lgcmtvo : lgcommentList) {
				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("parentSeq", lgcmtvo.getParentSeq());
				jsonObj.put("seq", lgcmtvo.getSeq());
				jsonObj.put("name", lgcmtvo.getName());
				jsonObj.put("content", lgcmtvo.getContent());
				jsonObj.put("regdate", lgcmtvo.getRegDate());
				jsonObj.put("groupno", lgcmtvo.getGroupno());
				jsonObj.put("fk_seq", lgcmtvo.getFk_seq());
				jsonObj.put("depthno", lgcmtvo.getDepthno());
				
				jsonArr.put(jsonObj);
			}
		}
		return jsonArr.toString();
	}	
	
	
	// === #12. 라운지 글에 첨부파일 다운로드 받기 === (aop)
	@GetMapping(value = "/lgdownload", produces="text/plain;charset=UTF-8")
	public void lgdownload(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String seq = request.getParameter("seq");		
		// 첨부파일이 있는 글번호 20230522111442253534330919200.pdf 처럼 저장되는 fileName 값을 DB에서 가져와야 한다.
        // 또한 orgFilename 값도  DB에서 가져와야 한다.
		
		Map<String,String> paraMap = new HashMap<>(); // lounge.xml 의 lggetview 에서 3개의 파라미터가 꼭! 필요하므로 put 해줘야 한다
	    paraMap.put("searchType", "");	
	    paraMap.put("searchWord", "");
	    paraMap.put("seq", seq);
	    
	    // 두번째 파라미터인 response 는 전송되어온 데이터를 저장해서 결과물을 나타낼때 사용
  		response.setContentType("text/html; charset=UTF-8");
  		PrintWriter out = null;
  		// -> out 은 웹브라우저에 기술하는 대상체라고 생각하자!
		
  		try {
	    	Integer.parseInt(seq);
	    	LoungeBoardDTO lgboarddto = service.lggetViewWithNoAddCount(paraMap); // 글조회수 증가없이 글보기
	    	
	    	if(lgboarddto == null || (lgboarddto != null && lgboarddto.getFileName() == null)) {
	    		out = response.getWriter();				
	    		out.println("<script type='text/javascript'>alert('존재하지 않는 글번호 이거나 첨부파일이 없으므로 파일다운로드가 불가합니다.'); history.back();</script>");
	            return; // 종료
	    	}
	    	else {
	    		// --- 정상적으로 다운로드 하는 경우 ---
	    		String fileName = lgboarddto.getFileName(); 	   // 20230522111442253534330919200.pdf 이것이 바로 WAS(톰캣) 디스크에 저장된 파일명이다.
	    		String orgFilename = lgboarddto.getOrgFilename(); // 2023 마음을 사로잡는 면접전형 준비.pdf 이것이 바로 다운로드 시 보여줄 파일명이다.
	    		
	    		// 첨부파일이 저장되어 있는 WAS(톰캣)의 디스크 경로명을 알아와야만 다운로드를 해줄수 있다. 
	            // 이 경로는 우리가 파일첨부를 위해서 /loungeaddEnd.action 에서 설정해두었던 경로와 똑같아야 한다.
	            // WAS 의 webapp 의 절대경로를 알아와야 한다.
	            HttpSession session = request.getSession();
	            String root = session.getServletContext().getRealPath("/");
	    		
            	System.out.println("~~~ 확인용 webapp 의 절대경로  : " + root);
    		//  ~~~ 확인용 webapp 의 절대경로  : C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\

    			String path = root+"resources"+File.separator+"files";
    			System.out.println("~~~ 첨부파일이 저장될 WAS(툼캣)의 폴더 path : " + path);
    		//	~~~ 첨부파일이 저장될 WAS(툼캣)의 폴더 path : C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\files
	    		
    			
    			// *** file 다운로드 하기 *** //
    			boolean flag = false; 	 // file 다운로드 성공, 실패를 알려주는 용도
    			flag = fileManager.doFileDownload(fileName, orgFilename, path, response);
    			// --- file 다운로드 성공시 flag 는 true, 
                // --- file 다운로드 실패시 flag 는 false 를 가진다. 
    			if(!flag) {
	                // 다운로드가 실패할 경우 메시지를 띄워준다.
    				out = response.getWriter();
    				out.println("<script type='text/javascript'>alert('파일다운로드가 실패되었습니다.'); history.back();</script>");
	            }
    		}
	    	
	    } catch(NumberFormatException | IOException e) {
	    	try {
				out = response.getWriter();				
				out.println("<script type='text/javascript'>alert('파일다운로드가 불가합니다.'); history.back();</script>");
				e.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
	    }
  		
  		
  		
	}
}
