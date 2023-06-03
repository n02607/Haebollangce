<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<script type="text/javascript">

  	$(document).ready(function(){
	
  		lggoReadComment();  // 문자 시작되자마자 페이징 처리안한 댓글 읽어오기
     
  	});// end of $(document).ready(function(){})-------------------------------

  	
  	// === Function Declaration === //
  	
  	// == 댓글쓰기 ==
  	function lgcgoAddWrite() {
  		
		const commentContent = $("input#commentContent").val().trim();
  		
  		if(commentContent == "") {
  			alert("댓글 내용을 입력하세요.");
  			return; // 종료
  		}
  		
  		$.ajax({
  			url:"<%= ctxPath%>/lounge/loungeaddComment",
  			data:{"fk_userid":$("input#fk_userid").val(), 
  			      "name":$("input#name").val(), 
  			      "content":$("input#commentContent").val(),
  			      "parentSeq":$("input#parentSeq").val()} ,
  		
		    type:"post",
    		dataType:"json",
    		success:function(json){
    			console.log("~~~ 확인뇽 : " + JSON.stringify(json));
    			// ~~~ 확인뇽 : {"name":"망나뇽수진","n":0}
    			
    			if(json.n == 0) {
    				alert("댓글쓰기 실패");
    			}
    			else {
    				lggoReadComment();	// 페이징 처리 안한 댓글 읽어오기
				}
    			$("input#commentContent").val(""); // 댓글이 써졌든 아니든 이제 댓글칸 비워주기 			
    		},
    		error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
  			      
  		});//end of $.ajax()----------------------------------
  		
  	}//end of function lgcgoAddWrite()----------------
  	
  	
  	function lggoReadComment() {
  		
  		$.ajax({
			url:'<%= ctxPath%>/lounge/loungereadComment',
			data: {"parentSeq":"${requestScope.lgboarddto.seq}"},
			dataType:"json",
			success:function(json){
				
				let html = "";
  				if(json.length > 0) {
  					$.each(json, function(index, item){
  						html += " <div class='d-flex flex-row mb-3'> " +
  		                		" 	<img style='border: solid 3px #eee; border-radius: 100%; width:45px; height: 45px; vertical-align: top;' src='http://images.munto.kr/production-user/1684469607083-photo-g1p6z-101851-0?s=48x48' /> " + 
  		  	              		" 	<div class='c-details'> " +
  		  	                    " 		<h5 class='mb-1 ml-3 lounge_comment_userid'><span class='lounge_comment_name'>" + item.name + "</span></h5> " +
  		  	                    " 		<div class='c-details'> " +
  		  		                " 			<h6 class='mb-0 ml-3 lounge_comment_content'>" + item.content + "</h6> " +
  		  	                	" 		</div> " +
  		  	                	" 		<div class='c-details'> " +
  		  	                	"			<small class='mb-0 ml-3' style='color:gray;'>" + item.regdate + "</small> " +
  		  	                	"			<small type='button' class='mb-0 ml-2' style='color:gray;'>답글달기</small> " +
  		  	                	" 		</div> " +
  		  	                	" 	</div> "+ 
  		  	              		" </div> " 
  					});
  				}
  				else {
  					html += " <div>댓글이 존재하지 않습니다.</div> "
  				}
  				$("div#lgcommentDisplay").html(html);
  			},
  			error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
  			
  		});//end of $.ajax()--------------------------------------
  		
  	}//end of function lggoReadComment()----------------
  	
  	
  	
</script>


