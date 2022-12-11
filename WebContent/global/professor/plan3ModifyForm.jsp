<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "project.global.professor.plan3DAO" %>
<%@ page import = "project.global.professor.plan3DTO" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/professor/professorMain.jsp"%>
 <% request.setCharacterEncoding("UTF-8"); %>
<%
	String classnum = request.getParameter("classnum"); //강의코드로 검색함
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
  
<article> 
<h4 align="center"><%=plan.getClassname() %>&nbsp;강의계획서 수정</h4>

<form action = "plan3ModifyPro.jsp" method = "post">
<table border ="1" align="center">
	<tr>
		<td height="30"  style="background-color: #eee;">강의명</td>
		<td colspan="1" ><%=plan.getClassname() %></td>
		<td height="30"  style="background-color: #eee;">정원</td>
		<td colspan="1"><input type = "text" name="can" size="2"/>명</td>
	</tr>

	<tr>
		<td height="30"  style="background-color: #eee;">교수명</td>
		<td><%=plan.getHomeroompro() %>/<%=plan.getProemail() %></td>
			<input type="hidden" name ="id" value="<%=id%>"/>
		<td height="30"  style="background-color: #eee;">소속학과</td>
		<td><%=plan.getPart() %></td>
			<input type="hidden" name ="part" value="<%=plan.getPart()%>"/>
	</tr>
	
	<tr>
		<td height="30"  style="background-color: #eee;">건물/강의실</td>
		<td><%=plan.getBuilding() %>/<%=plan.getRoomnum() %></td>
			<input type="hidden" name ="building" value="<%=plan.getBuilding()%>"/>
			<input type="hidden" name ="roomnum" value="<%=plan.getRoomnum()%>"/>			
		<td height="30"  style="background-color: #eee;">강의코드</td>
		<td><%=plan.getClassnum() %></td>
			<input type="hidden" name ="classnum" value="<%=plan.getClassnum()%>"/>
	</tr>

	<tr>
		<td height="30"  style="background-color: #eee;">수강대상</td>
		<td><input type = "text" size="1" name="who"/> 학년 </td> 
		<td height="30"  style="background-color: #eee;">개설년도/학기</td>
		<td><%=plan.getDate1() %>/<%=plan.getSemester() %></td>
	</tr>
	
	<tr>
		<td height="30"  style="background-color: #eee;">요일/교시</td>
		<td><%=plan.getDay() %>/<%=plan.getTime() %></td>
			<input type="hidden" name ="day" value="<%=plan.getDay()%>"/>
			<input type="hidden" name ="time" value="<%=plan.getTime()%>"/>
		<td height="30"  style="background-color: #eee;">학점</td>
		<td><%=plan.getScore() %></td>
	</tr>

	<tr>
		<td height="30"  style="background-color: #eee;">강의개요 및 목표</td>
		<td colspan="3"><input type = "textarea" name="goal" style="width:500px; height:300px;" name="goal"/></td>
	</tr>
	
	<tr>
		<td height="30"  style="background-color: #eee;">평가기준</td>
		<td colspan="3"><input type="text" value="출석 20%        중간고사 30%        기말고사30%        수시평가 20%" disabled
				style="width: 500px; height: 50px;"></td>
	</tr>
</table>

<table align="center">
	<tr>
		<td align ="center" colspan ="2"><br/>
		<input type= "submit" value="수정완료" name = "modify">
		<input type= "button" value="뒤로가기" onclick="history.go(-1)"></td>
	</tr>
</table>
</form>

</article></section></body>
</html>