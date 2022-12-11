<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.changePartDAO" %>
<%@ page import = "project.global.student.changePartDTO" %>  

<% request.setCharacterEncoding("UTF-8"); %>


<jsp:useBean id = "in" class = "project.global.student.changePartDTO">
	<jsp:setProperty name = "in" property = "*"/>
</jsp:useBean>




<%
	changePartDAO dao = new changePartDAO();
	
	int check = dao.changeCheck(in.getStnum());

	if(check == 1){%> <!-- 최종승인이 있으면 거절 -->
		<script>
			alert("이미 전과하셨습니다. 학교에 문의해주세요.");
			history.go(-1);
		</script>
	<%}else if(check == 2){%> <!-- 최종 거절이 있으면 안내 -->
		<script>
			alert("재신청입니다. 정상적으로 신청되었습니다.");
			<% dao.subjectInsert(in);
				response.sendRedirect("changePartForm.jsp");
			%>
		</script>
	<%}else if(check == 0) {%> <!-- 현재 관리자 검토중 -->
		<script>
			alert("현재 관리자가 검토중입니다.");
			history.go(-1);
		</script>
	<%}else if(check == 3) {%> <!-- 교수님 검토중 -->	
		<script>
			alert("현재 담당교수 검토중입니다.");
			history.go(-1);
		</script>
	<%}else{ %>
		<script>
			alert("정상적으로 신청되었습니다.");
			<% dao.subjectInsert(in);
				response.sendRedirect("changePartForm.jsp");
			%>
		</script>
	<%} %>

<h1>changePartPro page</h1>
