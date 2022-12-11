<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.global.admin.adminDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>timeonappPro page</title>
</head>
<body>

<h1>timeonapp1Pro 승인 page</h1>

<%
	String stnum = (String)request.getParameter("stnum");
	String name = (String)request.getParameter("name");
	String data1 = (String)request.getParameter("data");
	int data = Integer.parseInt(data1);
	adminDAO dao = new adminDAO();
	String msg = dao.timeonapp1(stnum,name,data);
%>
<h3> <%=data%> </h3>
<h3> <%=msg%> </h3>

<script>
	
	document.location.href="timeonappForm.jsp";
</script>

</body>
</html>