<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="project.global.admin.domDAO" %>

<jsp:useBean id="dto" class="project.global.admin.roomDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%
	String stnum = request.getParameter("stnum"); //학번 
	String ho = request.getParameter("ho"); //호실
	int ok = Integer.parseInt(request.getParameter("ok")); //호실 배정 완료
	domDAO dao = new domDAO(); //domDAO() 객체 생성
	dao.updateRoom(dto); //방 배정 완료 시 ok=1 로 업데이트
%>
		<h2 style="text-align:center; margin-top:10%;">학번 : <%=stnum %> 인 학생의 
기숙사 <%=ho%>실 배정 완료하였습니다.</h2>
	<script language="JavaScript">
		alert("배정완료");
		//history.go(-1);
	</script>
	<meta http-equiv="Refresh" content="0;url=roomForm.jsp"> <!-- 새로고침 -->


	
	
