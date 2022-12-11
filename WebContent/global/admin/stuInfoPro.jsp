<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<%@ page import="project.global.admin.adminDAO" %>
<%@ page import="project.global.admin.stuInfoDTO" %>

<% request.setCharacterEncoding("UTF-8");%>
<%-- 
<jsp:useBean id="dto" class="project.global.admin.stuInfoDTO"/>
<jsp:setProperty property="*" name="dto" />




<title>관리자-학생 개인정보 입력</title>

<h1>stuInfoPro page</h1>

<%
	adminDAO dao = new adminDAO();
	String msg = dao.insertStudent(dto);
%> --%>



<%-- 
<%
	String msg = (String)request.getAttribute("msg");
%>

<h3> <%=msg %></h3>
 --%>
 
Pro page
<script>
	alert("입력되었습니다.");
	document.location.href="stuInfoForm.jsp";
</script>

