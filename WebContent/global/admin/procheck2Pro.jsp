<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="project.global.admin.adminDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
    

<%
	String classnum = (String)request.getParameter("classnum");
	adminDAO dao = new adminDAO();
	String msg = dao.procheck2(classnum);
%>

<script>
alert('거절되었습니다.');
document.location.href ="procheckForm.jsp";
</script>