<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import  = "project.global.professor.gradeDAO" %>
<%@ page import = "project.global.professor.gradeDTO" %>    
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Date" %>
<%@ include file = "/global/professor/professorMain.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>


<html>

<title>학생평가</title>
<% String classnum = request.getParameter("classnum"); 
%>


<%  //String id = ""; //교수학번
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

	//셀렉트에 강의한 리스트를 가져옴
	gradeDAO dao = new gradeDAO();
	List<gradeDTO> lecturelist = dao.lectureList(id, date1, semester); //교수id, 년도, 학기의 조건으로.
	//셀렉트 끝
	
	//수강인원을 카운트해서 가져옴
	int count = dao.classCount(classnum);

	
	//수강한 학생의 이름과 학번을 불러옴
	List<gradeDTO> stu = dao.stcall(classnum);
%>

<script type="text/javascript"> 
	function numkeyCheck(event) {
		var keyValue = event.keyCode;
		if( ((keyValue >= 48) && (keyValue <= 57)) ) 
			return true; 
		else
			return false; 
	} 
</script>
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
<body>
<article>
  <h3 align="center" >학생 평가란 입니다</h3>
	<form method="post" action="grForm2.jsp">   
	<table align="center" border="1">
		<center>    
			<tr>
	 			<td style="background-color: #eee;">
					<select name = "classnum">
					<% for(gradeDTO list : lecturelist) {%>
						<option value="<%=list.getLecturecode()%>"><%=list.getClassname() %></option>
					<%} %>
					</select>
				</td>
				<td>
					<input type="submit" size="10" value="학생조회" onclick="location.jref='grForm2.jsp?classnum=classnum'"/>
				</td>
			</tr>
		</table>
	</form>
	
	
	<table align="center" width = "300" border = "1" >		
			<td>수강인원<input type="text" value="<%=count%>" size="3">
				<input type = "hidden" name = "classnum" value = "<%=classnum %>"/>
			</td>
	</table>

	
	<form action="grpro4.jsp">
		<table align="center" width = "300" border = "1">
			<tr>
				<td style="background-color: #eee;"><b>이름</b></td>
				<td style="background-color: #eee;"><b>학번</b></td>
				<td style="background-color: #eee;"><b>점수</b></td>
			</tr>
			<%if(classnum != null) {%>
				<%for(int i = 0; i <stu.size(); i++){
					gradeDTO stcall = (gradeDTO)stu.get(i);%>
			<tr>
				<td><%=stcall.getName() %></td>
				<td><%=stcall.getStnum() %></td>
				<td><input type="text" name="record" onKeyPress="return numkeyCheck(event)" size="2"/></td>
					<input type = "hidden" name = "stnum" value = "<%=stcall.getStnum() %>"/>
					<input type = "hidden" name = "lecturecode" value = "<%=classnum %>"/>
			</tr>
				<%}%>
			<%} %>
			<tr>
				<td colspan="3" align="center">
					<input type="button" size="10" value="메인" onclick="document.location.href='professorMain.jsp'">
					<input type="submit" size="10" value="완료">
					<input type="reset" size="10"  value="재입력">
				</td>
			</tr>
		</table>
				<br><br/>
				<br><br/>
				<br><br/>
		<table align="center">

		</table>
	</form>	
	</article>		
</body>
</html>