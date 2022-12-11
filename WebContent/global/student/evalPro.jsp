<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.evalDAO" %>
<%@ page import = "project.global.student.evalDTO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "eval" scope = "page" class = "project.global.student.evalDTO">
	<jsp:setProperty name = "eval" property = "*"/>
</jsp:useBean>  <!-- DTO다. -->

<%
	evalDAO dao = new evalDAO();

	int check = dao.submitCheck(eval.getStnum(), eval.getClassname()); //
	
	if(check == 1){%>
		<script>
			alert("이미 제출하셨습니다.");
			history.go(-1);
		</script>
	<%}else {%>
		<script>
			alert("제출되었습니다.");			
		</script>
		<%dao.evalInsert(eval);
		response.sendRedirect("evalForm.jsp");%>
	<%} %>
	
<h1>evalPro page</h1>