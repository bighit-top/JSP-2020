<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "project.global.professor.proevalDTO" %>
<%@ page import = "project.global.professor.proevalDAO" %>
<%@ page import = "java.util.Date" %>
<%@include file = "/global/professor/professorMain.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	//String id = "20160406";
	int count = 0;
	proevalDAO dao = new proevalDAO();
	proevalDTO info= dao.profassor(id);//교수 정보를 가져오기 위한 DAO
	String homeroompro =  info.getHomeroompro();
%>
<%
	String date1 = "";// 년도
	String semester = "";//월 -학기
	
	//년도와 학기를 정함
	Date d = new Date();
	date1 =(d.getYear()+1900)+"";
	int month = d.getMonth();// 0~11
	
	if(month >=2 && month <=7){
		semester = "1";//월
	}else{
		semester = "2";//월
	}
	
%>

<%  String classname = request.getParameter("classname"); %>
<% 	List<proevalDTO> proevalList = dao.proevalList(classname);// 평가점수
	


	count = dao.proevalcount(homeroompro, classname, semester, date1);
	
%>
<% 
	int alltotal = 0;// 받은평가들의 총합
	int everage = 0;// 평점을 나눈 값을 담을 변수 선언
	
	if(count!=0){
		for(int i = 0 ; i < proevalList.size(); i++ ){
			proevalDTO dto = (proevalDTO)proevalList.get(i);
			
			alltotal += dto.getTotal();
		}
		everage = alltotal/count;
	}
%>





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
<% 	proevalDAO prodao = new proevalDAO();
	List<proevalDTO> list = null;
	list = dao.evalList(id,date1,semester);


%>
<article>
	<body>   
		<center>    
			<h1>교수 평가 조회</h1>
			<form action = "proevalForm.jsp" method = "post">
				<table width = "600" border = "1">
					<tr>
						<td colspan = "1" height="30"  style="background-color: #eee;">성명</td>
						<td><%=info.getHomeroompro() %></td>
						<td colspan = "1" height="30"  style="background-color: #eee;">학번</td>
						<td colspan="1"><%=info.getId() %></td>
					</tr>
					<tr>
						<td colspan = "1" height="30"  style="background-color: #eee;">학과</td>
						<td colspan="3"><%=info.getPart() %></td>
					</tr>
					<tr>
						<td colspan = "2" height="30"  style="background-color: #eee;">담당과목</td>
						<td colspan = "2">
						
						
						
				
				
						<select name="classname">
							<%for(proevalDTO look : list){ %>	
							<option><%=look.getClassname() %></option>
							<%} %>
						</select>
			
						
						
						
							<input type = "submit" value = "조회" />
					</tr>
					<tr>
						<td colspan = "2" height="30"  style="background-color: #eee;">평점</td>
						<td colspan = "2"><%=everage%></td>
						
					</tr>
				</table>
				<br><br/>
			<%if(count == 0){ %>
		
			<table width = "600" border = "1" cellpadding="0" cellspacing="0">
			<tr>
						<td height="30"  style="background-color: #eee;"><b>년도</b>
						<td height="30"  style="background-color: #eee;"><b>학기</b></td>
						<td height="30"  style="background-color: #eee;"><b>강의명</b></td>
						<td height="30"  style="background-color: #eee;"><b>받은 평가</b></td>
						<td height="30"  style="background-color: #eee;"><b>기타사항</b></td>
			</tr> 
			<tr>
				<td align="center" colspan="5">
				등록된 강의평가가 없습니다.
				</td>
			</tr>
			</table>
			<%} else{	%>
				<table width = "600" border = "1">		
					<tr>
						<td height="30"  style="background-color: #eee;"><b>년도</b>
						<td height="30"  style="background-color: #eee;"><b>학기</b></td>
						<td height="30"  style="background-color: #eee;"><b>강의명</b></td>
						<td height="30"  style="background-color: #eee;"><b>받은 평가</b></td>
						<td height="30"  style="background-color: #eee;"><b>기타사항</b></td> 
					</tr>
				<%
					for(int i = 0 ; i < proevalList.size(); i++){
						proevalDTO dto = (proevalDTO)proevalList.get(i);
				
				%>
					<tr>
						<td><b><%=dto.getDate1()%></b></td>
						<td><b><%=dto.getSemester()%></b></td>
						<td><b><%=dto.getClassname() %></b></td>
						<td><b><%=dto.getTotal()%></b></td>
						<td><b><%=dto.getTopro() %></b></td>
					</tr>
					<%} %>
					</table>
				<%} %>
			</form></article>
		</center>
	</body>
</html>