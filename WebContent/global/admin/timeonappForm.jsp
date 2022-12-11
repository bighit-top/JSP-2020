<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="project.global.admin.timeonDTO" %>
<%@ page import="project.global.admin.adminDAO" %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<!DOCTYPE html>
<html>

 <article>
<title>복학신청 확인</title>

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

</head>

<%
	adminDAO dao1 = new adminDAO();
	List<timeonDTO> list = dao1.timeonList();
%>

<body>

<h2 align="center"> 복학 신청 조회/승인</h2>
<form method="post" >
<table margin="auto" border = "1" align="center">

	<tr>
		<td style="background-color: #eee;"> 학번 </td>
		<td style="background-color: #eee;"> 이름 </td>
		<td style="background-color: #eee;"> 신청일자 </td>
		<td style="background-color: #eee;"> 휴학 적용 년도/학기 </td>
		<td style="background-color: #eee;"> 승인 </td>
	</tr>
	
	<%
		for(timeonDTO dto : list){%>
		<tr>

			<td> <%=dto.getStnum()%> </td>
			<td> <%=dto.getName()%> </td>
			<td> <%=dto.getDay()  %> </td>
			<td> <%=dto.getYear() %> / <%=dto.getSemester() %>학기 </td>
			<td>
				<input type="button" value="승인" onclick="location.href='timeonapp1Pro.jsp?stnum=<%=dto.getStnum()%>&name=<%=dto.getName() %>&data=1'" />
				<input type="button" value="거절" onclick="location.href='timeonapp1Pro.jsp?stnum=<%=dto.getStnum()%>&name=<%=dto.getName() %>&data=2'"/>
			</td>
		</tr>
		<%}%>
</table>

</form>

</body></article></section></body>
</html>