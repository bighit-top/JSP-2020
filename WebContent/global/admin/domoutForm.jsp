<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="project.global.admin.domoutDTO" %>
<%@ page import="project.global.admin.domDAO" %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<%
	domDAO dao1 = new domDAO(); //domDAO() 객체 생성
	List<domoutDTO> list = dao1.getOut(); //퇴실 신청 학생 leaving 테이블에서 list로 출력
%>
<!DOCTYPE html>
<html>

 <article>
<title>기숙사 퇴실 승인 페이지</title>
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
button{
	color: 
}
h4{
	margin-left: 10%;
}
div.btn{
	margin: auto;
}
</style>
</head>
<body>
<h1 align="center">기숙사 퇴실 승인</h1>

<%if(list == null || list.size() == 0){ %>
<h3 style="text-align: center;">퇴실 신청이 없습니다.</h3>
<%}else{ %>
<table>
	<tr style="background-color: #eee;">
		<th>번호</th>
		<th>학번</th>
		<th>학과</th>
		<th>성명</th>
		<th>생활관</th>
		<th>호</th>
		<th>퇴실 사유</th> 
		<th>퇴실 예정일</th>
		<th>퇴실 승인</th> <!-- DB delete -->
	</tr>
	<%for(domoutDTO dto : list){ %>
	<tr>
		<td><%=dto.getNo() %></td>
		<td><%=dto.getStnum() %></td>
		<td><%=dto.getPart() %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getDormitory() %></td>
		<td><%=dto.getHo() %></td>
		<td><%=dto.getReason() %></td>
		<td><%=dto.getDday() %></td>
		<td><div class="btn"><a href ="/project/global/admin/domoutPro.jsp?stnum=<%=dto.getStnum()%>"><input type="button" value="승인"/></a>
		</div></td>
	</tr>
	<%} %>
</table>
<%} %>

</body></article></section></body>
</html>