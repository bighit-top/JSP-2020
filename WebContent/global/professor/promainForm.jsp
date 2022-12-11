<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="project.global.admin.adminDAO" %>
<%@ page import="project.global.admin.subjectDTO" %>
<%@ page import="java.util.List" %>

<%@ page import="project.global.professor.promodifyDTO" %>
<%@ page import="project.global.professor.professorDAO" %>
<%@ include file = "/global/professor/professorMain.jsp" %>
<%
	
	// session 으로 교수 아이디(학번) 넘어오게 하기
	//String id = "202012001";
	professorDAO prodao = new professorDAO();
	
	promodifyDTO dto = prodao.proLookup(id);
	
	//String fileSavePath = "E:\\APP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\proImage\\";
	String img_src = "/project/proImage/" + dto.getImage();
%>

<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8"><title>교수정보 입력</title>
	
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	
	</head>
<article>
<body>
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


<script>           
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("zone").value = data.zonecode;
				document.getElementById("street").value = data.address;
			}
		}).open();
	}
</script>

	<h2 align="center">교수정보열람</h2>
	<form method="post" action="promodify.do" enctype="multipart/form-data">
		<table align="center" border="1">
		
		<tr >
			<td align="center" rowspan=5 width="100px">
				<%if(dto.getImage() == null){ %>
					<img src="user.png" width="100" name = "default_image"/>
				<%}else{ %>
					<img src="<%=img_src%>" width="100"/>
					<input type="hidden" value="<%=dto.getImage()%>" name="image2"/>
				<%}%>
			</td> 
			<td style="background-color: #eee;">성함</td>  <td>  <input type="text" name="proname" value="<%=dto.getProname() %>" disabled/>

			</td>
		</tr>
		  
		<tr>
			<td style="background-color: #eee;">생년월일</td>  <td> <input type="date" value="<%=dto.getProborn()%>" disabled/>
			<input type="hidden" name="proborn" value="<%=dto.getProborn()%>"  /> </td>
			
		</tr>
	
				
		<tr>
			<td style="background-color: #eee;">담당학과</td>  <td> <input type="text" value="<%=dto.getPropart()%>" disabled />
			<input type="hidden" name="propart" value="<%=dto.getPropart()%>" /> </td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">아이디</td>  <td> <input type="text" value="<%=dto.getId()%>" disabled/>
			<input type="hidden" name="id" value="<%=dto.getId()%>" /> </td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">비밀번호</td>  <td> <input type="text" name="pw" value="<%=dto.getPw()%>" disabled/> </td>
		</tr>
		
		<tr><td rowspan="4"></td>
			<td style="background-color: #eee;">핸드폰 </td>
			<td>
				<input type="text" size="10" name="tel1" value="<%=dto.getTel1()%>" disabled/>
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">이메일</td>
			<td> 
				<input type="text" size = "20" name="proemail" value="<%=dto.getProemail()%>" disabled/>
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">주 소</td>
			<td>
				<input type="TEXT" id="zone" value="<%=dto.getZone()%>" name="zone" SIZE="12" placeholder="우편번호" readonly disabled /><br/>
			<input type="TEXT" name="street" value="<%=dto.getStreet()%>" id="street" SIZE="40" placeholder="주소" readonly disabled /> <br/>
			<input type="TEXT" name="addr" id="addr" value="<%=dto.getAddr()%>" SIZE="40" placeholder="상세주소" disabled />
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #eee;">은행</td>
			<td>
				<input type="text" name="bank" value="<%= dto.getBank()%>" disabled/>
				&nbsp;계좌 <input type="text" size="16" name="acount" value="<%=dto.getAcount()%>" disabled/>
			</td>
		</tr>
		
		<tr>

		</tr>
		
		</table>		
	</form>
</body></article>
</html>

