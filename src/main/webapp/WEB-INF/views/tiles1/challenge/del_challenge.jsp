<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<% String ctxPath = request.getContextPath(); %>   

<style type="text/css">

</style>

<script type="text/javascript">

  	$(document).ready(function(){
     
    	$("button#btnDelete").click(function(){
    		
    		console.log("$('input#pw').val() : " + $("input#pw").val());
    		console.log("${requestScope.pw} : " + "${requestScope.pw}");
    		console.log("${requestScope.challengeCode} : " + "${requestScope.challengeCode}");
    		
    		
    			
    			if(confirm("정말로 챌린지를 삭제 하시겠습니까?")) {
    				// 폼(form)을 전송(submit)
	    			const frm = document.delFrm;
	    			frm.method = "post";
	    			frm.action = "<%= ctxPath%>/challenge/challengedelend";
	    			frm.submit();
    			}
    		
    		
    	});
     
  	});// end of $(document).ready(function(){})-------------------------------

</script>

<div class=" container-fluid mt-5 mb-5 mx-auto bg-white">
	<div class=" col-md-10 mx-auto my-5 justify-content-center" style="width:80%; ">

		<h4 class="d-flex justify-content-center mb-1 pb-1" style="padding-top:50px;"><span style="border-bottom: solid 3px;">챌린지 삭제하기</span></h4>
	
		<form name="delFrm">
		
			<div class="p-3 mb-5 mt-3" >
			
		        <table class="table table-bordered" style="margin:auto; width: 400px;">
			      	<tr>
			         	<th style="width: 20%; background-color: #DDDDDD;">사용자<br>&nbsp;&nbsp;pw</th>
			         	<td>
			         		<input type="hidden" name="challengeCode" value="${requestScope.challengeCode}" /> <!-- ${requestScope.boardvo.seq} 으로 하면 안됨~ 넘어온 seq 로 잡아주자 -->
			            	<input type="password" name="pw" id="pw" /> <!-- 이 pw 는 안넘겨도 돼서 굳이 name 을 안 적어도됨 -->
			         	</td>
			      	</tr>
			   	</table>
		        
		        <div style="margin: 20px; text-align:center; padding-bottom:100px;">
			      	<button type="button" class="btn btn-secondary btn-sm mr-3" id="btnDelete">글삭제완료</button>
			      	<button type="button" class="btn btn-secondary btn-sm" onclick="javascript:history.back()">글삭제취소</button>
			   	</div>
		        
		    </div>
		    
	    </form>
	    
	</div>
</div>