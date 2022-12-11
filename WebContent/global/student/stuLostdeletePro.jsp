<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1>delete pro..</h1>
<%@ page import= "project.global.student.stuLostDTO"%>
<%@ page import= "project.global.student.studentDAO"%>

<% request.setCharacterEncoding("UTF-8"); %>
<%

	int num = Integer.parseInt(request.getParameter("num"));
	
	
	
	studentDAO dao = new studentDAO();
	String msg = dao.testDelete1(num);
	
%>
 
 <%=msg %>
 <script>
	alert("<%=msg%>");
	window.location='stuLostForm.jsp'; 
	</script>