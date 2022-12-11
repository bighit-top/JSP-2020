<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 50%;
	margin: 0 auto;
}
th{
	background-color: #eee;
}
td, th{
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
	font-size: 17px;
}
tr: nth-child(even){
	background-color: #dddddd;
}
div.btn{
	margin: auto;
}
</style>
<title>password 찾기 페이지</title>
<br />
<%
	String what = request.getParameter("what"); 

%>

<h1 align="center">비밀번호 찾기</h1>
<br />
<form action="ForgotpwPro.jsp?what=<%=what %>" method="post">
<%if(what=="1"){%>
<input type="hidden" name="what" value="<%=what %>" />
<%}else{ %>
<input type="hidden" name="what" value="<%=what %>" />
<% }%>
<table>
	<tr>
	<th>학번/아이디</th>
	<td>
	<%if(what == "1"){ %>
		<td><input type="text" size="30" name="id" />
	<%}else{ %>
		<input type="text" size="30" name="id" /></td>
	<%} %>
	</tr>
	<tr>
	<th>이름</th>
	<td>
	<%if(what == "1"){ %>
	<input type="text" size="30" name="stname" />
	<%}else{%>
	<input type="text" size="30" name="stname" />
	<%} %></td>
	</tr>
	<tr>
	<th>학과</th>
	<td>
	<%if(what == "1"){ %>
	<input type="text" size="50" name="part" />
	<%}else{ %>
	<input type="text" size="50" name="propart" />
	<%} %></td>
	</tr>
	<tr>
	<th>이메일 주소</th>
	<td>
	<%if(what=="1"){ %>
	<td><input type="text" size="30" name="email" placeholder="학사 시스템에 등록한 이메일 주소 입력" />
	<%}else{ %>
	<input type="text" size="30" name="proemail" placeholder="학사 시스템에 등록한 이메일 주소 입력"/>
	<%}%></td>
	</tr>
</table>
<br />
<p style="text-align: center; color:skyblue;">입력하신 이메일 주소로 인증 번호를 보냅니다.
<br />비밀번호를 변경해주세요!</p>
<br />
<center><input type="submit" value="confirm" style="background-color:lightblue; color:white; width:90px; height:40px; font-size: 20px;"></center>
</form>



