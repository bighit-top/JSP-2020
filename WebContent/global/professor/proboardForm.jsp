<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.professor.professorDAO" %>
<%@ page import = "project.global.professor.SuccLectureDTO" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/professor/professorMain.jsp"%>
<%
	String classnum = request.getParameter("classnum");
	professorDAO dao = new professorDAO();
	List<SuccLectureDTO> SuccLecture = dao.SuccLecture(id);
%>
<title>자유게시판-교수</title>
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
<article>
<body bgcolor = "white">
	<h2 align="center">강의 자유게시판 조회</h2>
	<table align="center" border="1">
	<center>
	<tr>
		<td height="30"  style="background-color: #eee;">년도 </td>
		<td height="30"  style="background-color: #eee;">학기 </td>
		<td height="30"  style="background-color: #eee;">강의코드 </td>
		<td height="30"  style="background-color: #eee;">강의명 </td>
		<td height="30"  style="background-color: #eee;">강의실호수</td>
		<th height="30"  style="background-color: #eee;">게시판 이동</th>
	</tr>
<% for(SuccLectureDTO dto : SuccLecture){ %>
<tr>
	<td><%=dto.getDate1()%></td>
	<td><%=dto.getSemester()%></td>
	<td><%=dto.getClassnum() %></td>
	<td><%=dto.getClassname() %></td>
	<td><%=dto.getRoomnum() %></td>
	<td>&nbsp;
	<a href="/project/global/professor/Q&Alist.jsp?classnum=<%=dto.getClassnum()%>"><input type="button"  value="게시판 페이지로 이동" /></a>
	&nbsp;
	</td>
	</tr>
	<%} %>
	</center>
	</table><br/>
	<table align = "center">
	<tr>
		<td colspan="8" align="center">
			<input type="button" size="10" onclick="document.location.href='professorMain2.jsp'" value="메인으로">
		</td>
	<tr>		
	</table>
</body>
</article>
</html>