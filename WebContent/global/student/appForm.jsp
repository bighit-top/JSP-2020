<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.appDTO" %>
<%@ page import = "project.global.student.appDAO" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/student/Main2.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
 <head>
  
<article> 

<title>수강신청</title>


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
<%
	//String stnum = "20164097";
	appDAO dao = new appDAO(); 
	List<appDTO> applist = dao.appChecking(1); //학생이 수강한 데이터를 리스트로 가져옴
	appDTO stuinfo = dao.studentInfo(id); //학생 정보를 가져옴   
	appDTO dto = new appDTO(); //담을 객체?
%>	
	<body>
		<center>
			<h1>수강신청</h1>
				<table>
					<tr><!--  학번조건이 맞을때 넘겨 받아서 정보 보여주고, 해당 데이터 넘겨주기 -->
						<td height="30"  style="background-color: #eee;">이름</td> 
						<td><%=stuinfo.getStname() %></td>
						<td height="30"  style="background-color: #eee;">학번</td>
						<td><%=stuinfo.getStnum() %></td>
					</tr>
				</table>
				
				<table >
						<tr height ="40">
						<td width = "150" height="30"  style="background-color: #eee;">년도</td>
						<td width = "150" height="30"  style="background-color: #eee;">학기</td>
						<td width = "150" height="30"  style="background-color: #eee;">학과</td>
						<td width = "150" height="30"  style="background-color: #eee;">강의코드</td>
						<td width = "300" height="30"  style="background-color: #eee;">강의명</td> 
						<td width = "100" height="30"  style="background-color: #eee;">담당교수</td>
						<td width = "100" height="30"  style="background-color: #eee;">학점</td>
						<td width = "100" height="30"  style="background-color: #eee;">수강인원</td>
						<td width = "100" height="30"  style="background-color: #eee;">건물</td>
						<td width = "100" height="30"  style="background-color: #eee;">강의실</td>
						<td width = "100" height="30"  style="background-color: #eee;">강의요일</td>
						<td width = "100" height="30"  style="background-color: #eee;">교시</td>
						<td width = "50"  height="30"  style="background-color: #eee;">신청</td>
					</tr>
					
					<!-- 데이터 불러오기와서 강의명에 a태그넣기(강의계획서 조회), 끝에 수강신청버튼으로 신청 //인원이 차면 신청할 수 없음-->
					<%for(appDTO list : applist) {%>
					<tr>
						<td><%=list.getDate1() %></td> 

						<td><%=list.getSemester() %></td>

						<td><%=list.getPart() %></td>

						<td><%=list.getClassnum() %></td> 

 						<td><%=list.getClassname() %></td> 

 						<td><%=list.getHomeroompro() %></td>	

 						<td><%=list.getScore() %></td>

						<td><%=list.getCan() %></td>	

						<td><%=list.getBuilding() %></td>

						<td><%=list.getRoomnum() %></td>

						<td><%=list.getDay() %></td>

						<td><%=list.getTime() %></td>

						<td> 	
							<a href="/project/global/student/appPro.jsp?stnum=<%=stuinfo.getStnum()%>&classnum=<%=list.getClassnum() %>
							&stname=<%=stuinfo.getStname()%>&grade=<%=stuinfo.getGrade()%>&part=<%=list.getPart()%>"><input type = "submit" value="신청"></a></td>
					</tr>
					<%} %>
				</table>
				<br><br/>
		</center>
	</body>
</article></section></body>
</html>