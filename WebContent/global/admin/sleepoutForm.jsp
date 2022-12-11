<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="project.global.admin.nightDTO" %>
<%@ page import="project.global.admin.domDAO" %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<%
	domDAO dao1 = new domDAO();
	List<nightDTO> list = dao1.getNignt(); //외박 신청한 학생 리스트 list 출력
	List<nightDTO> listall = dao1.getAllNignt(); //외박 신청 승인된 학생 리스트 listall 출력
	String allow = request.getParameter("allow"); //외박 승인/거부 allow 값 넘기기 위한 파라미터 변수 설정
%>
<!DOCTYPE html>
<html>

 <article>
<title>외박신청 승인 페이지</title>
<style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 90%;
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
h4{
	margin-left: 10%;
}
div.btn{
	margin: auto;
}

</style>
</head>
<body>
<h1 align="center">외박 신청 승인</h1>
<form action="sleepoutPro.jsp" method="post">
<table>
	<tr style="background-color: #eee;">
		<th>번호</th>
		<th>신청 날짜</th>
		<th>학과</th>
		<th>학번</th>
		<th>성명</th><!-- 클릭하면 외박신청서 list 페이지로 링크 -->
		<th>생활관</th>
		<th>호실</th>
		<th>외박 시작일</th>
		<th>귀가일</th>
		<th>외박신청 승인</th>
	</tr>
	<%for(nightDTO dto: list){ %>
	<tr>
		<td><%=dto.getNo() %></td>
		<td><%=dto.getReg_date() %></td>
		<td><%=dto.getPart() %></td>
		<td><%=dto.getStnum() %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getDreamroom() %></td>
		<td><%=dto.getHo() %></td>
		<td><%=dto.getStartday() %></td>
		<td><%=dto.getComeback() %></td>
		<td><div class="btn"><a href="/project/global/admin/sleepoutPro.jsp?no=<%=dto.getNo() %>&stnum=<%=dto.getStnum() %>&allow=1"><input type="button" value="승인" /></a>
		<a href="/project/global/admin/sleepoutPro.jsp?no=<%=dto.getNo() %>&stnum=<%=dto.getStnum() %>&allow=-1"><input type="button" value="거부" /></a></div></td>
	</tr>
	<%} %>
</table>

</form>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<!-- 외박 신청 결과 리스트  -->
<table>
<tr style="background-color: #eee;">
		<th>번호</th>
		<th>신청 날짜</th>
		<th>학과</th>
		<th>학번</th>
		<th>성명</th><!-- 클릭하면 외박신청서 list 페이지로 링크 -->
		<th>생활관</th>
		<th>호실</th>
		<th>승인 확인</th>
	</tr>
	<%for(nightDTO dto: listall){ %>
	<tr>
		<td><%=dto.getNo() %></td>
		<td><%=dto.getReg_date() %></td>
		<td><%=dto.getPart() %></td>
		<td><%=dto.getStnum() %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getDreamroom() %></td>
		<td><%=dto.getHo() %></td>
		<%if(dto.getAllow() == 0){ %>
			<td>심사 중</td>
		<%}else if(dto.getAllow() == 1){ %>
			<td>승인</td>
		<%}else{ %>
			<td>거부</td>
		<%} %>
	</tr>
	<%} %>
</table>
</body></article></section></body>
</html>