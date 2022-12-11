<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="project.global.student.studentDAO" %>
<%@page import="project.global.student.timeonDTO" %>

<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>timeonPro page</title>
</head>

<%
	//String id = (String)session.getAttribute("id");
	String stnum = "20164097";
%>

<jsp:useBean id="dto" class="project.global.student.timeonDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	dto.setDay();
	studentDAO dao = new studentDAO();
	String msg = dao.timeon(dto);
%>

<body>
	<h1>timeonPro page</h1>
	<h3><%=msg %></h3>
	
	<h3><%=dto.getName() %></h3>
	<h3><%=dto.getDay() %></h3>
	<h3><%=dto.getStnum() %></h3>
	<h3><%=dto.getYear() %></h3>
	<h3><%=dto.getSemester() %></h3>
	<script>
		alert('신청되었습니다.');
		document.location.href="timeonForm.jsp";
	</script>
</body>
</html>