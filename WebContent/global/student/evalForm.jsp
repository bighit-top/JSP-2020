<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.evalDAO" %>
<%@ page import = "project.global.student.evalDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Date" %>
<%@include file = "/global/student/Main2.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
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
 </head>
  
<article> 

<title>강의평가</title>


	<h1>강의평가</h1>
		<body>
		<form action = "evalPro.jsp" method = "post" name = "eval" onsubmit="return confirm('제출하시겠습니까?')">
		<!--	학생마다 학번에 따라 학과 불러오기	 -->
		
<%
		//String stnum = "20164097";  // 학번 
		String date1 = ""; // 년도
		String semester = ""; // 월 -학기
		
		//년도와 학기를 정함
		Date d = new Date();
		date1 = (d.getYear()+1900)+"";
		int month = d.getMonth(); // 0~11
		
		if(month >= 2 && month <= 7){
			semester = "1"; // 월 
		}else{
			semester = "2"; // 월 
		}
			
		evalDAO dao = new evalDAO();
		List<evalDTO> list = dao.lectureList(id, date1, semester); //select에 수강과목을 가져옴
		evalDTO dto = new evalDTO(); //넘길 객체를 담음
		evalDTO select = dao.lectureSelect(id, date1, semester); //교수명을 선택해서 가져옴
		
%>		

		<p>강의평가 과목선택</p>
			
			<input type = "hidden" name="date1" value="<%=date1%>"/><!-- 년도 넘기기 -->
			<input type = "hidden" name="semester" value="<%=semester%>"/><!-- 학기 넘기기 -->
			
			<select name="classname">
			<%for(evalDTO lecture : list) {%>		
				<option><%=lecture.getClassname()%></option>
			<%} %>
			</select>

			<input type="hidden" name="homeroompro"/> <!-- 교수명 넘기기  -->
			<input type="hidden" name="stnum" value = "<%=id %>"/> <!-- 학번 넘기기 -->

		<br>
		<br/>		
		
		1. 강의계획서가 충실하게 구성되어 강좌선택에 도움이 되었다. <br/>
		<input type = "radio" name="num1" value = "2"> 전혀 아니다
		<input type = "radio" name="num1" value = "4"> 아니다
		<input type = "radio" name="num1" value = "6"> 보통이다
		<input type = "radio" name="num1" value = "8"> 그렇다
		<input type = "radio" name="num1" value = "10"> 매우 그렇다
		
		<br>
		<br/>
		
		2. 강의자료가 적절히 활용되어 학습에 도움이 되었다.<br/>
		<input type = "radio" name="num2" value = "2"> 전혀 아니다
		<input type = "radio" name="num2" value = "4"> 아니다
		<input type = "radio" name="num2" value = "6"> 보통이다
		<input type = "radio" name="num2" value = "8"> 그렇다
		<input type = "radio" name="num2" value = "10"> 매우 그렇다
		<br>
		<br/>
		
		3. 이 수업은 전반적으로 출결관리가 잘 되었다<br/>
		<input type = "radio" name="num3" value = "2"> 전혀 아니다
		<input type = "radio" name="num3" value = "4"> 아니다
		<input type = "radio" name="num3" value = "6"> 보통이다
		<input type = "radio" name="num3" value = "8"> 그렇다
		<input type = "radio" name="num3" value = "10"> 매우 그렇다
		<br>
		<br/>
		
		4. 교수님은 학생들의 참여와 소통을 독료하였다.<br/>
		<input type = "radio" name="num4" value = "2"> 전혀 아니다
		<input type = "radio" name="num4" value = "4"> 아니다
		<input type = "radio" name="num4" value = "6"> 보통이다
		<input type = "radio" name="num4" value = "8"> 그렇다
		<input type = "radio" name="num4" value = "10"> 매우 그렇다
		<br>
		<br/>
		
		5. 시험, 과제 등 성적평가의 기준이 적절하며 공정하였다.<br/>
		<input type = "radio" name="num5" value = "2"> 전혀 아니다
		<input type = "radio" name="num5" value = "4"> 아니다
		<input type = "radio" name="num5" value = "6"> 보통이다
		<input type = "radio" name="num5" value = "8"> 그렇다
		<input type = "radio" name="num5" value = "10"> 매우 그렇다
		<br>
		<br/>
		
		6. 강의내용이 효과적으로 전달되어 이해하기 쉬웠다.<br/>
		<input type = "radio" name="num6" value = "2"> 전혀 아니다
		<input type = "radio" name="num6" value = "4"> 아니다
		<input type = "radio" name="num6" value = "6"> 보통이다
		<input type = "radio" name="num6" value = "8"> 그렇다
		<input type = "radio" name="num6" value = "10"> 매우 그렇다
		<br>
		<br/>
		
		7. 본 강의를 통하여 해당 분야에 대한 충분한 지적 자극을 받았다.<br/>
		<input type = "radio" name="num7" value = "2"> 전혀 아니다
		<input type = "radio" name="num7" value = "4"> 아니다
		<input type = "radio" name="num7" value = "6"> 보통이다
		<input type = "radio" name="num7" value = "8"> 그렇다
		<input type = "radio" name="num7" value = "10"> 매우 그렇다
		<br>
		<br/>
		
		8. 교수님은 열의를 가지고 강의를 진행하였다.<br/>
		<input type = "radio" name="num8" value = "2"> 전혀 아니다
		<input type = "radio" name="num8" value = "4"> 아니다
		<input type = "radio" name="num8" value = "6"> 보통이다
		<input type = "radio" name="num8" value = "8"> 그렇다
		<input type = "radio" name="num8" value = "10"> 매우 그렇다
		<br>
		<br/>
		
		9. 본 강의를 다른 학생에게 추천하고 싶다.<br/>
		<input type = "radio" name="num9" value = "2"> 전혀 아니다
		<input type = "radio" name="num9" value = "4"> 아니다
		<input type = "radio" name="num9" value = "6"> 보통이다
		<input type = "radio" name="num9" value = "8"> 그렇다
		<input type = "radio" name="num9" value = "10"> 매우 그렇다
		<br>
		<br/>
		
		10. 본 강의는 전반적으로 유익하였다.<br/>
		<input type = "radio" name="num10" value = "2"> 전혀 아니다
		<input type = "radio" name="num10" value = "4"> 아니다
		<input type = "radio" name="num10" value = "6"> 보통이다
		<input type = "radio" name="num10" value = "8"> 그렇다
		<input type = "radio" name="num10" value = "10"> 매우 그렇다
		<br>
		<br/>
		
		<p>교수님께 하고싶은 말</p>
		<textarea name="topro" rows="5" cols="50"></textarea><br/>
		<input type = "submit" value = "제출" name = "eval">

		</form>
		</body>
	</article></section></body>
</html>