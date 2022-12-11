<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.studentDAO" %>
<%@ page import = "project.global.student.sleepoutAppDTO" %>
<%@	page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<h1>sleepoutAppPro page...</h1>

<jsp:useBean id="DTO" class="project.global.student.sleepoutAppDTO" />
<jsp:setProperty property="*" name="DTO" /> <!-- 폼에 넣은 값들을 DTO에  'DTO'라는 이름값으로 내용들을 넣는다는 내용 -->


<%  
	studentDAO dao = new studentDAO(); //DAO라는 객체를 선언하고 
    DTO.setSend(new Timestamp(System.currentTimeMillis()));//접수시간에 대한 내용 DTO에 타임스탬프를Send라고 객체생성 
    dao.sleepoutAppinsert(DTO);//dao안에 내가 선언한sleepoutAppinsert메서드에 DTO 적용
%>
	<script language="JavaScript">
		alert("접수되었습니다.");
		location.href="Main.jsp";	
	</script>
