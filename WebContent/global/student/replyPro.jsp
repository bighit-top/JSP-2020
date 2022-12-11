<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="project.global.professor.qaDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="project.global.professor.replyDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%	
	String classnum = request.getParameter("classnum");
	
	String pageNum = request.getParameter("pageNum");
	dto.setReplydate(new Timestamp(System.currentTimeMillis()));
	int qno = Integer.parseInt(request.getParameter("num"));
	qaDAO dao = new qaDAO();
	dao.insertreply(dto, qno, classnum);
%>
<meta http-equiv="Refresh" content="0;url=qacontent.jsp?num=<%=qno%>&pageNum=<%=pageNum %>
&classnum=<%=classnum%>" />