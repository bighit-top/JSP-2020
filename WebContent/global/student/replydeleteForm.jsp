<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.global.professor.qaDAO"%>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	String pageNum = request.getParameter("pageNum");	
	int qno = Integer.parseInt(request.getParameter("qno"));
	int step = Integer.parseInt(request.getParameter("step"));
	String classnum = request.getParameter("classnum");
	String id= request.getParameter("id");
	
	qaDAO dao = new qaDAO();
	int check = dao.deleteReply(qno, step, id);
	if(check==1){%>
<meta http-equiv="Refresh" content="0;url=qacontent.jsp?num=<%=qno%>&pageNum=<%=pageNum %>&step=<%=step %>&classnum=<%=classnum %>" />
<%}%>