<div class=" container-fluid mt-5 mb-5 mx-auto bg-white">
	<div class="row col-md-10 mx-auto my-5 justify-content-center" style="width:50%; ">
	
		<c:if test="${not empty requestScope.lgboarddto}">
		    <div class="card p-3 mb-5 mt-5" >
		        <div class="d-flex justify-content-between">
		            <div class="d-flex flex-row align-items-center">
		                <div><img style="border-radius:60%; width:60px; height: 60px;" src="http://images.munto.kr/production-user/1684469607083-photo-g1p6z-101851-0?s=48x48" /> </div>
		                <div class="c-details">
		                    <h6 class="mb-0 ml-4">${lgboarddto.name}</h6> 
		                    <span class="ml-4">
		                    	<c:if test="${lgboarddto.regDate_ago == 0}">today new</c:if>
		                        <c:if test="${lgboarddto.regDate_ago > 0}">${lgboarddto.regDate_ago} days ago</c:if>
		                    </span>
		                </div>
		            </div>
		            <div class="badge2"> <span>follow</span> </div>
		        </div>
		        <div class="mt-4">
		            <img style="width:100%;" src="http://images.munto.kr/production-feed/1684289174510-photo-spznw-42282-0?s=1080x1080" />
		            <div class="mt-3">
		            	<h4>${lgboarddto.subject}</h5>
		                <div>${lgboarddto.content}</div>
		                <div class="mt-4"> 
		                	<span class="text1 ">
		                		<img src="https://images.munto.kr/munto-web/ic_action_like-empty-black_30px.svg?s=32x32"/>${lgboarddto.likeCount}
		                		<img src="https://images.munto.kr/munto-web/ic_action_comment_30px.svg?s=32x32"/>${lgboarddto.commentCount}
		                		<img src="https://images.munto.kr/munto-web/info_group.svg?s=32x32"/>${lgboarddto.readCount}
		                	</span> 
		                	<span class="text1 ">
		                		<i class="fa-regular fa-pen-to-square btn btnEdit" style="color: gray;" onclick="javascript:location.href='<%= ctxPath%>/lounge/loungeEdit?seq=${requestScope.lgboarddto.seq}'">&nbsp;글 수정하기</i>
		                		<i class="fa-regular fa-trash-can btn btnDelete" style="color:gray;" onclick="javascript:location.href='<%= ctxPath%>/lounge/loungeDel?seq=${requestScope.lgboarddto.seq}'">&nbsp;글 삭제하기</i>
		                	</span> 
		                </div>
		            </div>
		        </div>
		     
		    	<!-- 댓글쓰기 폼 추가 (로그인했을때만 가능)-->
		    <%--<c:if test="${not empty sessionScope.loginuser}">--%>
		    	<form name="addWriteFrm" id="addWriteFrm" style="margin-top: 20px;">
			    	<div class="d-flex flex-row align-items-center"">
		                <div > 
		                	<img style="border: solid 3px #eee; border-radius: 100%; width:45px; height: 45px; vertical-align: top;" src="https://blogpfthumb-phinf.pstatic.net/MjAyMzAzMjZfMTcg/MDAxNjc5ODA1Nzg5MTA1.q_8Sgd5xxiU_c6miUoEzA8hlH3NQxSN7b0MrRsFUFkwg.Blbzms8HupOJpb4xBiGh9sKEXI7dluwLxcNeyuo6Ry4g.PNG.jin970510/profileImage.png?type=w161" /> 
		                </div>
		                <div style="width:100%;">
		                	<input type="hidden" name="fk_userid" id="fk_userid" value="sudin" /> 
		                	<input type="hidden" name="name" id="name" value="망나뇽수진" /> 
		                    
		                    <div class=" c-details">
		                    	<h6 class="mb-0 ml-2 lounge_comment_content align-items-center">
				                    <input type="text" name="content" id="commentContent" style="border-radius:10px; border: solid 3px #eee; height: 35px; width:90%;" placeholder=" 답글입력.." /> 
			                    	
								   	<%-- === #143. 답변글쓰기가 추가된 경우 시작 === 
								   	<input type="text" name="fk_seq" size="3" value="${requestScope.fk_seq}" /> 
								   	<input type="text" name="groupno" size="3" value="${requestScope.groupno}" />   	
								   	<input type="text" name="depthno" size="3" value="${requestScope.depthno}" />  
								   	 ===        답변글쓰기가 추가된 경우 끝 === --%>
   	
			                    	<%-- 댓글에 달리는 원게시물의 글번호(즉, 부모글 글번호) --%>
			                    	<input type="hidden" name="parentSeq" id="parentSeq" value="${requestScope.lgboarddto.seq}"/>&nbsp;
			                    	<button type="button" class="btn btn-habol btn-sm" style="width:50px;" onclick="lgcgoAddWrite()">게시</button>
		                    	</h6>
		                	</div>
		                </div>
		            </div>
		        </form>
		    <%--</c:if>--%>
		    	<!-- 댓글쓰기끝 -->
		    	
		    	<hr style="border: solid 1px #eee;">
		    	
		    	<!-- 댓글보기 -->
				<div id="lgcommentDisplay"></div>
	            <!-- 댓글보기 끝-->
	            
		    </div>
	    </c:if>
	</div>
</div>



























