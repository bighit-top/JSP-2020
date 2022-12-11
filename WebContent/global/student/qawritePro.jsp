<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.global.professor.qaDAO" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" scope="page" class="project.global.professor.qaDTO">
   <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%


	String classnum = request.getParameter("classnum");

	
	dto.setReg_date(new Timestamp(System.currentTimeMillis()));
	qaDAO dao = new qaDAO();
	dao.insertArticle(dto);
	//response.sendRedirect("Q&Alist.jsp");
%>
<meta http-equiv="Refresh" content="0;url=Q&Alist.jsp?classnum=<%=classnum %>" />