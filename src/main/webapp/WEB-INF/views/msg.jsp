<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

	// 메시지 출력해주기
	alert("${requestScope.message}");
	// 페이지 이동
	location.href = "${requestScope.loc}";
	
	// 부모창 닫기
	opener.location.reload(true);
	// 또는 opener.history.go(0);
	/*   
		location.href="javascript:history.go(-2);";  // 이전이전 페이지로 이동 
		location.href="javascript:history.go(-1);";  // 이전 페이지로 이동
		location.href="javascript:history.go(0);";   // 현재 페이지로 이동(==새로고침) 캐시에서 읽어옴.
		location.href="javascript:history.go(1);";   // 다음 페이지로 이동.
		
		location.href="javascript:history.back();";		// 이전 페이지로 이동 
		location.href="javascript:location.reload(true)"; // 현재 페이지로 이동(==새로고침) 서버에 가서 다시 읽어옴. 
		location.href="javascript:history.forward();";    // 다음 페이지로 이동.
	*/

	// 팝업창 닫기 - 알림을 보여줬으면 닫는다.
	self.close();
</script>