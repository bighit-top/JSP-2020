<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.studentDAO" %>
<%@ page import = "project.global.student.sleepoutcheckDTO" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/student/Main2.jsp"%>
<%	//String stnum ="20164097";
	studentDAO dao = new studentDAO();
	//String stid = request.getParameter("stnum");
	
	List<sleepoutcheckDTO> list = dao.sleepoutlist(id);
	
%>
     <html>
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
<h4 align ="center">외박신청 승인 조회</h4>
<table border="1" align = "center" margin="auto" width="50%">
<tr style="background-color: #eee;">
<td><font size="4">학과</font></td>
<td><font size="4">학번</font></td>
<td><font size="4">이름</font></td>
<td><font size="4">외박일</font></td>
<td><font size="4">승인여부</font></td></tr>
<% for(sleepoutcheckDTO dto : list){ %>
<tr>
	<td><%=dto.getPart() %></td>
	<td><%=dto.getStnum() %></td>
	<td><%=dto.getName() %></td>
	<td><%=dto.getStartday() %></td>
	<%if(dto.getAllow() == 0){
				 %><td>심사중</td>
			<%} else if(dto.getAllow() == 1){%>
				<td> 승인 </td>
			<%} else {%>
				<td>거절</td>
			<%} %>
			
		</tr>
	<%}%>

	
</tr>

</table></article></section></body></html>
