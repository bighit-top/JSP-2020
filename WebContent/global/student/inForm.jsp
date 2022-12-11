
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.global.student.studentDAO"%>
<%@ page import="project.global.student.inDTO2"%>
<%@include file = "/global/student/Main2.jsp"%>
<%
	//String stnum = request.getParameter("stnum");
	//String stnum = "20164097";
	studentDAO dao = new studentDAO();
	inDTO2 dto = dao.extraadd(id);
%>
<html>
<title>학생 - 기숙사 입실 신청서</title>
<head>
<script type="text/javascript">
	var check = function() {
		if (!f.agree.checked) {
			alert("동의하셔야 입실 신청이 가능합니다");
			f.agree.focus();
			return;
		}
		f.submit();
	}
</script>


		<article>

			<form action="inPro.jsp" method="post" name="f" id="f">

				

				<table border="1" align="center" margin="auto" width="70%">
					<caption>글로벌대학교 생활관 입실원서</caption>
					<tr>
						<td><font size="4" >학번</font>
						<td><input type="text" size="20" value="<%=dto.getStnum()%>" disabled /> <input type="hidden" name="stnum"
							value="<%=dto.getStnum()%>" /></td>
						<td><font size="4">성별</font> 
						<input type="text" size="20" value="<%=dto.getSex()%>"disabled />
						<input type="hidden" name="gender"	value="<%=dto.getSex()%>" /></td>
					</tr>
					<tr>
						<td><font size="4">성명</font></td>
						<td><input type="text" size="20" value="<%=dto.getStname()%>"
							disabled /> <input type="hidden" name="name"
							value="<%=dto.getStname()%>" /></td>
						<td><font size="4">학과:</font> <input type="text" size="20"
							value="<%=dto.getPart()%>" disabled /> <input type="hidden"
							name="part" value="<%=dto.getPart()%>" /></td>
					</tr>
					<tr>
						<td><font size="4">학년</font></td>
						<td><input type="number" size="20"
							value="<%=dto.getGrade()%>" disabled /> <input type="hidden"
							name="grade" value="<%=dto.getGrade()%>" /></td>
						<td><font size="4">E-mail:</font> <input type="text"
							name="email" size="20" /></td>
					</tr>
					<tr>

						<td><font size="4">휴대전화번호</font></td>
						<td colspan="2"><br /> <input type="text" size="20"
							value="<%=dto.getPhone()%>" disabled /> <input type="hidden"
							name="phone" value="<%=dto.getPhone()%>" /><br /> <font
							color="red" align="right" size="2">※번호 변경 시 개인신상정보(수정)메뉴에서
								변경바랍니다. </font></td>
					</tr>
					<tr>
						<td><font size="4">주소</font></td>
						<td colspan="2"><input type="text" name="post" size="10"
							placeholder="우편번호" value="<%=dto.getZon()%>" disabled /> <input
							type="hidden" name="post" value="<%=dto.getZon()%>" /> <br /> <input
							type="text" name="street" size="25" placeholder="도로명주소(구주소)"
							value="<%=dto.getStreet()%>" disabled /> <input type="hidden"
							name="street" value="<%=dto.getStreet()%>" /><br /> <input
							type="text" name="addr" size="35" placeholder="상세주소"
							value="<%=dto.getAddr()%>" disabled /> <input type="hidden"
							name="addr" value="<%=dto.getAddr()%>" /><br /> <font
							color="red" align="right" size="2">※주소 변경 시 개인신상정보(수정)메뉴에서
								변경바랍니다. </font></td>
					</tr>
					<tr>
						<td width="100px"><font size="4">희망생활관</font></td>

						<td colspan="2"><select name="dreamroom">
								<option value="" selected disabled hidden>--선택--</option>
								<option>A동</option>
								<option>B동</option>

						</select></td>
					<tr>
						<td><font color="red" align="right" size="4">※유의사항</font></td>
						<td colspan="2"><font color="red" align="right" size="4"><br>1.생활관
								사용시 귀가시간 초과, 전열기 사용 및 발화물질 반입, 비사생 무답출입 및 숙박제공 행위 등 사생 수칙을 위한할
								경우에는 해당학기 도중 "퇴사" 또는 벌점이 부과되며, 차기 입사시 추천대상에서 제외됩니다.<br /> 2.생활관
								퇴사시 생활관 운영규정에 의거 생활관리비를 환불하며, 기간에 따라 환불 금액이 없을 수 있습니다.<br /> </font></td>
				</table>
				<table border="1" align="center" margin="auto" width="50%">
					<caption>서약서</caption>
					<tr>
						<td><font size="2">본인은 생활관에 입사함에 있어 생환관 운영규정과 사생수칙을 이행
								준수하며, 벌점으로 인한 퇴사조치시에은 생활관 규정의 의거 "생활관비 환불"이 불가함을 인지하며, 서약서를
								제출합니다.</font></td>
					</tr>
					<tr>
						<td colspan="4" align="center">-주요 사생 수칙-</td>
					</tr>
					<tr>
						<td>1.관생으로서 생활관의 품기 및 질서유지 향상에 노력하고, 생활관을 불겁으로 전대사용, 양도 등 규정에
							위반되는 행위를 하지 않겠습니다.<br /> 2.생활관 운영규정 및 사생수칙을 위반하여 퇴사를 명 받았을 때에는
							지정한 기일 내에 이의 없이 퇴사하겠습니다.<br /> 3.생활관 입사시 필요한 서류를 제출하며, 각 종 행사에
							적극 동참토록 하겠습니다.<br /> 4.생활관장 및 교직원의 지시와, 사감과 총장의 지도 통솔에 적극
							따르겠습니다.<br /> 5.법정 전염성 환자로 판명되었을 경우 즉시 퇴사 하겠습니다.<br /> 6.이외 생활관
							운영 규정 및 사생수칙을 준수하며 이행토록 하겠습니다.<br />
						</td>
					</tr>
				</table>

				<h4 align="center">개인정보보호법과 관련하여 아래의 버튼을 눌러 동의 절차를 진행하여 주시기
					바랍니다.</h4>
				<table align="center" style="margin: auto; width: 50%;">

					<tr>
						<td colspan="2" align="center"><input type="checkbox"
							name="agree" required>동의 합니다.</td>
					</tr>
					<tr>
						<td align="center" colspan="2"><br />
							<button type="button" onclick="check()">신청 접수하기</button>
							
							<button type="button" onclick="document.location.href='Main.jsp'">닫기</button></td>
					</tr>

				</table>
			</form>
		</article>
	</section>
</body>
</html>








