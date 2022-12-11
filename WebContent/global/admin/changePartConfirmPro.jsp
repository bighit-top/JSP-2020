<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.admin.changePartConfirmDAO" %>
<%@ page import = "project.global.admin.changePartConfirmDTO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<title>changePartConfirmPro page</title>
</head>
<body>
<%
	String stnum = (String)request.getParameter("stnum");
 	String stname = (String)request.getParameter("stname");
 	String bfname = (String)request.getParameter("bfname");
	String afname = (String)request.getParameter("afname");
	String proapp1 = (String)request.getParameter("proapp1");
	String data1 = (String)request.getParameter("data1");


	int proapp = Integer.parseInt(proapp1);
	int data = Integer.parseInt(data1);
	
	changePartConfirmDAO dao = new changePartConfirmDAO();
	
	if(data==1){
		dao.changePart(stnum, stname, bfname, afname, proapp, data); //승인%>
		<script>
			alert("승인하였습니다.");
			document.location.href="changePartConfirmForm.jsp"	
		</script>
	<%} %>
	<%dao.changePart(stnum, proapp, data); //거절%> 

		<script>
			alert("거절하였습니다.");
			document.location.href="changePartConfirmForm.jsp"			
		</script>