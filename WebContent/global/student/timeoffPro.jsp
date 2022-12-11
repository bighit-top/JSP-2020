<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="project.global.student.studentDAO" %>
<%@ page import="project.global.student.timeoffDTO" %>

<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학적관리-휴/복학Pro</title>
</head>

<%
	// String id = (String) session.getAttribute("id");
	String stnum = "20164097";
%>
<jsp:useBean id = "dto" class="project.global.student.timeoffDTO" />
<jsp:setProperty property="*" name="dto"/>

<%
	dto.setDay();
	dto.setYear();
	studentDAO dao = new studentDAO();
	String msg = dao.timeoff(dto);
	
%>
<body>
<h1>timeoffPro page</h1>

<h3><%=msg%></h3>

<script>
alert('신청되었습니다.');
document.location.href="timeoffForm.jsp";
</script>

</body>
</html>