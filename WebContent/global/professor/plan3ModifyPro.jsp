<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.professor.plan3DAO" %>
<%@ page import = "project.global.professor.plan3DTO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="modify" class = "project.global.professor.plan3DTO">
	<jsp:setProperty name="modify" property ="*"/>
</jsp:useBean>


<%
	plan3DAO dao = new plan3DAO();
	dao.planModify(modify);
	 %>
		<script>
			alert("강의계획서 수정이 완료되었습니다.");
			document.location.href="plan3ProForm.jsp?classnum=<%=modify.getClassnum()%>";
		</script>

