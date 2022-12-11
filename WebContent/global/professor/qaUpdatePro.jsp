<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.global.professor.qaDAO" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" scope="page" class="project.global.professor.qaDTO">
   <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%
	dto.setReg_date(new Timestamp(System.currentTimeMillis()));
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String classnum = request.getParameter("classnum");
	
	String subject = dto.getSubject();
	String content = dto.getContent();
	
	qaDAO dao = new qaDAO();
	int check = dao.updateArticle(num, classnum, subject, content);
	if(check==1){
%>
<meta http-equiv="Refresh" content="0;url=qacontent.jsp?num=<%=num %>&pageNum=<%=pageNum%>
&classnum=<%=classnum%>" >
<%} %>
