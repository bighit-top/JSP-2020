<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "project.global.admin.calendar2DTO" %>
<%@ page import = "project.global.admin.calendar2DAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Calendar" %>
<%	session.getAttribute("studentId"); %>
<%  String id= (String)session.getAttribute("studentId"); %>
<!DOCTYPE html>
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

  <h2>학사 관리 시스템</h2>

    <input type="button" value="로그아웃" style="float:right;"
       onclick="document.location.href='/project/global/loginForm.jsp'">
        <input type="button" value="메인" style="float:right;"
       onclick="document.location.href='/project/global/student/Main.jsp'">
       
  <br/>
</header>

<section>
  <nav>
    <ul>
    <li>▶메뉴</li><br/>
      <li>●개인정보관리</li>
      <li><a href="infoForm.jsp">개인신상정보조회</a></li>
      <li><a href="modifyForm.jsp">개인신상정보수정</a></li><br/>
      <li>●학적관리</li>
      <li><a href="timeoffForm.jsp">휴학신청</a></li>
      <li><a href="timeonForm.jsp">복학신청</a></li>
      <li><a href="changePartForm.jsp">전과신청</a></li><br/>
      <li>●학사정보</li>
      <li><a href="calendar2Form.jsp">학사일정</a></li>
      <li><a href="linkForm.jsp">증명서발급 및 출력</a></li>
      <li><a href="gradeForm.jsp">성적조회</a></li>
      <li><a href="evalForm.jsp">수업평가</a></li>
      <li><a href="appForm.jsp">수강신청</a></li>
      <li><a href=" plan2Form.jsp">전체강의 및 강의계획서 조회</a></li>
      <li><a href=" tableForm.jsp">수업시간표 조회</a></li><br/>
      <li>●부속행정</li>
      <li><a href="inForm.jsp">기숙사입실신청</a></li>
      <li><a href="outForm.jsp">기숙사퇴실신청</a></li> 
      <li><a href="passForm.jsp">기숙사합격자조회</a></li>
      <li><a href="sleepoutAppForm.jsp">외박신청서</a></li>
      <li><a href="sleepoutcheckForm.jsp">외박신청승인조회</a></li>
      <li><a href="stuListForm.jsp">공지사항</a></li>
      <li><a href="stuLostForm.jsp">분실물센터</a></li><br/>  
    </ul>
  </nav>



<div class="nav2">
     <table>
        <tr>
        <br/><td>●Quick Menu</td>
        </tr>
        <tr>
        <td><a href="modifyForm.jsp">개인신상정보수정</a></td>
        </tr>
                <tr>
        <td><a href=" tableForm.jsp">수업시간표 조회</a></td>
        </tr>
                <tr>
        <td><a href="gradeForm.jsp">성적조회</a></td>
        </tr>
                <tr>
        <td><a href="passForm.jsp">기숙사합격자조회</a></td>
        </tr>
        
     </table>
     </div>
     <article> 

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
					<tr height ="30">
						<td width = "100" style="background-color: #eee;">날짜</td>
						<td width = "400" style="background-color: #eee;">일정</td> 
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
</article>
</section>

<footer>
  <p>Footer</p>
</footer>

</body>
</html>