<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="project.global.admin.adminDAO" %>
<%@ page import="project.global.admin.calendarDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="project.global.admin.calendarDTO">
	<jsp:setProperty property="*" name="dto"/> 
</jsp:useBean>

<%
	adminDAO dao = new adminDAO();
	String msg = dao.calendarinput(dto);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>calendarPro page</h1>

<h3><%=msg %></h3>

<script>
alert('입력되었습니다.');
document.location.href="calendarForm.jsp";
</script>

</body>
</html>