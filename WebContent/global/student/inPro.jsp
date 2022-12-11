<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "project.global.student.studentDAO" %>
<%@ page import = "project.global.student.inDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<h1>inPro page..</h1>
<jsp:useBean id="enter" class="project.global.student.inDTO">
	<jsp:setProperty name="enter" property="*" /><!-- 폼에 넣은 값들을 DTO에  'enter'라는 이름값으로 내용들을 넣는다는 내용 -->
</jsp:useBean>
<script language="JavaScript">
		alert("접수되었습니다.");
		location.href="Main.jsp";	
	</script>


<%  
	String post = request.getParameter("post");
	enter.setPost(post);

	studentDAO dao = new studentDAO(); //DAO라는 객체를 선언하고 
    dao.ininsert(enter);//dao안에 내가 선언한ininsert메서드에  적용
   
%>
<%=enter.getPost() %>
<%=enter.getStnum() %>
<%=enter.getName() %>
<%=enter.getPhone() %>
<%=enter.getPart() %>
<%=enter.getPost() %>
<%=enter.getAddr() %>
<%=enter.getStreet() %>
<%=enter.getDreamroom() %>
<%=enter.getGender() %>
<%=enter.getEmail() %>


	<script language="JavaScript">
		alert("접수되었습니다.");
		response.sendRedirect("Main.jsp");	
	</script>