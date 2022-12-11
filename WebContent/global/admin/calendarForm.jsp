<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List" %>
<%@page import="project.global.admin.calendar2DTO" %>
<%@page import="project.global.admin.calendar2DAO" %>
    <%@include file = "/global/admin/adminMain2.jsp"%>
    
<!DOCTYPE html>

 <article>


<title>캘린더 관리</title>

<body>
<style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 50%;
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
<form action="calendarPro.jsp" method="post">

<h3 align="center">캘린더 일정 관리</h3>
<table border="1" align="center">
	<tr>
		<td  style="background-color: #eee;">일정</td>
		<td>
			<input type="date" name="day"/> 
		</td>
	</tr>
	
	<tr>
		<td  style="background-color: #eee;"> 일정내용 </td>
		<td>
			<textarea name = "contents" cols="80" rows="20" placeholder="일정을 입력하세요.">
			
			</textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="right"> 
			<input type="submit" value="저장"/>
		</td> 
	</tr>

</table>
</form>

<br/> <br/> <br/>
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

<table >
	<tr height ="30">
		<td width = "100" height="30"  style="background-color: #eee;">날짜</td>
		<td width = "400" height="30"  style="background-color: #eee;">일정</td> 
		</tr>
		<%	
			for(int i = 0; i < arrList.size(); i++) {
				calendar2DTO dto = (calendar2DTO)arrList.get(i);
				String day = dto.getDay();
			%>
				<tr height ="30">
					<td width = "100"><%=day.substring(0,10) %></td>
					<td width = "400"><%=dto.getContents() %></td> 
				</tr>
			<%} %>
</table>

<table align="center"><tr><td>
<%
	if(count > 0 ){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0:1);
		
		int startPage = (int)(currentPage/10) * 10 + 1;
		int pageBlock = 5;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage =  pageCount;
		
		if(startPage > 10) { %>
		<a href = "calendarForm.jsp?pageNum=<%=startPage - 5 %>"> [이전]</a>
<%		}
		for(int i = startPage ; i <= endPage ; i++){%>
		<a href = "calendarForm.jsp?pageNum=<%= i %>"> [<%=i %>]</a>
<%		}
		if(endPage < pageCount) {%>
		<a href = "calendarForm.jsp?pageNum=<%=startPage + 5 %>"> [다음]</a>
<%		}
	}

%>
</td></tr></table>
</body></article></section></body>
</html>