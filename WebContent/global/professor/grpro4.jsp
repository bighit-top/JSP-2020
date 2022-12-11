<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.professor.gradeDTO" %>    
<%@ page import = "project.global.professor.gradeDAO" %>    

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="project.global.professor.gradeDTO">
	<jsp:setProperty  name="dto" property="*"/>
</jsp:useBean>



<%
	int record = dto.getRecord(); //입력된 성적을 제약조건에 사용하기 위해 초기화
	gradeDAO dao = new gradeDAO();
	
	if(record > 100){%>	
		<script>
			alert("상한점수 100점을 초과하였습니다. 다시 입력해주세요.");
			history.go(-1);
		</script>
	<%}else if(record < 0){ %>
		<script>
			alert("하한점수는 0점 입니다. 다시 입력해주세요.");
			history.go(-1);
		</script>
	<%}else{	
		dao.insertResult(dto);%>
		<script>
			alert("성적입력이 완료되었습니다.");
			history.go(-1);
		</script>
	<%}%>
	
<title>grPro page</title>