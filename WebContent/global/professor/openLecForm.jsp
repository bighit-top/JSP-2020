<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.professor.lectureListDAO" %>   
<%@ page import = "project.global.professor.lectureListDTO" %>
<%@ page import = "project.global.professor.openLecProInfoDTO" %>    
<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.List" %>
<%@include file = "/global/professor/professorMain.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String classcode = request.getParameter("classcode");
	if(classcode==null){
		
	}
	lectureListDAO dao = new lectureListDAO();
	dao.Mod(classcode); //classcode
%>
<%
	//교수의 정보인 id, 교수명, 담당학과를 가져와 입력될 수 있도록 한다.
	//String id = "20160406"; //나중에 쎼션으로 연결
	openLecProInfoDTO info = dao.proinfo(id); 
	//교수정보 끝
	
	//년도와 학기가 자동으로 입력될 수 있도록 한다.
	String year=""; //년도
	String semester=""; //월-학기
	
	Date d = new Date();
	year = (d.getYear()+1900)+"";
	int month = d.getMonth(); //0~11;
	
	if(month >= 2 && month <= 7){
		semester = "1"; //학기
	}else{
		semester = "2"; //학기
	}
	//년도와 학기 입력 끝
	
%>
<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8"> <title>강의 개설 신청서</title>
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
	</head>
<article>
<body bgcolor = "white">
	<h2 align="center">강의 개설 신청서</h2>

	<form name="p_min" action="LeclistForm2.jsp">
	<a href="#"onclick="newPop()"></a>
	
	<table align="center" border="1">
	<center>
	<tr>
		<td style="background-color: #eee;">년도</td>
		<td><%=year %></td>
			<input type = "hidden" name = "date1" value = "<%=year%>" />
	</tr>
	<tr>
		<td style="background-color: #eee;">학기</td>
		<td><%=semester %></td>
			<input type = "hidden" name = "semester" value = "<%=semester%>" />
	</tr>
	<tr>
		<td style="background-color: #eee;">교수이름</td>
		<td><%=info.getProname() %></td>
			<input type="hidden" name="homeroompro" value = "<%=info.getProname()%>" />
	</tr>
	<tr>
		<td style="background-color: #eee;">학번</td>
		<td><%=id %></td>
			<input type="hidden" name = "id" value = "<%=id %>"/>
	</tr>
	<tr>
		<td style="background-color: #eee;">담당 학과 </td>
		<td><%=info.getPropart() %></td>
			<input type="hidden" name = "part" value = "<%=info.getPropart() %>"/>
	</tr>
	<tr>
		<td style="background-color: #eee;">강의명</td>
		<td><input type="text" name="classname"></td>
	</tr>
	<tr>
		<td style="background-color: #eee;">학 점  </td>
		<td>
			<select name="score">
				<option value="3">3 학점</option>
				<option value="2">2 학점</option>
				<option value="1">1 학점</option>
			</select>
		</td>
	</tr>
	<tr>
		<td style="background-color: #eee;">학 년</td>
		<td>
			<select name = "who">
				<option value="1">1학년</option>
				<option value="2">2학년</option>	
			</select>
		</td>
	</tr>
	<tr>
		<td style="background-color: #eee;">회신 이메일</td>
		<td>
			<input type="text" name="proemail">@
			<select name="proemail1">
				<option value=""selected disabled>직접선택</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
			</select> 
		</td>
	</tr>
	<tr>
		<td style="background-color: #eee;">강의실 코드</td>
		<td><input type="text" id="p_code" name="classcode" readonly placeholder="강의실조회버튼을 누르세요!"/>
		
		<input type="button" size="10" value="강의실 조회" onclick="newPop()"></td>
	</tr>
	<tr>
	</tr>
		<td colspan="2" align="right">
			<input type="reset" size="10" value="다시 작성">
			<input type="submit" size="10" value="개설 신청">
		</td>
	</center>
	</table>	
	</form>	
</body>
</article>
</html>