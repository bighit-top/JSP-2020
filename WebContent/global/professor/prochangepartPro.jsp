<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="project.global.professor.professorDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prochangepartPro page</title>
</head>

<%
	String stnum = request.getParameter("stnum");
	String proapp = request.getParameter("proapp");
	String finalapp = request.getParameter("finalapp");
	String data1 = request.getParameter("data");
	
	int data = Integer.parseInt(data1);
	
	professorDAO dao = new professorDAO();
	String msg = dao.updateApp(stnum, data);
%>

<body>
<script>
alert('처리되었습니다.');
document.location.href="prochangepartForm.jsp";
</script>
	

</body>
</html>