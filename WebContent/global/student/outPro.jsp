<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "project.global.student.studentDAO" %>
<%@ page import = "project.global.student.outDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<h1>outPro page..</h1>
<jsp:useBean id="leave" class="project.global.student.outDTO">
	<jsp:setProperty name="leave" property="*" /><!-- 폼에 넣은 값들을 DTO에  'leaving'라는 이름값으로 내용들을 넣는다는 내용 -->
</jsp:useBean>

<%  
	String post = request.getParameter("post");//셀렉트할 시 학생개인정보 테이블에서 우편번호가 Zon이었기에 객체생성을 한후 Zon에 대한 내용을 파라미터 Post로 받는다는 내용 
	leave.setPost(post);//useBean으로 불러와서 생성한 이름  leave안에 Post를 쓰겠다

	studentDAO dao = new studentDAO(); //DAO라는 객체를 선언하고 
    dao.outinsert(leave);//dao안에 내가 선언한outinsert메서드에  적용
    
%>

	<script language="JavaScript">
		alert("접수되었습니다.");
		location.href="Main.jsp";	
	</script>


	