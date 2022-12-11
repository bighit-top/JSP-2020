<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	session.getAttribute("studentId"); %>
<%  String id= (String)session.getAttribute("studentId"); %>
<!DOCTYPE html>
<html>
 <head><meta name="viewport" content="width=device-width, initial-scale=1">

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
       onclick="document.location.href='/project/global/logoutForm.jsp'">
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