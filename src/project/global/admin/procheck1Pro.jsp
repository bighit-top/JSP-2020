<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="project.global.admin.adminDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>procheck1Pro page</title>
</head>
<body>

<h1>procheck1Pro page</h1>

<%
	String classnum = (String)request.getParameter("classnum");

	adminDAO dao = new adminDAO();
	String msg = dao.procheck1(classnum);
%>

<h3> <%=msg%></h3>
<h3> <%=classnum%></h3>

<script>
alert(<%=classnum%>+' 승인되었습니다.');
document.location.href="procheckForm.jsp";

</script>

</body>
</html>