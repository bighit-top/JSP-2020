<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.admin.calendar2DTO" %>
<%@ page import = "project.global.admin.calendar2DAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Calendar" %>
<%@include file = "/global/admin/adminMain2.jsp"%>

<!DOCTYPE html>

<article> 

<title>학사일정</title>

	<head>
		<style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 60%;
	margin: auto;
}
td, th{
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
	font-size: 14px;
}
tr: nth-child(even){
	background-color: #dddddd;
}
div.btn{
	margin: auto;
}

</style>
	</head>
<%	//페이지 카운트
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage -1) * pageSize +1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List<calendar2DTO> arrList = null;
	calendar2DAO dao = new calendar2DAO();
	count = dao.getLectureCount();
	if(count > 0){
		arrList = dao.calendarChecking(startRow, endRow);
	}
%>
<!-- 일정 최근 순서별로 정렬 필요 -->
	<body>
		<center>
			<h1>학사일정</h1>
				<table >
					<tr height ="30">
						<td width = "100"  style="background-color: #eee;">날짜</td>
						<td width = "400"  style="background-color: #eee;">일정</td> 
					</tr>
				<%	
					for(int i = 0; i < arrList.size(); i++) {
					calendar2DTO dto = (calendar2DTO)arrList.get(i);
					String day = dto.getDay();
					System.out.println(day);
				%>
					<tr height ="30">

					
						<td width = "100"><%=day.substring(0,10) %></td>
						<td width = "400"><%=dto.getContents() %></td> 
					</tr>
				<%} %>
				</table>

<%
	if(count > 0 ){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0:1);
		
		int startPage = (int)(currentPage/10) * 10 + 1;
		int pageBlock = 5;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage =  pageCount;
		
		if(startPage > 10) { %>
		<a href = "calendar2Form.jsp?pageNum=<%=startPage - 5 %>"> [이전]</a>
<%		}
		for(int i = startPage ; i <= endPage ; i++){%>
		<a href = "calendar2Form.jsp?pageNum=<%= i %>"> [<%=i %>]</a>
<%		}
		if(endPage < pageCount) {%>
		<a href = "calendar2Form.jsp?pageNum=<%=startPage + 5 %>"> [다음]</a>
<%		}
	}

%>
		</center>
	</body>
</article></section></body>
</html>
