<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1>delete pro..</h1>
<%@ page import= "project.global.admin.adminListDTO"%>
<%@ page import= "project.global.admin.adminDAO"%>

<% request.setCharacterEncoding("UTF-8"); %>
<%

	int num = Integer.parseInt(request.getParameter("num"));
	
	
	
	adminDAO dao = new adminDAO();
	String msg = dao.testDelete(num);
	
%>
 <%=msg %>
 <script>
	alert("<%=msg%>");
	window.location='adminListForm.jsp'; 
	</script>