<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List" %>
<%@page import="project.global.admin.timeoffappDTO" %>
<%@page import="project.global.admin.adminDAO" %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<!DOCTYPE html>
<html>
<head>

 <article>
<meta charset="UTF-8">
<title>휴학신청 승인/거절</title>

<style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 80%;
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
<%

	adminDAO dao1 = new adminDAO();
	List<timeoffappDTO> list = dao1.timeoffList();

%>

</head>
<body>

<form action = "timeoffappPro.jsp" method="post">

<h2 align="center"> 휴학 신청 조회/승인</h2>

<table margin="auto" border = "1" align="center">

	<tr>
		<td style="background-color: #eee;"> 학번 </td>
		<td style="background-color: #eee;"> 이름 </td>
		<td style="background-color: #eee;"> 휴학사유 </td>
		<td style="background-color: #eee;"> 신청일자 </td>
		<td style="background-color: #eee;"> 적용년도/적용학기 </td>
		<td style="background-color: #eee;"> 승인 </td>
	</tr>
	
	<%
		for(timeoffappDTO dto : list){%>
		<tr>
			<td> <%=dto.getStnum()%> </td>
			<td> <%=dto.getName()%> </td>
			<td> <%=dto.getCouse() %> </td>
			<td> <%=dto.getDay()  %> </td>
			<td> <%=dto.getYear() %> / <%=dto.getSemester() %>학기 </td>
			<td>
				<input type="button" value="승인" onclick="location.href='timeoffapp1Pro.jsp?stnum=<%=dto.getStnum()%>&year=<%=dto.getYear()%>&semester=<%=dto.getSemester()%>&couse=<%=dto.getCouse()%>&data=1'"/>
				<input type="button" value="거절" onclick="location.href='timeoffapp1Pro.jsp?stnum=<%=dto.getStnum()%>&year=<%=dto.getYear()%>&semester=<%=dto.getSemester()%>&couse=<%=dto.getCouse()%>&data=2'"/>
			</td>
		</tr>
		<%}%>

</table>

</form>


</body></article></section></body>
</html>