<!-- lounge_content 시작 -->
<div class="container mt-5 mb-5">
	<h4 class="d-flex justify-content-center mb-5 pb-1"><span style="border-bottom: solid 3px gray; color:gray;">피드 더보기</span></h4>
    <div class="row">
        <div class="col-md-3 col-sm-6">
            <div class="card p-3 mb-5">
                <div class="d-flex justify-content-between">
                    <div class="d-flex flex-row align-items-center">
                        <div><img style="border-radius:60%; width:35px;" src="https://lh3.googleusercontent.com/ogw/AOLn63F1Ha6NDXd-seLYOJM9EFk7xFis5ODQaOFR0zDz0w=s32-c-mo" /> </div>
                        <div class=" c-details">
                            <h6 class="mb-0 ml-2">sujin</h6> <span class="ml-2">1 days ago</span>
                        </div>
                    </div>
                    <div class="badge"> <span>follow</span> </div>
                </div>
                <div class="mt-3">
                    <img style="width:100%;" src="http://images.munto.kr/production-feed/1684333844811-photo-hut52-101851-0?s=384x384" />
                    <div class="mt-1">
                        <div>
	                        🖤Black Party🖤: 
							Let me teach you how to ‘BLACK'.    7기 
							다들 첫차 타고 갔다는 소문을 들었어…..
							‘다들 집에는 갔니?…..’ 라는 재원이의 단톡방메세지🫢
                        </div>
                        <div class="mt-3"> <span class="text1"><img src="https://images.munto.kr/munto-web/ic_action_like-empty-black_30px.svg?s=32x32"/>좋아요수<span class="text2"><img src="https://images.munto.kr/munto-web/ic_action_comment_30px.svg?s=32x32"/>댓글수</span></span> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="card p-3 mb-5">
                <div class="d-flex justify-content-between">
                    <div class="d-flex flex-row align-items-center">
                        <div><img style="border-radius:60%; width:35px;" src="http://images.munto.kr/production-user/1684469607083-photo-g1p6z-101851-0?s=48x48" /> </div>
                        <div class=" c-details">
                            <h6 class="mb-0 ml-1">평일민주</h6> <span class="ml-1">1 days ago</span>
                        </div>
                    </div>
                    <div class="badge"> <span>follow</span> </div>
                </div>
                <div class="mt-3" onclick="goView()" style="cursor:pointer;">
                    <img style="width:100%;" src="http://images.munto.kr/production-feed/1684289174510-photo-spznw-42282-0?s=1080x1080" />
                    <div class="mt-1">
                        <div>
	                        🖤Black Party🖤: 
							Let me teach you how to ‘BLACK'.    7기 
							다들 첫차 타고 갔다는 소문을 들었어…..
							‘다들 집에는 갔니?…..’ 라는 재원이의 단톡방메세지🫢
                        </div>
                        <div class="mt-3"> <span class="text1"><img src="https://images.munto.kr/munto-web/ic_action_like-empty-black_30px.svg?s=32x32"/>좋아요수<span class="text2"><img src="https://images.munto.kr/munto-web/ic_action_comment_30px.svg?s=32x32"/>댓글수</span></span> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="card p-3 mb-5">
                <div class="d-flex justify-content-between">
                    <div class="d-flex flex-row align-items-center">
                        <div><img style="border-radius:60%; width:35px;" src="http://images.munto.kr/production-user/1675570371826-photo-5nj9g-129563-0?s=48x48" /> </div>
                        <div class=" c-details">
                            <h6 class="mb-0 ml-1">서현이</h6> <span class="ml-1">1 days ago</span>
                        </div>
                    </div>
                    <div class="badge"> <span>follow</span> </div>
                </div>
                <div class="mt-3">
                    <img style="width:100%;" src="http://images.munto.kr/production-feed/1684333844811-photo-hut52-101851-0?s=384x384" />
                    <div class="mt-1">
                        <div>
	                        🖤Black Party🖤: 
							Let me teach you how to ‘BLACK'.    7기 
							다들 첫차 타고 갔다는 소문을 들었어…..
							‘다들 집에는 갔니?…..’ 라는 재원이의 단톡방메세지🫢
                        </div>
                        <div class="mt-3"> <span class="text1"><img src="https://images.munto.kr/munto-web/ic_action_like-empty-black_30px.svg?s=32x32"/>좋아요수<span class="text2"><img src="https://images.munto.kr/munto-web/ic_action_comment_30px.svg?s=32x32"/>댓글수</span></span> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="card p-3 mb-5">
                <div class="d-flex justify-content-between">
                    <div class="d-flex flex-row align-items-center">
                        <div><img style="border-radius:60%; width:35px;" src="https://lh3.googleusercontent.com/ogw/AOLn63F1Ha6NDXd-seLYOJM9EFk7xFis5ODQaOFR0zDz0w=s32-c-mo" /> </div>
                        <div class=" c-details">
                            <h6 class="mb-0 ml-1">sujin</h6> <span class="ml-1">1 days ago</span>
                        </div>
                    </div>
                    <div class="badge"> <span>follow</span> </div>
                </div>
                <div class="mt-3">
                    <img style="width:100%;" src="http://images.munto.kr/production-feed/1684333844811-photo-hut52-101851-0?s=384x384" />
                    <div class="mt-1">
                        <div>
	                        🖤Black Party🖤: 
							Let me teach you how to ‘BLACK'.    7기 
							다들 첫차 타고 갔다는 소문을 들었어…..
							‘다들 집에는 갔니?…..’ 라는 재원이의 단톡방메세지🫢
                        </div>
                        <div class="mt-3"> <span class="text1"><img src="https://images.munto.kr/munto-web/ic_action_like-empty-black_30px.svg?s=32x32"/>좋아요수<span class="text2"><img src="https://images.munto.kr/munto-web/ic_action_comment_30px.svg?s=32x32"/>댓글수</span></span> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="card p-3 mb-5">
                <div class="d-flex justify-content-between">
                    <div class="d-flex flex-row align-items-center">
                        <div><img style="border-radius:60%; width:35px;" src="https://lh3.googleusercontent.com/ogw/AOLn63F1Ha6NDXd-seLYOJM9EFk7xFis5ODQaOFR0zDz0w=s32-c-mo" /> </div>
                        <div class=" c-details">
                            <h6 class="mb-0 ml-1">sujin</h6> <span class="ml-1">1 days ago</span>
                        </div>
                    </div>
                    <div class="badge"> <span>follow</span> </div>
                </div>
                <div class="mt-3">
                    <img style="width:100%;" src="http://images.munto.kr/production-feed/1684333844811-photo-hut52-101851-0?s=384x384" />
                    <div class="mt-1">
                        <div>
	                        🖤Black Party🖤: 
							Let me teach you how to ‘BLACK'.    7기 
							다들 첫차 타고 갔다는 소문을 들었어…..
							‘다들 집에는 갔니?…..’ 라는 재원이의 단톡방메세지🫢
                        </div>
                        <div class="mt-3"> <span class="text1"><img src="https://images.munto.kr/munto-web/ic_action_like-empty-black_30px.svg?s=32x32"/>좋아요수<span class="text2"><img src="https://images.munto.kr/munto-web/ic_action_comment_30px.svg?s=32x32"/>댓글수</span></span> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="card p-3 mb-5">
                <div class="d-flex justify-content-between">
                    <div class="d-flex flex-row align-items-center">
                        <div><img style="border-radius:60%; width:35px;" src="https://lh3.googleusercontent.com/ogw/AOLn63F1Ha6NDXd-seLYOJM9EFk7xFis5ODQaOFR0zDz0w=s32-c-mo" /> </div>
                        <div class=" c-details">
                            <h6 class="mb-0 ml-1">sujin</h6> <span class="ml-1">1 days ago</span>
                        </div>
                    </div>
                    <div class="badge"> <span>follow</span> </div>
                </div>
                <div class="mt-3">
                    <img style="width:100%;" src="http://images.munto.kr/production-feed/1684333844811-photo-hut52-101851-0?s=384x384" />
                    <div class="mt-1">
                        <div>
	                        🖤Black Party🖤: 
							Let me teach you how to ‘BLACK'.    7기 
							다들 첫차 타고 갔다는 소문을 들었어…..
							‘다들 집에는 갔니?…..’ 라는 재원이의 단톡방메세지🫢
                        </div>
                        <div class="mt-3"> <span class="text1"><img src="https://images.munto.kr/munto-web/ic_action_like-empty-black_30px.svg?s=32x32"/>좋아요수<span class="text2"><img src="https://images.munto.kr/munto-web/ic_action_comment_30px.svg?s=32x32"/>댓글수</span></span> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="card p-3 mb-5">
                <div class="d-flex justify-content-between">
                    <div class="d-flex flex-row align-items-center">
                        <div class="icon"> <i class="bx bxl-reddit"></i> </div>
                        <div class=" c-details">
                            <h6 class="mb-0">Reddit</h6> <span>2 days ago</span>
                        </div>
                    </div>
                    <div class="badge"> <span>Design</span> </div>
                </div>
                <div class="mt-5">
                    <h3 class="heading">Software Architect <br>Java - USA</h3>
                    <div class="mt-5">
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="mt-3"> <span class="text1">52 Applied <span class="text2">of 100 capacity</span></span> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- lounge_content 끝 -->