<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "project.global.professor.plan3DAO" %>
<%@ page import = "project.global.professor.plan3DTO" %>
<%@ page import = "java.util.List" %>
<%@ include file = "/global/professor/professorMain.jsp" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	String classnum = request.getParameter("classnum");
	//session.getAttribute("prof222");
%>

<%
	plan3DAO dao = new plan3DAO();
	plan3DTO plan = dao.plan(classnum);
%>

<!DOCTYPE html>
<html>
 <head>
  <style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 60%;
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

<h4 align="center">강의계획서 조회</h4>

<table border ="1" align="center">
	<tr>
		<td style="background-color: #eee;">강의명</td>
		<td colspan="1"><%=plan.getClassname() %></td>
		<td style="background-color: #eee;">정원</td>
		<td colspan="1"><%=plan.getCan() %></td>
	</tr>

	<tr>
		<td style="background-color: #eee;">교수명</td>
		<td><%=plan.getHomeroompro() %>/<%=plan.getProemail() %></td>
		<td style="background-color: #eee;">소속학과</td>
		<td><%=plan.getPart() %></td>
	</tr>
	
	<tr>
		<td style="background-color: #eee;">강의실</td>
		<td><%=plan.getBuilding()%>/<%=plan.getRoomnum() %></td>
		<td style="background-color: #eee;">강의코드</td>
		<td><%=plan.getClassnum() %></td>
	</tr>

	<tr>
		<td style="background-color: #eee;">수강대상</td>
		<td><%=plan.getWho() %></td>
		<td style="background-color: #eee;">개설년도/학기</td>
		<td><%=plan.getDate1() %>/<%=plan.getSemester() %></td>
	</tr>
	
	<tr>
		<td style="background-color: #eee;">강의시간</td>
		<td><%=plan.getDay() %>/<%=plan.getTime() %></td>
		<td style="background-color: #eee;">학점</td>
		<td><%=plan.getScore() %></td>
	</tr>

	<tr>
		<td style="background-color: #eee;">강의개요 및 목표</td>
		<td colspan="3"><%=plan.getGoal() %></td>
	</tr>
	
	<tr>
		<td >평가기준</td>
		<td colspan="3"><input type="text" value="출석 20%        중간고사 30%        기말고사 30%        수시평가 20%" disabled
				style="width: 500px; height: 50px;"></td>
	</tr>
</table>

<table align="center">
	<tr>
		<td align ="center" colspan ="2"><br/>
		<input type= "button" value="수정" onclick="document.location.href='plan3ModifyForm.jsp?classnum=<%=plan.getClassnum() %>&id=<%=plan.getId() %>'"/>
		<a href="SuccLecturListForm.jsp"><input type= "button" value="뒤로가기"/></a></td>
	</tr>
</table>

</article></section></body>
</html>
