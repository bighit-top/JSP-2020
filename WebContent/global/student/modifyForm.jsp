<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="project.global.student.modifyDTO" %>
<%@page import="project.global.student.studentDAO" %>
<%@include file = "/global/student/Main2.jsp"%>
<%
	
	//String id = (String)session.getAttribute("id");
	//String stnum = "20204003";
	studentDAO dao = new studentDAO();
	
	
	modifyDTO dto = dao.printInfo2(id);
	
	//String path = request.getSession().getServletContext().getRealPath("/stuImage/");
	
	
	
	if(dto == null){
		%><script>alert('조회되는 학생이 없습니다.'); history.back();</script><%
	}else{
		String img_src = "/project/stuImage/" + dto.getImage();
%>

    
<!DOCTYPE html>
<html>
<head>
 <style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 80%;
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
<article> 
<meta charset="UTF-8">
<title>개인신상정보-수정</title>

<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

</head>
<body>

<script>           
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("zon").value = data.zonecode;
				document.getElementById("street").value = data.address;
			}
		}).open();
	}
</script>

<h2 align="center">개인신상정보(수정)</h2>
<form method="post" action="stumodify.do" enctype="multipart/form-data">
	<table border=1 align="center">
		<tr>
			<td align="center" rowspan=6 width="100px">
				<input type="hidden" name="stnum" value="<%=id %>"/>
				
				<!-- db에 이미지정보가 없는 경우 -->
				<%if(dto.getImage() == null){ %>
					<img src="user.png" width="100" name="name_default1"/>
				<%}
				/* db에 이미지 정보가 있는 경우 */
				else{ %>
					<img src="<%=img_src%>" alt="사진정보가 없습니다." width="100" height="110" name="default_image"/>
					<input type="hidden" value="<%=dto.getImage()%>" name="image2"/>
				<%}%>
			</td>
			
			
			<td height="30"  style="background-color: #eee;">이름</td>
			<td><input type="text" size="7" name="stname"  value="<%=dto.getStname() %>"  /> </td>
		</tr>
		
		<tr>
			<td  style="background-color: #eee;">이미지</td>
			<td>
				<input type="file" value="이미지선택" name="image" /> 
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">비밀번호</td>
			<td>
				<input type="text" name="pw" size="9" name="image"  value="<%=dto.getPw() %>"/>
			</td>
		
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">생년월일</td>
			<td>
				<input type="text" size="5" name="year1"  value="<%=dto.getYear1() %>" />년
				<input type="text" size="2" name="mon"  value="<%=dto.getMon()%>" >월
				<input type="text" size="2" name="day1"  value="<%=dto.getDay1() %>"/>일</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">성별</td>
			<td>
				<%=dto.getSex() %>
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">이메일</td>
			<td>
				<input type="text" name="email" size="30" value="<%=dto.getEmail() %>"/>
			</td>
		</tr>
		
		<tr>
			<td rowspan=9></td>
			<td height="30"  style="background-color: #eee;">학번</td>
			<td>
				<input type="text" size="7" name="stnum" disabled  value="<%=dto.getStnum()%>"/>
				<input type="hidden" name="stnum" value="<%=dto.getStnum()%>"/>
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">신분</td>
			<td>
				<input type="text" size="5" name="floor" disabled value="<%=dto.getFloor() %>"/>
				<input type="hidden" name="floor" value="<%=dto.getFloor() %>"/>
			</td>
		</tr>
	
		<tr>
			<td height="30"  style="background-color: #eee;">학년</td>
			<td>
				<input type="text" size="2" name="grade" disabled  value="<%=dto.getGrade()%>"/>
				<input type="hidden" name="grade" value="<%=dto.getGrade()%>"/>
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">학과</td>
			<td>
				<input type="text" size="9" name="part" disabled value="<%=dto.getPart()%>"/>
				<input type="hidden" name="part" value="<%=dto.getPart()%>"/>
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">핸드폰번호</td>
			<td>
			<input type="text" size="10" name="phone" value="<%=dto.getPhone()%>"/>
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">주소</td>
			<td>
			<input type="TEXT" id="zon" name="zon" SIZE="12"  value="<%=dto.getZon()%>" />
			<input type="button" id="jooso_btn" onclick="openZipSearch()" value="주소검색" /> <br/>
			<input type="TEXT" name="street" id="street" SIZE="40"  value="<%=dto.getStreet()%>" /> <br/>
			<input type="TEXT" name="addr" id="addr" SIZE="40"  value="<%=dto.getAddr()%>" />
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">은행</td>
			<td>
			<input type="text" size="5"  name = "bank" value="<%=dto.getBank() %>" />
			&nbsp;계좌 <input type="text" size="14" name = "acnt"  value="<%=dto.getAcnt()%>"/>
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">기숙사 사용</td>
			<td>
				<input type="text" size="5" name="domiuse" disabled value="<%=dto.getDomiuse()%>"/>
				<input type="hidden" name="domiuse" value="<%=dto.getDomiuse()%>"/>
			</td>
		</tr>
		
		<tr>
			<td colspan="3" align="right">
				<input type="submit" value="수정"/>
			</td>
		</tr>
		
	</table>
</form>


<%} %>
</body></article></section></body>
</html>
