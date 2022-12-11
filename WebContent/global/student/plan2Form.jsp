<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.plan2DTO" %>
<%@ page import = "project.global.student.plan2DAO" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/student/Main2.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
 <head>
<article> 



<%
	String date1 = request.getParameter("date1");
	String semester = request.getParameter("semester");
	String part = request.getParameter("part");
	String classname = request.getParameter("classname");
%>



<%
	//String stnum = "20164097";
	plan2DAO dao = new plan2DAO();
	List<plan2DTO> lecturelist = dao.lecture(); //학과를 가져오는 리스트
	List<plan2DTO> alllist = dao.allListSelect(); //하단 전체 리스트
	List<plan2DTO> list = dao.planListSelect(date1, semester, part, classname); //검색시 리스트

	
%>

<title>전체 강의 및 강의계획서 조회</title>

	<head>
	<meta charset="UTF-8">
		<style>
			table{	
				border-collapse : collapse;
			}
		
			td, th{
				border : 1px solid black;
				text-align : center;
			}
		</style>	
	</head>
	
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
		<center>
			<h1>전체 강의 조회</h1>
			<form action = "plan2Form.jsp" method = "post">
			<table width = "850" >
				<tr height = "30">
					<td width = "100" height="30"  style="background-color: #eee;">년도 :</td>
					<td><input type="text" name="date1" size="5"></td>
					<td width = "100" height="30"  style="background-color: #eee;">학기 :</td>
					<td><select name="semester">
							<option value="">--선택--</option>
							<option value="1">1학기</option>
							<option value="2">2학기</option>
						</select></td>
					<td width = "100">학과 :</td>
					<td><select name="part">
					<%for (plan2DTO lec : lecturelist) {%>		
							<option><%=lec.getClassname() %></option>
					<%} %>		
						</select></td>

				</tr>
				<tr height = "30"><!-- 검색시 꼭 넣도록 -->
					<td colspan="2" width = "100" height="30"  style="background-color: #eee;">강의명 :</td>
					<td colspan="4"><input  type="text" style="width:500px; height:20px"  name="classname"></td>
				</tr>
			</table>
				<input type = "submit" value ="강의조회" onclick = "location.href='plan2From.jsp?classname&part&semester&date1'">
			
			<table >					
				<tr height ="30">
					<td width = "150" height="30"  style="background-color: #eee;">강의코드</td>
					<td width = "150" height="30"  style="background-color: #eee;">학과</td>
					<td width = "300" height="30"  style="background-color: #eee;">강의명</td>
					<td width = "100" height="30"  style="background-color: #eee;">담당교수</td>
					<td width = "100" height="30"  style="background-color: #eee;">학점</td>
					<td width = "100" height="30"  style="background-color: #eee;">건물/강의실</td>
					<td width = "100" height="30"  style="background-color: #eee;">요일/교시</td>
					<td width = "100" height="30"  style="background-color: #eee;">정원</td>
				</tr>
			<%if(date1 != null && semester != null && part != null) {%>	
				<%for (int i = 0; i < list.size(); i++){
					plan2DTO select = (plan2DTO)list.get(i);%>
				<tr>
					<td><%=select.getClassnum() %></td>
					<td><%=select.getPart() %></td>
					<td><a href = "/project/global/professor/plan3Form.jsp?classnum=<%=select.getClassnum()%>"><%=select.getClassname() %></a></td>
					<td><%=select.getHomeroompro() %></td>
					<td><%=select.getScore() %></td>
					<td><%=select.getBuilding() %><%=select.getRoomnum() %></td>
					<td><%=select.getDay() %><%=select.getTime() %></td>
					<td><%=select.getCan() %></td>
				</tr>
				<%} %>				
			<%}else{ %>
				<%for(int i = 0; i < alllist.size(); i++){ 
				plan2DTO all = (plan2DTO)alllist.get(i);%>
				<tr>
					<td><%=all.getClassnum() %></td>
					<td><%=all.getPart() %></td>
					<td><a href = "/project/global/professor/plan3Form.jsp?classnum=<%=all.getClassnum()%>"><%=all.getClassname() %></a></td>
					<td><%=all.getHomeroompro() %></td>
					<td><%=all.getScore() %></td>
					<td><%=all.getBuilding() %><%=all.getRoomnum() %></td>
					<td><%=all.getDay() %><%=all.getTime() %></td>
					<td><%=all.getCan() %></td>
				</tr>
				<%} %>
			</table>
			<%} %>
			</form>	
		</center>
	</body>
	</article></section></body>
</html>

