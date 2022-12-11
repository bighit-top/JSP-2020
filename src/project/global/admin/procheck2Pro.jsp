<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="project.global.admin.adminDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>procheck2Pro page</title>
</head>

<%
	String classnum = (String)request.getParameter("classnum");
	adminDAO dao = new adminDAO();
	String msg = dao.procheck2(classnum);
%>

<body>

<h3><%=msg%></h3>

<script>
alert(<%=classnum%>+' 거절되었습니다.');
document.location.href="procheckForm.jsp";

</script>


</body>
</html>