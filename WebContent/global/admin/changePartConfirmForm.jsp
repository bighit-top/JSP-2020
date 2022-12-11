<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.admin.changePartConfirmDAO" %>
<%@ page import = "project.global.admin.changePartConfirmDTO" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<!DOCTYPE html>

<article> 




<title>전과신청관리</title>

<%
	changePartConfirmDAO dao1 = new changePartConfirmDAO();
	List<changePartConfirmDTO> list = dao1.changeConfirmList();
%>    

<head>
</head>
<form method = "post">
<body>
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
	<h1 align = "center">전과신청승인</h1>
	<table align = "center" border = "1">
		<tr>
			<td style="background-color: #eee;">신청일</td> <!-- 최근순서대로 정렬 -->
			<td style="background-color: #eee;">년도</td>
			<td style="background-color: #eee;">학기</td>
			<td style="background-color: #eee;">이름</td>
			<td style="background-color: #eee;">학번</td>
			<td style="background-color: #eee;">기존학과</td>
			<td style="background-color: #eee;">신청학과</td>
			<td style="background-color: #eee;">전과신청사유</td>
			<td style="background-color: #eee;">승인상태</td>
			<td style="background-color: #eee;">승인</td>
		</tr>	
		<%for(changePartConfirmDTO dto : list)	{%>
		<tr>
			<td><%=dto.getAppdate() %></td> <!-- 최근 순서대로 정렬 -->
			<td><%=dto.getDate1() %></td>
			<td><%=dto.getSemester() %></td>
			<td><%=dto.getStname() %></td>
			<td><%=dto.getStnum() %></td>
			<td><%=dto.getBfname() %></td>
			<td><%=dto.getAfname() %></td>
			<td><%=dto.getCouse() %></td>
			<%if(dto.getProapp()==1) {%>
			<td>교수승인완료</td>
			<%} %>
			<td>
				<input type = "button" value = "승인" onclick="location.href='changePartConfirmPro.jsp?stnum=<%=dto.getStnum()%>&stname=<%=dto.getStname()%>&bfname=<%=dto.getBfname()%>&afname=<%=dto.getAfname()%>&proapp1=<%=dto.getProapp()%>&data1=1'"/>					
				<input type="button" value="거절" onclick="location.href='changePartConfirmPro.jsp?stnum=<%=dto.getStnum()%>&stname=<%=dto.getStname()%>&bfname=<%=dto.getBfname()%>&afname=<%=dto.getAfname()%>&proapp1=<%=dto.getProapp()%>&data1=2'"/>
			</td>
		</tr>	
		<%} %>
	</table>
</form>
</body></article></section></body>

</html>