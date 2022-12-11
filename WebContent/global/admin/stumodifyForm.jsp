<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="project.global.admin.adminDAO" %>
<%@page import="project.global.admin.stumodifyDTO" %>
<%@page import="project.global.admin.subjectDTO" %>
<%@page import="java.util.List" %>
<%@include file = "/global/admin/adminMain2.jsp"%>

<% request.setCharacterEncoding("UTF-8");%>
<html>

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
<title>학생정보 입력</title>

<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<%

	adminDAO dao1 = new adminDAO();
	List<subjectDTO> list = dao1.partcall();

%>

<script>           
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("zon").value = data.zonecode;
				document.getElementById("street").value = data.address;
			}
		}).open();
	}
</script>

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
<h2 align="center">학생정보수정</h2>
<form method="post" action="stumodify2Form.jsp">

	<table border="1" align="center">
		<tr>
			<td>
				<select name="part">
					<option value="" selected disabled>학과선택</option>
				<%for(int i = 0; i<list.size(); i++){ %>
					<option value="<%=list.get(i).getSubname() %>"> <%=list.get(i).getSubname() %> </option>
				<%}%>
				</select>
			</td>
			
			<td>
				<input type="text" name="search_stnum" size="10" placeholder="학번입력"/>			
			</td>
			
			<td>
				<input type="submit" value="조회"/>
			</td>
		</tr>
	
	</table>

</form></article></html>

