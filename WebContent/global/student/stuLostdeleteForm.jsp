<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import= "project.global.student.studentDAO"%>
<%@ page import= "project.global.student.stuLostDTO"%>
<%@include file = "/global/student/Main2.jsp"%>
  <article>
<h1 align="center">이 게시물을 삭제하시겠습니까?</h1>
<%
String pageNum = request.getParameter("pageNum");
String Num = request.getParameter("num");

%>
<table align = "center">
<tr><td>
<form action="stuLostdeletePro.jsp" method="post">
<input type ="hidden" name="num" value="<%=Num%>"/>
	   <input type="submit" align="center" value="네"/>
<input type ="button" value ="아니오" style="float:center;"onClick="history.go(-1)"></form></td></tr><br/>
</table>
	
</form></article></section></body>