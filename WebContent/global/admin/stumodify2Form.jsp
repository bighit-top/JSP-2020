<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="project.global.admin.adminDAO" %>
<%@page import="project.global.admin.stumodifyDTO" %>
<%@page import="project.global.admin.subjectDTO" %>
<%@page import="java.util.List" %>
<%@include file = "/global/admin/adminMain2.jsp"%>

<% request.setCharacterEncoding("UTF-8");%>

<%

	adminDAO dao = new adminDAO();
	List<subjectDTO> list = dao.partcall();

%>

<%
	String part = request.getParameter("part");
	String search_stnum = request.getParameter("search_stnum");
	
	//String path = request.getSession().getServletContext().getRealPath("/stuImage/");
	stumodifyDTO dto = dao.stumodify(part, search_stnum);
		
	if(dto == null){
		%><script>alert('조회되는 학생이 없습니다.'); history.back();</script><%
	}else{		
		String img_path = "/project/stuImage/" + dto.getImage();
		System.out.println(img_path);
%>
<html>
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
<article>
<title>학생정보 입력</title>

<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>


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

<h2 align="center">학생정보수정</h2>
<form method="post" action="stumodify2Form.jsp">
	<table border="1" align="center">
		<tr>
			<td>
				<select name="part">
					<option value="" selected disabled>학과선택</option>
				<%for(int i = 0; i<list.size(); i++){ %>
					<option value="<%=list.get(i).getSubname() %>"> <%=list.get(i).getSubname() %> </option>
				<%}%>
				</select>
			</td>
			
			<td>
				<input type="text" name="search_stnum" size="10" placeholder="학번입력"/>			
			</td>
			
			<td>
				<input type="submit" value="조회"/>
			</td>
		</tr>
	
	</table>

</form>


<form method="post" action="modifyInfo.do" enctype="multipart/form-data">
	<table border=1 align="center">
		<tr>
			<td align="center" rowspan=7 width="100px">
				<!-- image src 지정 / name 지정 -->
				<%if(dto.getImage() == null){ %>
					<img src="user.png" width="100" name="default_image1"/>
				<%}else{ %>
					<img src="<%=img_path%>" alt="사진정보가 없습니다." width="100"/>
					<input type="hidden" value="<%=dto.getImage()%>" name="image2"/>
				<%}%>
			</td>
			
			
			<td height="30"  style="background-color: #eee;"
			>이름</td>
			<td><input type="text" size="7" value= "<%=dto.getStname()%>" name="stname" /> </td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>이미지</td>
			<td>
				<input type="file" value="이미지선택" name="image" />
				 
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>비밀번호</td>
			<td>
				<input type="text" name="pw" size="9" value="<%=dto.getPw()%>" />
			</td>
		
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>생년월일</td>
			<td><input type="text" size="5" name="year1" value="<%=dto.getYear1()%>"/>년
			 <input type="text" size="2" name="mon" value="<%=dto.getMon()%>"/>월
			 <input type="text" size="2" name="day1" value="<%=dto.getDay1()%>"/>일</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>email</td>
			<td>
				<input type="text" name="email" size="20" value="<%=dto.getEmail()%>"/>
			</td>		
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>성별</td>
			<td>
				<input type="radio" value="남자" name="sex"/>남자 &nbsp;
				<input type="radio" value="여자" name="sex"/>여자
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>학번</td>
			<td>
				<input type="text" size="10" name="stnum" value="<%=dto.getStnum()%>"/>
			</td>
		</tr>
		
		<tr>
			<td rowspan=8></td>
			<td height="30"  style="background-color: #eee;"
			>신분</td>
			<td>
				<select name = "floor">
					<option value="" selected disabled hidden>신분선택</option>
					<option value="재학">재학</option>
					<option value="휴학">휴학</option>
					<option value="편입">편입</option>
				</select>
				(현재 상태 : <%=dto.getFloor() %>)
			</td>
		</tr>
	
		<tr>
			<td height="30"  style="background-color: #eee;"
			>학년</td>
			<td> <input type="text" size="2" name="grade" value="<%=dto.getGrade()%>"/> </td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>학과</td>
			<td> <input type="text" size="9" name="part" value="<%=dto.getPart()%>"/> </td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>핸드폰번호</td>
			<td>
			<input type="text" size="10" name="phone" value="<%=dto.getPhone() %>" />
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>주소</td>
			<td>
			<input type="TEXT" id="zon" name="zon" SIZE="12" value="<%=dto.getZon() %>" placeholder="우편번호" readonly />
			<input type="button" id="jooso_btn" onclick="openZipSearch()" value="주소검색" /> <br/>
			<input type="TEXT" name="street" id="street" SIZE="40" value="<%=dto.getStreet() %>" placeholder="주소" readonly /> <br/>
			<input type="TEXT" name="addr" id="addr" SIZE="40" value="<%=dto.getAddr() %>" placeholder="상세주소" />
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">은행</td>
			<td>
			<input type="text" size="6" name = "bank" value="<%=dto.getBank() %>"/>
			&nbsp;계좌 <input type="text" size="14" name = "acnt" value="<%=dto.getAcnt() %>" />
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;"
			>기숙사 사용</td>
			<td>
				<select name="domiuse">
					<option value="" selected hidden disibled>기숙사사용여부</option>
					<option value="입사">입사</option>
					<option value="퇴사">퇴사</option>
					<option value="사용안함">사용안함</option>
				</select>
				&nbsp;&nbsp;(현재 기숙사 사용 : <%=dto.getDomiuse() %>)
			</td>
		</tr>
		
		<tr>
			<td colspan="3" align="right">
				<input type="submit" value="수정" />
			</td>
		</tr>
		
	</table>
	</form></article>

<%}%>