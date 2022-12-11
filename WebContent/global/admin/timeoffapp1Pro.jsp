<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.global.admin.adminDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>timeoffapp1 page</title>
</head>
<body>

<h1>timeoffApp1 승인 page</h1>

<%
	String stnum = (String)request.getParameter("stnum");
	String year = (String)request.getParameter("year");
	String semester = (String)request.getParameter("semester");
	String couse = (String)request.getParameter("couse");
	String data1 = (String)request.getParameter("data");
	
	int data = Integer.parseInt(data1);

	adminDAO dao = new adminDAO();
	String msg = dao.timeoffapp1(stnum, year, semester,couse, data);
%>

<h1><%=msg%></h1>

<h1><%=stnum%></h1>
<h1><%=year%></h1>
<h1><%=semester%></h1>
<h1><%=couse%></h1>
<script>

document.location.href="timeoffappForm.jsp";
</script>
</body>
</html>