<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="project.global.admin.domDAO" %>
<%@ page import="project.global.admin.domCheckDTO" %>

<!-- 기숙사 입실 승인 / 거부  -->
<%
	String num = request.getParameter("stnum"); //학번 파라미터
	int allow = Integer.parseInt(request.getParameter("allow")); //승인 파라미터
	domDAO dao = new domDAO(); //domDAO() 객체 생성
	
	//승인되었을 경우
	if(allow==1){
		dao.updateAllow(num);%>
		<h2 style="text-align: center; margin-top: 10%;">학번 : <%=num%> 인 학생의 기숙사 입실을 승인 완료하였습니다.<br />
		기숙사 합격자 조회 페이지를 확인하세요 :-) </h2>
				<script language="JavaScript">
					alert("승인되었습니다.");
					//history.go(-1);
				</script> 
				<meta http-equiv="Refresh" content="0;url=domCheckForm.jsp?stnum=<%=num%>&allow=1">
	
<%}else{//거부되었을 경우
	dao.updateAllowNo(num);%>
<h2 style="text-align: center; margin-top: 10%;">학번 : <%=num%> 인 학생의 기숙사 입실을 승인 거부하였습니다.</h2>

		<script language="JavaScript">
			alert("승인 거부되었습니다.");
			//history.go(-1);
		</script> 
		<meta http-equiv="Refresh" content="0;url=domCheckForm.jsp?stnum=<%=num%>&allow=-1">
		<%} %>



		
	