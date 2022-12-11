
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="project.global.professor.professorDAO" %>  
<%@page import="project.global.professor.prochangepartDTO" %>
<%@page import="java.util.List" %>  
<%@include file = "/global/professor/professorMain.jsp"%>
<%
	/* String id = session.getAttribute(id); */
	//String proid = "뽀보벳띠";
	professorDAO dao = new professorDAO();
	List<prochangepartDTO> list = dao.changepartList(id);

%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>교수-전과승인</title>
<style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 90%;
	margin: auto;
}
td, th{
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
	font-size: 14px;
}
tr: nth-child(even){
	background-color: #dddddd;
}
div.btn{
	margin: auto;
}

</style>
</head>

<body>
<article>
<h2 align="center">전과신청승인</h2>
<table align="center" border="1">
	<tr>
		<td height="30"  style="background-color: #eee;">학번</td>
		<td height="30"  style="background-color: #eee;">이름</td>
		
		<td height="30"  style="background-color: #eee;">학생 전화번호/Email</td>
		<td height="30"  style="background-color: #eee;">기존학과</td>
		
		<td height="30"  style="background-color: #eee;">희망변경학과</td>
		<td height="30"  style="background-color: #eee;">신청일자</td>
		
		<td height="30"  style="background-color: #eee;">승인처리 </td>
	</tr>
	
	<%for(prochangepartDTO dto : list){ %>
		 <tr>
			<td><%=dto.getStnum() %></td>
			<td><%=dto.getStname() %> </td>
			
			<td><%=dto.getStphone() %> /  <%=dto.getStemail() %></td>
			<td><%=dto.getBfname() %> </td>
			
			<td><%=dto.getAfname() %> </td>
			<td><%=dto.getAppdate()%> </td>
			
			<td>
				<input type="button" value="승인" onclick="location.href='prochangepartPro.jsp?stnum=<%=dto.getStnum()%>&proapp=<%=dto.getProapp()%>&finalapp=<%=dto.getFinalapp()%>&data=1'"/>
				<input type="button" value="거절" onclick="location.href='prochangepartPro.jsp?stnum=<%=dto.getStnum()%>&proapp=<%=dto.getProapp()%>&finalapp=<%=dto.getFinalapp()%>&data=2'"/>
			</td>
		</tr>
	<%} %>
