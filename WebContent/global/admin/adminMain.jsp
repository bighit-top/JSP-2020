<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "project.global.admin.adminDAO"%>
    <%@ page import = "project.global.admin.calendar2DTO" %>
<%@ page import = "project.global.admin.calendar2DAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Calendar" %>

<%	session.getAttribute("adminId"); %>
<%  String id= (String)session.getAttribute("adminId"); %>



<%  int count1 = 0;//재학
	adminDAO dbpro = new adminDAO();
	count1 = dbpro.getStudentCount1();
	int count2 = 0;//휴학
	adminDAO dbpro2 = new adminDAO();
	count2 = dbpro.getStudentCount2();
	%>	
<%	int count3 = 0;//교수
	adminDAO dbpro1 = new adminDAO();
	count3 = dbpro.getProfessorCount();
%>
<html lang="en">
<head>
<title>main page test</title>

<meta charset="utf-8">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

header {
  background-color: #2A517E;
  padding: 5px;
  text-align: center;
  font-size: 20px;
  color: white;
}

nav {
  float: left;
  width: 15%; 
  background: #ECEDC9;
  padding: 20px;
}
 
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  background-color: white;
  
}

/* Clear floats after the columns */
section:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
  background-color: #777;
  padding: 2px;
  text-align: center;
  color: white;
  margin-top: 20%;
}
.nav2{
   float: right;
   width: 15%; 
     background: #C2D8EB;
     padding: 20px;
}
.nav2{
  list-style-type: none;
  padding: 0;
}
a:link {color:black; text-decoration: none;}
a:visited{color:black; text-decoration: none;}
a:hover{color:black; text-decoration: none;}
/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
</style>
</head>
<body>

<header>
<h3>글로벌 대학교</h3>

  <h2>학사 관리 시스템(관리자용)</h2>

    <input type="button" value="로그아웃" style="float:right;"
       onclick="document.location.href='/project/global/logoutForm.jsp'">
        <input type="button" value="메인" style="float:right;"
       onclick="document.location.href='/project/global/admin/adminMain.jsp'">
       
  <br/>
</header>

<section>
  <nav>
    <ul>
    <li>▶메뉴</li><br/>
      <li>●학생/학사 관리</li><br/>
      <li><a href="stuInfoForm.jsp">학생 정보입력</a></li>
      <li><a href="stumodifyForm.jsp">학생 정보수정</a></li>
      <li><a href="proinputinfoForm.jsp">교수 정보입력</a></li>
      <li><a href="timeoffappForm.jsp">휴학 승인</a></li>
     <li><a href="timeonappForm.jsp">복학 승인</a></li>
      <li><a href="changePartConfirmForm.jsp">전과신청 승인</a></li>
      <li><a href="admincalendarForm.jsp">학사일정 확인</a></li>
      <li><a href="calendarForm.jsp">학사일정 관리</a></li><br/>
      <li>●강의 관리</li><br/>
      <li><a href="procheckForm.jsp">교수 강의개설 승인</a></li><br/>
      <li>●부속행정 관리</li><br/>
      <li><a href="domCheckForm.jsp">기숙사 입실 승인</a></li>
      <li><a href="domoutForm.jsp">기숙사 퇴실 승인</a></li>
      <li><a href="domOkForm.jsp">기숙사 합격자 조회</a></li>
      <li><a href="roomForm.jsp">학생 호실 관리</a></li>
      <li><a href="sleepoutForm.jsp">외박신청 승인</a></li>
      <li><a href="adminListForm.jsp">공지사항</a></li>
      <li><a href="adminLostForm.jsp">분실물센터</a></li><br/>
      
      <br/>  
    </ul>
  </nav>





 <article>
 <h4 align="right">세부인원 수(명)<br/> </h4>
<h4 align="right">재학생:<%=count1 %>명<br/></h4>
<h4 align="right">휴학생:<%=count2 %>명<br/></h4>
<h4 align="right">교수:<%=count3 %>명<br/></h4>
     

<title>학사일정</title>

	<head>
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
	
<%	//페이지 카운트
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage -1) * pageSize +1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List<calendar2DTO> arrList = null;
	calendar2DAO dao = new calendar2DAO();
	count = dao.getLectureCount();
	if(count > 0){
		arrList = dao.calendarChecking(startRow, endRow);
	}
%>
<!-- 일정 최근 순서별로 정렬 필요 -->
	<body>
		<center>
			<h1>학사일정</h1>
				<table >
					<tr height ="30" style="background-color: #eee;">
						<td width = "100">날짜</td>
						<td width = "400">일정</td> 
					</tr>
				<%	
					for(int i = 0; i < arrList.size(); i++) {
					calendar2DTO dto = (calendar2DTO)arrList.get(i);
					String day = dto.getDay();
				%>
					<tr height ="30">

					
						<td width = "100"><%=day.substring(0,10) %></td>
						<td width = "400"><%=dto.getContents() %></td> 
					</tr>
				<%} %>
				</table>

<%
	if(count > 0 ){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0:1);
		
		int startPage = (int)(currentPage/10) * 10 + 1;
		int pageBlock = 5;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage =  pageCount;
		
		if(startPage > 10) { %>
		<a href = "calendar2Form.jsp?pageNum=<%=startPage - 5 %>"> [이전]</a>
<%		}
		for(int i = startPage ; i <= endPage ; i++){%>
		<a href = "calendar2Form.jsp?pageNum=<%= i %>"> [<%=i %>]</a>
<%		}
		if(endPage < pageCount) {%>
		<a href = "calendar2Form.jsp?pageNum=<%=startPage + 5 %>"> [다음]</a>
<%		}
	}

%>
		</center>
	</body>
	
</article></section>
     

<footer>
  <p>Footer</p>
</footer>

</body>
</html>