<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.global.professor.qaDAO" %>
<%@include file = "/global/professor/professorMain.jsp"%>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");

  String classnum = request.getParameter("classnum");


  qaDAO dao = new qaDAO();
  int check = dao.deleteArticle(num, classnum);
  if(check==1){
%>
<meta http-equiv="Refresh" content="0;url=Q&Alist.jsp?pageNum=<%=pageNum%>
&classnum=<%=classnum%>" >
<%}%>