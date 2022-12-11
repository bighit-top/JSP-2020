<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="project.global.student.studentDAO" %>
<%@ page import="project.global.student.modifyDTO" %>

<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인신상정보-수정Pro</title>
</head>
<body>
<h1> pro page</h1>

<%-- <%
	// String id = (String) session.getAttribute("id");
	String stnum = "20164097";
%>
	<jsp:useBean id = "dto" class="project.global.student.modifyDTO" />
	<jsp:setProperty property="*" name="dto"/>
	
<%

	dto.setStnum(stnum);
	studentDAO dao = new studentDAO();
	String msg = dao.stuinfo_modify(dto);	
%>


<h3><%=msg%></h3>

<h3><%=dto.getFloor()%></h3>
<h3><%=dto.getGrade()%></h3> --%>

<%
	String msg = request.getParameter("msg");
%>
<%=msg %>
<script>
alert('수정되었습니다.');
document.location.href="modifyForm.jsp";
</script>
</body>
</html>