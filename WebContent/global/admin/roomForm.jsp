<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.global.admin.domDAO" %>
<%@ page import="project.global.admin.roomDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<%
	domDAO dao1 = new domDAO(); //domDAO() 객체 생성
	List<roomDTO> list = dao1.getPass(); //입실 승인된 학생 리스트 list 출력
	List<roomDTO> listall = dao1.updateGetRoom();//방 배정까지 완료된 학생 리스트 listall 출력
	
	List<Integer> ho_list = new ArrayList<Integer>(); //정수형 ArrayList 객체 생성
	for(int i = 1; i<=3; i++){
		for(int j = 1; j<=5; j++){
			int num = i*100 + j;
			ho_list.add(num); //호실 option 범위 설정
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>

<title>학생 호실 관리 페이지</title>

 <article>
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
<h1 align="center">기숙사 호실 배정하기</h1>

<table border="1" align ="center" width="80%">
	<tr style="background-color: #eee;">
		<th>학과</th>
		<th>학번</th>
		<th>성명</th>
		<th>성별</th>
		<th>생활관</th>
		<th>호실 배정</th>
		<th>승인</th>
	</tr>

		<%for(roomDTO dto : list){ %>
		<tr>
			<form action="roomPro.jsp" method="post">
			<td><%=dto.getPart() %></td>
			<td><%=dto.getStnum() %>
			<input type="hidden" name="stnum" value="<%=dto.getStnum() %>"/>
			</td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getGender() %></td>
			<td><%=dto.getDreamroom() %></td>
			<td>
				<select name="ho">
					<option value="" selected disabled>호실 선택</option>
					<%for(int i = 0; i<ho_list.size(); i++){%>
						<option value="<%=ho_list.get(i)%>"><%=ho_list.get(i)%></option>
					<%}%>
				</select>
			</td>
			<td><div class="btn">
			<input type="submit" value="배정 완료" />
			<input type="hidden" name="ok" value=1 /></div></td>
			</form>
		</tr>
		
		<%} %>
</table >

<br /><br /><br /><br /><br /><br />
<!-- 방배정 완료된 학생 리스트 출력 -->
<table border="1" align ="center" width="80%">
<tr style="background-color: #eee;">
		<th>학과</th>
		<th>학번</th>
		<th>성명</th>
		<th>성별</th>
		<th>생활관</th>
		<th>호실 배정</th>
	</tr>
	<%for(roomDTO dto : listall){ %>
		<tr>
			<td><%=dto.getPart() %></td>
			<td><%=dto.getStnum() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getGender() %></td>
			<td><%=dto.getDreamroom() %></td>
			<td><%=dto.getHo() %></td>
		</tr>
			<%} %>
</table>


</article>
</section>
</body>
</html>