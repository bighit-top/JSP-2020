<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	session.getAttribute("adminId"); %>
<%  String id= (String)session.getAttribute("adminId"); %>
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

  <h2>학사 관리 시스템(관리자)</h2>

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