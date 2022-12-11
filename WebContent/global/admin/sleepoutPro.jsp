<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.global.admin.domDAO" %>
<%--<%@ page import="project.global.admin.nightDTO" --%>
<jsp:useBean id="dto" class="project.global.admin.nightDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%
	//파라미터 값 변수 설정
	int no = Integer.parseInt(request.getParameter("no")); //시퀀스 번호
	String stnum = request.getParameter("stnum"); //학번
	int allow = Integer.parseInt(request.getParameter("allow")); //승인 여부
	domDAO dao = new domDAO(); //domDAO() 객체 생성
	
	if(allow==1){ //외박 승인된 경우 allow =1
		dao.sleepoutAllow(stnum, no);%>
<!-- 외박 승인 거부 -->
	<h2 style="text-align: center; margin-top: 10%;">학번 : <%=stnum%> 인 학생의 기숙사 외박 승인 완료하였습니다. </h2>
		<script language="JavaScript">
			alert("승인되었습니다.");
			//history.go(-1);
		</script> 
		<meta http-equiv="Refresh" content="0;url=sleepoutForm.jsp">
	<%}else{ //외박 거부된 경우 allow=-1
		dao.sleepAllowNo(stnum, no);%>
		<!-- 기숙사 외박 승인 거부 -->
	<h2 style="text-align: center; margin-top: 10%;">학번 : <%=stnum%> 인 학생의 기숙사 외박 승인을 거부하였습니다.</h2>
	
			<script language="JavaScript">
				alert("승인 거부되었습니다.");
				//setTimeout(function(){
					//location.reload();
				//}, 2000); //2000밀리초 = 2초
				//history.go(-1);
			</script> 
			<meta http-equiv="Refresh" content="0;url=sleepoutForm.jsp"><!-- 새로고침 -->
			<%}%>