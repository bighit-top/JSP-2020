<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.gradeDTO" %>    
<%@ page import = "project.global.student.gradeDAO" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/student/Main2.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
 <head>

  
<article> 
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

<%	
	String grade = request.getParameter("grade");
%>
	
<%
	//String stnum = "20164097";

	gradeDAO dao = new gradeDAO(); //DAO 이용을 위한 선언
	List<gradeDTO> list = null;
		list=	dao.resultChecking(id); //성적 리스트를 가져옴
	List<gradeDTO> select = dao.gradeSelect(grade, id); //학년별 성적리스트를 가져옴
	gradeDTO info = dao.student(id);//학생정보를 가져오기 위함
%>

		<!-- 평점 계산 = sum(학점*성적)/총수료학점  -->
<%
	int total = 0; //총수료학점
	int tot = 0; //평점계산을 위한 수료학점 - 현재 수강중인 강의는 제외

	double sum = 0;	//평점을 더해서 담기 위한 변수 선언
	double everage = 0.0;  //평점을 계산해서 담을 변수 선언
	
	for(int i = 0; i < list.size(); i++) {
		gradeDTO dto = (gradeDTO)list.get(i); //list에서 갯수대로 가져옴
	
		total += dto.getScore(); //학번으로 조회한 list 결과의 학점을 모두 더함
		
		int score1 = dto.getScore(); //학점을 대입
		double record1 = (double)dto.getRecord(); //성적을 대입할 변수와 형변환
	
		
		if(record1 != 0.0){
			
			tot+= dto.getScore();
	
			if(record1 >= 95){
				record1 = 4.5;
			}else if (record1 >= 90) {
				record1 = 4.0;
			}else if (record1 >= 85) {
				record1 = 3.5;	
			}else if (record1 >= 80) {
				record1 = 3.0;	
			}else if (record1 >= 75) {
				record1 = 2.5;	
			}else if (record1 >= 70) {
				record1 = 2.0;	
			}else if (record1 >= 65) {
				record1 = 1.5;	
			}else if (record1 >= 60) {
				record1 = 1.0;	
			}else{
				record1 = 0.0;	
			}			
		
			sum += score1 * record1; //학점과 성적을 곱해서 sum에 대입함.
		}
	}
	everage = sum/tot; //학점과 성적을 곱해 모두 더한 값 sum을 총수료한 학점 total로 나누어 대입
	
%>

<title>성적조회</title>

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


	<body>   
		<center>    
			<h1>성적조회</h1>
			<form action = "gradeForm.jsp" method = "post">
				<table width = "600" border = "1">
					<tr>
						<td height="30"  style="background-color: #eee;">성명</td>
						<td height="30"  style="background-color: #eee;">학번</td>
						<td height="30"  style="background-color: #eee;">학과</td>
						<td height="30"  style="background-color: #eee;">학년</td>	
					</tr>
					<tr>
						<td><%=info.getStame() %></td>
						<td><%=info.getStnum() %></td>
						<td><%=info.getPart() %></td>
						<td><%=info.getGrade() %></td>
					</tr>
					<tr>
						<td colspan = "2" height="30"  style="background-color: #eee;">
							수료학점
						</td>
						<td colspan = "2" height="30"  style="background-color: #eee;">
							평점
						</td>
					</tr>
					<tr>
						<td colspan = "2">
							<%=total %>
						</td>
						<td colspan = "2">
							<%=everage %>
						</td>
					</tr>
				</table>
				<br><br/>
	
				<select name="grade">
						<option value = "전부">전체 성적조회</option>
						<option value = "1">1학년</option>
						<option value = "2">2학년</option>
				</select>
					<input type = "submit" value = "조회"/>
				
				<table width = "600" border = "1">		
					<tr>
						<td height="30"  style="background-color: #eee;"><b>학년</b></td>
						<td height="30"  style="background-color: #eee;"><b>강의코드</b></td>
						<td height="30"  style="background-color: #eee;"><b>강의명</b></td>
						<td height="30"  style="background-color: #eee;"><b>부여학점</b></td>
						<td height="30"  style="background-color: #eee;"><b>성적</b></td>
						<td height="30"  style="background-color: #eee;"><b>학점</b></td>
					</tr>
				<% if(grade != null) {%>
					<%for(int i = 0; i < select.size(); i++) {
					gradeDTO choice = (gradeDTO)select.get(i);
					int score = choice.getRecord();
				%>
					<tr>
						<td><%=choice.getGrade() %></td>
						<td><%=choice.getLecturecode() %></td>
						<td><%=choice.getClassname() %></td>
						<td><%=choice.getScore() %></td>
						
						<%
						if(score != 0){ %>
							<td><%=choice.getRecord() %></td>
						<%}else{ %>
							<td>수강중</td>
						<%} %>	
						<%						
						if(score >= 95){%>		<!-- a+ 등 점수 부여해서 계산식 만들기 -->
						<td>A+</td>
					<%}else if (score >= 90) {%>
						<td>A</td>
					<%}else if (score >= 85) {%>
						<td>B+</td>
					<%}else if (score >= 80) {%>
						<td>B</td>
					<%}else if (score >= 75) {%>
						<td>C+</td>
					<%}else if (score >= 70) {%>
						<td>C</td>
					<%}else if (score >= 65) {%>
						<td>D+</td>
					<%}else if (score >= 60) {%>
						<td>D</td>
					<%}else if( score == 0){ %>
						<td>수강중</td>
					<%}else{ %>
						<td>F</td>
					<%} %>
				</tr>
				<%} %>
				<%}else{ %>		 			
					<%for(int i = 0; i < list.size(); i++) {
					gradeDTO dto = (gradeDTO)list.get(i);
					int score =  dto.getRecord();
				%>
					<tr>
						<td><%=dto.getGrade() %></td>
						<td><%=dto.getLecturecode() %></td>
						<td><%=dto.getClassname() %></td>
						<td><%=dto.getScore() %></td>
						
						<%
						if(score != 0){ %>
							<td><%=dto.getRecord() %></td>
						<%}else{ %>
							<td>수강중</td>
						<%} %>
						
						<%
						if(score >= 95){%>
							<td>A+</td>
						<%}else if (score >= 90) {%>
							<td>A</td>
						<%}else if (score >= 85) {%>
							<td>B+</td>
						<%}else if (score >= 80) {%>
							<td>B</td>
						<%}else if (score >= 75) {%>
							<td>C+</td>
						<%}else if (score >= 70) {%>
							<td>C</td>
						<%}else if (score >= 65) {%>
							<td>D+</td>
						<%}else if (score >= 60) {%>
							<td>D</td>
						<%}else if( score == 0){ %>
							<td>수강중</td>
						<%}else{ %>
							<td>F</td>
						<%} %>
					</tr>
					<%} %>					
				</table>
				<%} %>	
			</form>	
		</center>
	</body>
	</article></section></body>
</html>