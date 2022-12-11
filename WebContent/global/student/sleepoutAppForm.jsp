<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.studentDAO" %>
<%@ page import = "project.global.student.sleepoutAppDTO2" %>
<%@include file = "/global/student/Main2.jsp"%>

<%
	//String stnum = request.getParameter("stnum");
//String stnum = "20164097";	
studentDAO dao = new studentDAO();
sleepoutAppDTO2 dto = dao.sleepoutApp(id);
%>
	
<%

/* 
1. session 에 저장된 학번 값 id 변수에 저장.
2. 학생테이블에 접근하여 id 값과 같은 학생의 데이터 정보 조회
3. 필요한 정보 set 하기
4. set 한 데이터들을 입력해야할 input type 위치에다가 value  값 dto.getOOO() 해주기




5. input type="hidden"으로 안보이게 지정하여 값이 pro 페이지로 넘어갈수 있게 지정해주기.

 */
%>
	
<html>

<article> 
<form action="sleepoutAppPro.jsp" method="post">

	<h4>●외박신청</h4>
	<h3 align="center">외박신청은 작성 후 수정이 불가(취소 후 재신청)하니 신중히 신청하시기 바랍니다.</h3>
	<h4 align="center" style="color: blue;">외박신청 기간:09:00~20:00(서버시간으로
		최대 30분의 오차가 있을 수 있습니다.)</h4>
	<table border="1" align="center" margin="auto" width="50%">
		<caption>외박신청</caption>
		<tr>
			<td><font size="4">학과</font>
			<input type="text" name="part" value="<%=dto.getPart() %>" disabled >
			<input type="hidden" name="part" value="<%=dto.getPart() %>" /> 
				<font size="4">학번</font>
				<input type="text"  name="stnum" value="<%=dto.getStnum() %>"disabled>
				<input type="hidden" name="stnum" value="<%=dto.getStnum() %>" />  
				<font size="4">이름</font>
				<input type="text"  name="name" value="<%=dto.getStname() %>" disabled >
				<input type="hidden" name="name" value="<%=dto.getStname() %>" />
				</td>
		</tr>
		<tr>-
			<td><font size="4">외박 시작일</font> <input type="date"
				name="startday"> <font size="4">외박 귀가일</font> <input
				type="date" name="comeback"></td>
		</tr>
		<tr>
			<td colspan="2"><font size="4">생활관</font> <input type="radio"
				value="A동" name="dreamroom" />A동 <input type="radio" value="B동"
				name="dreamroom" />B동</td>
		</tr>
		<tr>
			<td colspan="2"><font size="4">관실</font> <select name="ho">
					<option value="" selected  hidden>--선택--</option>
					<option>101호</option>
					<option>102호</option>
					<option>103호</option>
					<option>104호</option>
					<option>105호</option>
					<option>201호</option>
					<option>202호</option>
					<option>203호</option>
					<option>204호</option>
					<option>205호</option>
					<option>301호</option>
					<option>302호</option>
					<option>303호</option>
					<option>304호</option>
					<option>305호</option>
			</select></td>
		</tr>
		<tr>
			<td colspan="2"><pont size="4">외박사유</pont> <input type="radio"
				value="학교행사" name="outsleep" />학교행사 <input type="radio" value="귀가"
				name="outsleep" />귀가 <input type="radio" value="입원" name="outsleep" />입원</td>
		</tr>
		<tr>
			<td colspan="2"><font size="4">외박내용</font></td>
		</tr>
		<tr>
			<td><input type="text" name="secret" placeholder="내용을 입력하세요"
				style="width: 950px; height: 300px;"></td>
		</tr>
		<tr>

			<table align="center" margin="auto" width="50%">
				<tr>
					<td align="center"><br />
					<br />
					<br />
					<input type="submit" value="외박신청서 접수"> <input type="reset"
						value="닫기"></td>
				</tr>
			</table></article></section></body></html>