<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="project.global.admin.domDAO" %>
<%@ page import="project.global.admin.domoutDTO" %>

<%
	String stnum = request.getParameter("stnum"); //학번 파라미터 변수
	domDAO dao = new domDAO(); //domDAO() 객체생성
	dao.updateOutAllow(stnum); //학번 일치한 학생 승인시 allow 값 1로 업데이트
%>
<h2 style="text-align: center;">학번 : <%=stnum%> 인 학생의 기숙사 퇴실을 승인 완료하였습니다. </h2> 
	<script language="JavaScript">
		alert("승인되었습니다.");
		document.location.href="domoutForm.jsp";
	</script>