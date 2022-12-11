<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="project.global.admin.procheckDTO" %>
<%@ page import="project.global.admin.adminDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	try{
		adminDAO dao1 = new adminDAO();
		List<procheckDTO> list = dao1.getLecture1();
%>
<!DOCTYPE html>
<html>

 <article>
<title>교수강의실 승인</title>


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
<body>
<h2 align="center"> 강의실 신청내역</h2>
<form action>
	<table border="1" align="center">
		<tr style="background-color: #eee;">
			<th>신청일자</th>
			<th>강의코드</th>
			<th>강의명</th>
			<th>학점 </th>
			<th>인원</th>		 
			<th>승인/거절</th>
		</tr>
		<%for(procheckDTO dto : list){ %>
		<tr>
			<td><%=sdf.format(dto.getReg_date())%></td>
			<td><%=dto.getClassnum() %></td>
			<td><%=dto.getClassname() %></td> 
			<td><%=dto.getScore() %></td>
			<td><%=dto.getCan() %></td>
			<td>
				<input type="button" value="승인" onclick="location.href='procheck1Pro.jsp?classnum=<%=dto.getClassnum()%>'" />
				<input type="button" value="거절" onclick="location.href='procheck2Pro.jsp?classnum=<%=dto.getClassnum()%>'"/>
			</td>
		</tr>
	<%} %>
	
	</table>
	<%}catch(Exception e){} %>

</body>
</html>