<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/global/student/Main2.jsp"%>
<!DOCTYPE html>
<html>

<article> 
<meta charset="UTF-8">
<title>학적관리-휴학</title>
</head>

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

<%@page import="project.global.student.timeoffDTO" %>
<%@page import="project.global.student.studentDAO" %>
<%@page import="java.util.List" %>

<%
	//String id = (String)session.getAttribute("id");
	//String stnum = "20164097";
	studentDAO dao = new studentDAO();
	
	timeoffDTO dto = dao.printInfo3(id);
	List<timeoffDTO> list = dao.timeofflookup(id);
	
%>
<script>
	function check(){
		var tmp = 1;
		
		var val = document.getElementById("couse").value;
		if(val == ""){
			alert('휴학사유를 선택해주세요!');
			return false;
		}
		<%
		for(timeoffDTO dto1 : list){
			if(dto1.getApproval() == 0){
				%>alert('이미 신청하셨습니다.');
				tmp = 0;
				return false;
				<%
			}
		}
		%>
		if(tmp == 1){
			return true;
		}
	}
</script>

<body>

<h2 align="center">휴학 신청</h2>
<form action = "timeoffPro.jsp" method="post" onsubmit="return check()">
	<table border="1" align="center">
		
		<tr>
			<td>이름</td>
			<td>
				<input type="text" size="10" value="<%=dto.getName() %>" disabled/>
				<input type="hidden" name="name" value="<%=dto.getName() %>"/>
			</td>
			<td>학번</td>
			<td>
				<input type="text" size="10" name="stnum" value="<%=dto.getStnum()%>" disabled/>
				<input type="hidden" name="stnum" value="<%=dto.getStnum() %>"/>
			</td>
		</tr>
		
		<tr>
			<td>휴학 사유</td>
			<td>
				<select name="couse"  id="couse">
					<option value="" selected disabled hidden>--선택--</option>
					<option value="군휴학"> 군휴학</option>
					<option value="취업"> 취업 </option>
					<option value="어학연수"> 어학연수 </option>
					<option value="질병"> 질병 </option>
				</select>
			</td>
			
			<td> 신청일자 </td>
			<!-- 현재 날짜로 받아오기 java로 set -->
			<td>
				<input type="text" size="10" name="day" value="<%=dto.getDay()%>" disabled/>
				<input type="hidden" name="day" value="<%=dto.getDay()%>" />
			</td>
		</tr>

		<tr>
			<td> 적용년도 </td>
			<td> 
				<!-- dao : 이번 년도 입력되게 적용하기. -->
				<input type="text" size="5" value="<%=dto.getYear() %>" name="year" disabled />
				<input type="hidden" name="year" value="<%=dto.getYear() %>"/>
			</td>
			
			<td> 적용학기 </td>
			<td>
				<select name="semester">
					<option value="1">1학기</option>
					<option value="2">2학기</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>주소</td>
			<td colspan = "3">
			<input type="text" id="zon" name="zon" SIZE="12" disabled value="<%=dto.getZon()%>" /> <br/>
			<input type="text" name="street" id="street" SIZE="40" disabled value="<%=dto.getStreet()%>"/> <br/>
			<input type="text" name="addr" id="addr" SIZE="40" disabled value="<%=dto.getAddr() %>" />
			
			<input type="hidden" name="zon" value="<%=dto.getZon() %>"/>
			<input type="hidden" name="street" value="<%=dto.getStreet() %>"/>
			<input type="hidden" name="addr" value="<%=dto.getAddr() %>"/>
			
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

<h2 align="center"> 휴학신청 조회</h2>
<table align="center" border="1" class="align_center">
	<tr style="background-color: #eee;">
		<td>이름 </td>
		<td>휴학사유</td>
		<td>휴학적용년도/학기</td>
		<td>신청일자</td>
		<td>심사</td>
	</tr>
	
	<%
	String name;
	for(timeoffDTO dto1 : list){ %>
		<tr>
			<td><%=dto1.getName() %></td>
			<td><%=dto1.getCouse() %></td>
			<td><%=dto1.getYear() %>년도/<%=dto1.getSemester()%>학기 </td>
			<td><%=dto1.getDay() %></td>
			
			<%if(dto1.getApproval() == 0){
				 %><td>심사중</td>
			<%} else if(dto1.getApproval() == 1){%>
				<td> 승인 </td>
			<%} else {%>
				<td>거절</td>
			<%} %>
			
		</tr>
	<%}%>
</table></body></article></section>

</body>
</html>