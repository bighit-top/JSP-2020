<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.professor.professorDAO" %>
<%@ page import = "project.global.professor.SuccLectureDTO" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/professor/professorMain.jsp"%><%
	String classnum = request.getParameter("classnum");
	professorDAO dao = new professorDAO();
	List<SuccLectureDTO> SuccLecture = dao.SuccLecture(id);
%>
<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8"> <title>강의리스트</title>
	</head>

<body bgcolor = "white">
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
	<h2 align="center">강의리스트</h2>
	<form>
	<table align="center" border="1">
	<center>
	<tr>
		<td height="30"  style="background-color: #eee;">년도 </td>
		<td height="30"  style="background-color: #eee;">학기 </td>
		<td height="30"  style="background-color: #eee;">이름 </td>
		<td height="30"  style="background-color: #eee;">학번 </td>
		<td height="30"  style="background-color: #eee;">강의코드 </td>
		<td height="30"  style="background-color: #eee;">강의명 </td>
		<td height="30"  style="background-color: #eee;">학점</td>
		<td height="30"  style="background-color: #eee;">강의실호수</td><td  height="30"  style="background-color: #eee;">교시</td>
		<td height="30"  style="background-color: #eee;">강의계획서</td>

	</tr>
<% for(SuccLectureDTO dto : SuccLecture){ %>
<tr>
	<td><%=dto.getDate1()%></td>
	<td><%=dto.getSemester()%></td>
	<td><%=dto.getHomeroompro()%></td>
	<td><%=dto.getId()%>
	<td><%=dto.getClassnum() %></td>
	
	<td><%=dto.getClassname()%></td><!-- 강의코드, 강의명 ,교수명을 파라미터로 넘김   -->
	<td><%=dto.getScore() %></td>
	<td><%=dto.getRoomnum() %></td>
	<td><%=dto.getTime() %></td>
	<td>&nbsp;
	<input type="button"  value="조회" onclick="document.location.href='/project/global/professor/plan3ProForm.jsp?classnum=<%=dto.getClassnum()%>'" />
	&nbsp;</td>	
</tr>
<%} %>
	</center>
	</table></form><br/>
	<table align = "center">
	<tr>
		<td colspan="8" align="center">
			<input type="button" size="10" onclick="document.location.href='professorMain2.jsp'" value="메인으로">
		</td><tr>		
	</table></article>
</body>
</html>
