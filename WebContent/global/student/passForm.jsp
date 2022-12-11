<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.studentDAO" %>
<%@ page import = "project.global.student.passDTO" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/student/Main2.jsp"%>
<%-- <%String stid = session.getAttribute("studentId"); %>  나중에 주석 풀어야함--%>
<%	//String stnum ="20164097";
	studentDAO dao = new studentDAO();
	//String stid = request.getParameter("stnum");
	List<passDTO> list = dao.list(id);
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
<h4 align ="center">기숙사 합격자 조회</h4>
<table border="1" align = "center" margin="auto" width="50%">
<tr style="background-color: #eee;">
<td><font size="4">학번</font></td>
<td><font size="4">학과</font></td>
<td><font size="4">이름</font></td>
<td><font size="4">성별</font></td>
<td><font size="4">핸드폰번호</font></td>
<td><font size="4">생활관</font></td>
<td><font size="4">호실</font></td></tr>

<% for(passDTO dto : list){ 
	String dream = dto.getDreamroom();%>
<tr>
	<td><%=dto.getStnum() %></td>
	<td><%=dto.getPart() %></td>
	<td><%=dto.getName() %></td>
	<td><%=dto.getGender() %></td>
	<td><%=dto.getPhone() %></td>
	
 <%if(dream==null) {%>
	<td>심사중</td>
 <%}else { %>
	<td><%=dto.getDreamroom() %></td>
<%} %>
	<td><%=dto.getHo() %></td>
	
</tr>
<%} %>



</table></article></section></body></html>




</table></article></section></body></html>

