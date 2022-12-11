<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.professor.lectureListDTO" %>    
<%@ page import = "project.global.professor.lectureListDAO" %>   
<%@ page import = "java.util.List" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String buildingA = request.getParameter("building");
	String roomnumA = request.getParameter("roomnum");
	String dayA = request.getParameter("day");
	
%>
		
<%
	lectureListDAO dao = new lectureListDAO();
	List<lectureListDTO> God = dao.God(buildingA,roomnumA,dayA);
%>


	

<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8"> <title>강의실 조회</title>
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 	<script type="text/javascript">
 	function sendTxt(code){
	 	window.opener.document.p_min.p_code.value =code;
 	 self.close();
 	}
 	</script>
	</head>

<body bgcolor = "white">

	<h2 align="center">강의 조회</h2>
	<form action="LeclistForm.jsp">
	<table align="center">
	<tr>
	<td>
		<select name = "building">
				<option value="">건물명</option>
				<option value="공학관">공학관</option>
				<option value="인문관">인문관</option>
		</select>

		<select name ="roomnum">
				<option value="">강의실 호수</option>
				<option value="101">101호</option>
				<option value="102">102호</option>
		</select> 
		
		<select name = "day">
				<option value="">요일</option>
				<option value="Mon">월요일</option>
				<option value="Tue">화요일</option>
				<option value="Wed">수요일</option>
				<option value="Thu">목요일</option>
				<option value="Fri">금요일</option>
		</select>	

	</td>
	<td>
			<div class="container">
			<input type="submit" value="조회" class="btn btn-success btn-sm">
			</div>
			
	</td>
	</tr>
	</table>
	</form>
	
	
	<form name="c_min">
	<table align="center" border="1" width = "400" cellpadding="0" cellspacing="0">
	
	<tr height="30">
		<td>건물이름 </td>
		<td>강의실 호수 </td>
		<td>요일</td>
		<td>교시</td>
		<td>수용가능인원</td>
		<td>선택</td>
	</tr>
<%
	for(int i = 0; i< God.size(); i++ ){
			lectureListDTO dto = (lectureListDTO)God.get(i);
			
			
%>
	<tr>
		<td><%=dto.getBuilding()%></td>
		<td><%=dto.getRoomnum()%></td>
		<td><%=dto.getDay()%></td>
		<td><%=dto.getTime()%></td>
		<td><%=dto.getCan()%></td>
		<td><input type="hidden" id="c_code" value="<%=dto.getClasscode()%>">
		<input type="button" size="6" value="신청"
		onclick="sendTxt('<%=dto.getClasscode()%>')"></td>
	</tr>

<%
	}
%>
	<tr>
		<td align="center" colspan="8"><input type="button" value="닫기" onclick="self.close();"></td>
	</tr>
	</table>
	</form>
</body>
</html>
