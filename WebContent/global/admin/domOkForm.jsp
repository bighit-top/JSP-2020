<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="project.global.admin.domCheckDTO" %>
<%@ page import="project.global.admin.domDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<%
	domDAO dao1 = new domDAO(); //domDAO() 객체 생성
	List<domCheckDTO> list = dao1.getAllowCheck(); //입실 승인된 학생 데이터 list로 출력
%>
<!DOCTYPE html>
<!-- 입실 승인 된 학생 정보 넘겨받기 -->
<!-- 학생 기숙사 합격자 조회 페이지로 DB 넘기기 -->
<html>



<title>합격자 확인 페이지</title>

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
<h1 align="center">기숙사 합격자 조회</h1>
<table border="1" align ="center" width="80%">
	<tr style="background-color: #eee;">
		<th>번호</th>
		<th>학과</th>
		<th>학번</th>
		<th>성명</th>
		<th>생활관</th>
		<th>호실</th>
	</tr>
	<%for(domCheckDTO dto : list){ %>
	<tr>
		<td><%=dto.getNo() %></td>
		<td><%=dto.getPart() %></td>
		<td><%=dto.getStnum() %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getDreamroom() %></td>
		<td><%=dto.getHo() %></td>
	</tr>
	<%} %>
</table>


</body></article></section></body>
</html>