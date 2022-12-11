<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	session.getAttribute("professorId"); %>
<%  String id= (String)session.getAttribute("professorId"); %>
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

  <h2>학사 관리 시스템(교수)</h2>

    <input type="button" value="로그아웃" style="float:right;"
       onclick="document.location.href='/project/global/logoutForm.jsp'">
        <input type="button" value="메인" style="float:right;"
       onclick="document.location.href='/project/global/professor/professorMain2.jsp'">
       
  <br/>
</header>

<section>
  <nav>
    <ul>
    <li>▶메뉴</li><br/>
      <li>●강의관리</li>
      <li><a href="promainForm.jsp">본인정보열람</a></li>
      <li><a href="pro modifyForm.jsp">본인정보수정</a></li>
       <li><a href="proevalForm.jsp">강의평가확인</a></li>
      <li><a href=" SuccLecturListForm.jsp">강의리스트 및 강의계획서</a></li>
  	  <li><a href="openLecForm.jsp">강의개설</a></li><br/>
  	    
      <li>●학생관리</li>
      <li><a href="grForm2.jsp">학생평가</a></li>
      <li><a href="prochangepartForm.jsp">학생전과승인</a></li>
      <li><a href="calendarForm.jsp">학사일정</a></li>
      <li><a href="proboardForm.jsp">강의 자유게시판</a></li>
      <br/>  
    </ul>
  </nav>