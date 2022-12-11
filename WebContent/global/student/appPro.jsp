<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.appDAO" %>
<%@ page import = "project.global.student.appDTO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<h1>appPro page</h1>


<%
	String stnum = request.getParameter("stnum"); //학번
	String stname = request.getParameter("stname"); //학생명 
	String classnum = request.getParameter("classnum"); //강의코드
	String grade = request.getParameter("grade"); //학년
	
	appDAO dao = new appDAO(); //writePro 참고
	
	appDTO choice = dao.selectLecture(classnum); //강의코드로 정보를 가져옴
	
	int check = dao.canCheck(stnum, classnum); //수강정원과 신청한 인원 비교 체크할 메서드
	
	if(check == 1){%>
		<script>
			alert("수강정원이 마감되었습니다.")
			history.go(-1);
		</script>
	<%}else if(check == 2) {%>
		<script>
			alert("이미 수강신청하신 강의입니다.")
			history.go(-1);
		</script>
	<%}else if(check == 3) {%>
		<script>
			alert("타과 강의는 신청하실 수 없습니다.")
			history.go(-1);
		</script>
	<%}else if(check == 4) {%>
		<script>
			alert("재학생이 아닙니다. 관리자에게 문의하세요.")
			history.go(-1);
		</script>
	<%}else if(check == 5) {%>
		<script>
			alert("이미 신청된 시간입니다.")
			history.go(-1);
		</script>			
	<%}else{ %>	
		<%
		dao.appInsert(choice, stnum, stname, grade); //signup 테이블에 인서트
		%>
		<script>
			alert("수강신청 완료되었습니다.")
			document.location.href="appForm.jsp"
		</script>
	<%} %>