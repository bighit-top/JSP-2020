<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="project.global.student.infoDTO" %>
<%@page import="project.global.student.studentDAO" %>
<%@ include file = "/global/student/Main2.jsp"%>
<%
	
	//String stnum = "20164097";
	studentDAO dao = new studentDAO();
	
	infoDTO dto = dao.printInfo(id);
	
	String img_src = "/project/stuImage/" + dto.getImage();
%>

<script language = "javascript" >
	function sel_gender(){
		var form = document.form(0);
		var gender = "<%=dto.getSex()%>";
		
		if(gender == "남자"){
			form.sex(0).checked = true;
		}else{
			form.sex(1).checked = true;
		}
	}

</script>

<!DOCTYPE html>
<html>

  
<article> 
<meta charset="UTF-8">
<title>개인신상정보-조회</title>


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

<h2 align="center">개인신상정보(조회)</h2>
<form>
	<table border=1 align="center">
				<tr>
			<td align="center" rowspan=6 width="100px">
				<!-- image src 지정 / name 지정 -->
				<img src="<%=img_src %>" alt="Page Not Found" width="100" height="110" name="default_image"/>
			</td>
			
			
			<td style="background-color: #eee;">이름</td>
			<td><input type="text" size="7" name="stname" disabled value="<%=dto.getStname() %>"  /> </td>
		</tr>
		
		
		<tr>
			<td style="background-color: #eee;">비밀번호</td>
			<td>
				<input type="text" name="pw" size="9" name="image" disabled value="<%=dto.getPw() %>"/>
			</td>
		
		</tr>
		
		<tr>
			<td style="background-color: #eee;">생년월일</td>
			<td>
				<input type="text" size="5" name="year1" disabled value="<%=dto.getYear1() %>" />년
				<input type="text" size="2" name="mon" disabled value="<%=dto.getMon()%>" >월
				<input type="text" size="2" name="day1" disabled value="<%=dto.getDay1() %>"/>일</td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">성별</td>
			<td>
				<%=dto.getSex() %>
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">email</td>
			<td>
				<input type="text" size="20" name="email" disabled value="<%=dto.getEmail() %>"/>
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">학번</td>
			<td>
				<input type="text" size="7" name="stnum" disabled value="<%=dto.getStnum()%>"/>
			</td>
		</tr>
		
		<tr>
			<td rowspan=8></td>
			<td style="background-color: #eee;">신분</td>
			<td>
				<input type="text" name="floor" size="5" disabled value="<%=dto.getFloor() %>"/>
			</td>
		</tr>
	
		<tr>
			<td style="background-color: #eee;">학년</td>
			<td> <input type="text" size="2" name="grade" disabled value="<%=dto.getGrade()%>"/> </td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;"> 학과</td>
			<td> <input type="text" size="9" name="part" disabled value="<%=dto.getPart()%>"/> </td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">핸드폰번호</td>
			<td>
			<input type="text" size="10" name="phone" disabled value="<%=dto.getPhone()%>"/>
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">주소</td>
			<td>
			<input type="TEXT" id="zon" name="zon" SIZE="12" disabled value="<%=dto.getZon()%>" /> <br/>
			<input type="TEXT" name="street" id="street" SIZE="40" disabled value="<%=dto.getStreet()%>" /> <br/>
			<input type="TEXT" name="addr" id="addr" SIZE="40" disabled value="<%=dto.getAddr()%>" />
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">은행</td>
			<td>
			<input type="text" size="5" disabled value="<%=dto.getBank() %>" />
			&nbsp;계좌 <input type="text" size="14" name = "acnt" disabled value="<%=dto.getAcnt()%>"/>
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">기숙사 사용</td>
			<td>
				<input type="text" size="5" name="domiuse" disabled value="<%=dto.getDomiuse()%>"/>
			</td>
		</tr>
		
	</table>
</form>


</body></article></section></body>
</html>