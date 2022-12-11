<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="project.global.student.timeonDTO" %>
<%@page import="project.global.student.studentDAO" %>
<%@page import="java.util.List" %>
<%@include file = "/global/student/Main2.jsp"%>
<!DOCTYPE html>
<html>

<title>학적관리-복학</title>


<article>
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

<%
	// String id = (String)session.getAttribute("id");
	//String stnum = "20164097";
	studentDAO dao = new studentDAO();
	
	// 휴학 신청 여부를 확인하는 dto
	timeonDTO dto = dao.printInfo4(id);
	//List<Integer>list1 = dao.status_app_val(id);
	
	
	
%>

<%// 휴학 신청한 기록이 있으면 
if(dto != null){ %>
<body>

<h2 align="center">복학신청</h2>
<form action = "timeonPro.jsp" method="post">
	<table border="1" align="center">
	
		<tr>
			<td> 이름 </td>
			<td>
				<input type="text" size="10" value="<%=dto.getName() %>" disabled/>
				<input type="hidden" name="name" value="<%=dto.getName() %>"/>
			</td>
			
			<td>학번</td>
			
			<td>
				<input type="text" size="10" value="<%=dto.getStnum() %>"disabled/>
				<input type="hidden" name="stnum" value="<%=dto.getStnum() %>"/>
			</td>
		</tr>
	
		<tr>
			<td>휴학적용년도</td>
			<td>
				<input type="text" size="10" value="<%=dto.getYear() %>" disabled/>
				<input type="hidden" name="year" value="<%=dto.getYear() %>"/>
			</td>
			
			<td>휴학적용학기</td>
			<td>
				 <input type="text" size="10" value="<%=dto.getSemester() %>" disabled/>
				 <input type="hidden" name="semester" value="<%=dto.getSemester() %>"/>
			</td>
		</tr>
		
		<tr>
			<td>복학 신청일자 </td>
			<td colspan="3">
				<input type="text" size="10" value="<%=dto.getDay()%>" disabled/>
				<input type="hidden" value="<%=dto.getDay()%>" name="day"/>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" align="right">
				<input type="submit" value="신청"/>
			</td>
		</tr>
	
	</table>

</form>
<br/>

<h2 align="center">복학신청 조회</h2>

<table align="center" border="1" class="align_center">
	<tr  style="background-color: #eee;">
		<td>학번</td>
		<td>이름</td>
		<td>복학신청일자</td>
		<td>심사</td>
	</tr>
	<!--  복학신청 이력 조회 list -->
	<%List<timeonDTO> list = dao.timeonlookup(id); %>
	<%for(timeonDTO dto1 : list){ %>
		<tr>
			<td><%=dto1.getStnum() %></td>
			<td><%=dto1.getName() %></td>
			<td><%=dto1.getDay() %></td>
			
			<%if(dto1.getApproval() == 0) {%>
				<td>심사중</td>
			<%}else if(dto1.getApproval() == 1){ %>
				<td>승인</td>
			<%}else{ %>
				<td>거절</td>
			<%} %>
		</tr>
	<%} %>
	
</table>



</body>
<%}else{ %>
	<script>
		alert('복학신청을 할 수 없습니다.');
		document.location.href="Main.jsp";
	</script>
<%} %>
</article></section></body>
</html>