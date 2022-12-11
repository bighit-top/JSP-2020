<%@page import="project.global.professor.lectureListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.professor.lectureListDAO" %>  
 <%@include file = "/global/professor/professorMain.jsp"%>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dto" class="project.global.professor.openLectureDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>


<% 
	lectureListDAO dao = new lectureListDAO();
	int check = dao.checkRoom(dto);
	
	if(check == 2){%>
		<script>
			alert("빈 강의실이 아닙니다.");
			history.go(-1);
		</script>		
  <%}else {
		dao.checkRoom(dto);  
	} %>


<%
	String classcode = request.getParameter("classcode");
	
	lectureListDTO A = dao.Mod(classcode);
%>


<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8"> <title>강의실 배정 신청 </title>
	<script type="text/javascript">
	function newPop(){
		window.open('LeclistForm.jsp','SmallWindow','width=800,height=800,scrollbars=yes,left=200,top=50');
		}
	</script>
	<!--script>
	function push(){
		var childWindow = window.open("lectureListFrom1.jsp","강의실조회","width=500, height=600, left=100, top=50");}
	
	//괄호안 팝업시킬 "jsp"나" html파일이름 "넣고  너비랑 높이 위치지정한다. 그리고 jsp파일 만들러 고고
	</script  -->
	
	</head>

<body bgcolor = "white">
<article>
	<h3 align="center">강의실 배정신청이 완료 되었습니다.</h3>
	
	<form name="p_min">
	<a href="#"onclick="newPop()"></a>
	
	<table align="center" border="1">
	<center>
	<tr>
		<td>년도<input type="text" disabled value="<%=dto.getDate1()%>"></td>
	</tr>
	<tr>
		<td>학기<input type="text" disabled value="<%=dto.getSemester()%>"></td>
	</tr>
	<tr>
		<td>교수이름<input type="text" disabled value="<%=dto.getHomeroompro()%>"></td>
	</tr>
	<tr>
		<td>학번<input type="text" disabled value="<%=dto.getId()%>"></td>
	</tr>
	<tr>
		<td>담당 학과 <input type="text" disabled value="<%=dto.getPart()%>"></td>
	</tr>
	<tr>
		<td>강의명<input type="text" disabled value="<%=dto.getClassname()%>"></td>
	</tr>
	<tr>
		<td>학 점  <input type="text" size="4" disabled value="<%=dto.getScore()%>"></td>
	</tr>
	<tr>
		<td>학 년 <input type="text" disabled value="<%=dto.getWho() %>"/> </td>
	</tr>
	<tr>
		<td>강의실 코드
		<input type="text" id="p_code" disabled value="<%=dto.getClasscode()%>">
	</tr>
	<tr>
		<tr>
		<td>사용 가능 여부 : Y </tr>
	<tr>
		<td>관리자의 승인을 기다려주세요.</td></tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" size="10" value="닫기" onclick="document.location.href='professorMain2.jsp'">
		</td>
	</tr>
	</center>
	</table>	
	</form>	
	</article>
</body>
</html>