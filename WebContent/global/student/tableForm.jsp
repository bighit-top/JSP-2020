<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.tableDTO" %>
<%@ page import = "project.global.student.tableDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Date" %>
<%@include file = "/global/student/Main2.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>


<%
	//String stnum = "20164097";
	String date1 = ""; // 년도
	String semester = ""; // 월 -학기

	//년도와 학기를 정함
	Date d = new Date();
	date1 = (d.getYear()+1900)+"";
	int month = d.getMonth(); // 0~11
	
	if(month >= 2 && month <= 7){
		semester = "1"; // 월 
	}else{
		semester = "2"; // 월 
	}
	
	tableDAO dao = new tableDAO();
	List<tableDTO> list = dao.myList(id, date1, semester);
%>


<!DOCTYPE html>
<title>시간표 조회</title>
<html>
	<head>
		<meta charset="UTF-8">
		<title>강의시간표</title>
		
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
	<article>

		<table align="center" border="1">
			<h1 align="center">시간표</h1>
			<tr> 
				<td></td>
				<td 
height="30"  style="background-color: #eee;"><b>월</b></td>
				<td 
height="30"  style="background-color: #eee;"><b>화</b></td>
				<td 
height="30"  style="background-color: #eee;"><b>수</b></td>
				<td 
height="30"  style="background-color: #eee;"><b>목</b></td>
				<td 
height="30"  style="background-color: #eee;"><b>금</b></td>
			</tr>
			

<%
		int time = 1;
	 	int size = list.size();
	 	int day1 = 0;
	 	tableDTO dto = null;
%>							
					
				<%for(int i = 1; i < 9 ; i++) {%> <!-- 교시 -->
				<tr>
					<td style="background-color: #eee;" ><%=time %></td>
					<%for(int j = 0; j < 5 ; j++) {  // 요일 	
						int temp = 0; %>
					  <%for(int q = 0; q <list.size(); q++) {%>
					  	<%
						  	dto = list.get(q);
						  	int classtime = Integer.parseInt(dto.getClasstime());
						  	String day = dto.getDay();
					  	
						  	if(day.equals("Mon")){
						  		day1 = 0;
						  	}else if(day.equals("Tue")){
						  		day1 = 1;
						  	}else if(day.equals("Wed")){
						  		day1 = 2;
						  	}else if(day.equals("Thu")){
						  		day1 = 3;
						  	}else if(day.equals("Fri")){
						  		day1 = 4;
					  		}

					  	if(classtime == time && j ==day1){%>
					  		<td><%=dto.getClassname() %></td>
					  		<%temp = 1; 
					  	}%>
					 <%}%>	
					  	
				 <%
				 	if(temp != 1){ %>
					  	<td> &nbsp; </td>
				  <%}
				}
				time++;
				%>
			<%} %>
			
			
			
		</table>
		<br><br/>
		<table align="center" >
			<h1 align="center">수강 리스트</h1> <h6 style="text-align : center;">강의명을 누르면 자유게시판으로 이동합니다. </h6>
				<tr height ="5">
					<td width = "100" 
height="30"  style="background-color: #eee;">년도</td>
					<td width = "100" 
height="30"  style="background-color: #eee;">학기</td>
					<td width = "100" 
height="30"  style="background-color: #eee;">강의명</td>
					<td width = "100" 
height="30"  style="background-color: #eee;">학점</td>
					<td width = "100" 
height="30"  style="background-color: #eee;">건물명</td>
					<td width = "100" 
height="30"  style="background-color: #eee;">강의실</td>
					<td width = "100" 
height="30"  style="background-color: #eee;">요일</td>
					<td width = "100" 
height="30"  style="background-color: #eee;">교시</td>
					<td width = "100" 
height="30"  style="background-color: #eee;">담당교수</td>
				</tr>
			<%
				for(tableDTO mylistdto : list){
			%>
				<tr>
					<td><%=mylistdto.getDate1() %></td>
					<td><%=mylistdto.getSemester() %></td>
					
					<td><a href="/project/global/student/Q&Alist.jsp?classnum=<%=mylistdto.getClassnum()%>"/><%=mylistdto.getClassname() %></a></td> <!-- 강의코드  파라미터로 넘김 -->

					<td><%=mylistdto.getScore() %></td> 
					<td><%=mylistdto.getBuilding() %>
					<td><%=mylistdto.getClassroom() %></td>
					<td><%=mylistdto.getDay() %></td>
					<td><%=mylistdto.getClasstime() %></td>
					<td><%=mylistdto.getHomeroompro() %></td>
				</tr>
			<%} %>
		</table>
</article>
	</body>    
</html>    