<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="project.global.admin.loginDTO" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script language="javascript">
	function begin(){
	  document.myform.id.focus();
	}
	function checkIt(){
	  if(!document.loginForm.id.value){
		  
	    alert("아이디를 입력하지 않으셨습니다.");
	    document.myform.id.focus();
	    return false;
	  }
	  if(!document.loginform.pw.value){
	    alert("비밀번호를 입력하지 않으셨습니다.");
	    document.myform.passwd.focus();
	    return false;
	  }
	  
	}
</script>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script>
	$(function() { //jQuery
		//학생 패널 헤딩 클릭 시
		$('#student-form-link').click(function(e) { //학생 패널 헤딩의 a태그의  id속성 클릭시 
			//학생 form 태그의 id 속성, 
			//delay()실행 중인 큐 안에서 연속적으로 실행되는 이펙트 효과 사이의 지연 시간을 설정한다.
			//fadeIn(): 불투명도 조절하는 CSS opacity 프로퍼티를 사용하여 보여주고 fadeOut() 감춘다.
			$("#login-form").delay(100).fadeIn(100); 
			$("#prof-from").fadeOut(100);
			//교수/교직원 패널 헤딩의 a 태그 요소의 class값을 제거 - active 비활성
			$('#prof-form-link').removeClass('active');
			//클릭한 a에 active 클래스를 넣는다.
			$(this).addClass('active');
			e.preventDefault();
		});
		//교수/교직원 패널 헤딩 클릭 시
		$('#prof-form-link').click(function(e) {
			//교수/교직원 form 태그의 id 속성,
			$("#prof-from").delay(100).fadeIn(100);
			$("#login-form").fadeOut(100);
			//학생 패널 헤딩의 a 태그 요소의 class 값 제거 - active 비활성
			$('#student-form-link').removeClass('active');
			//클릭한 a에 active 클래스를 넣는다.
			$(this).addClass('active');
			e.preventDefault();
		});

	});
</script>
<style>
body {
	padding-top: 90px;
}

.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
}

.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align: center;
}

.panel-login>.panel-heading a {
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login>.panel-heading a.active {
	color: #029f5b;
	font-size: 18px;
}

.panel-login>.panel-heading hr {
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
}

.panel-login input[type="text"], .panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;	
}

.panel-login input:hover, .panel-login input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}

.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}

.btn-login:hover, .btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}

.forgot-password {
	text-decoration: underline;
	color: #888;
}

.forgot-password:hover, .forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}

.btn-register:hover, .btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}
</style>

<%
	String aaa = request.getParameter("what");

	if(aaa==null){
		aaa="1";
	}
%>
<h3 style="text-align: center;">Welcome! &nbsp; We're Global</h3>
<br />
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-login">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">
						<% loginDTO dto = new loginDTO(); %>
							<a href="/project/global/loginForm.jsp?what=1" class="active" id="student-form-link">학생</a>
						</div>
						
						<div class="col-xs-6">
						
						<a href="/project/global/loginForm.jsp?what=2"  id="prof-form-link">교수/교직원</a>
							
							
						</div>
					
					</div>
					<hr>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<form id="login-form" action="loginPro.jsp" method="post" role="form" style="display: block;">
								<input type="hidden" name="ppp" value="1" />
								<div class="form-group">
									<input type="text" name="id" id="stnum" tabindex="1" class="form-control" placeholder="Username" value="">
								</div>
								<div class="form-group">
									<input type="password" name="pw" id="password" tabindex="2" class="form-control" placeholder="Password">
								</div>
								<!-- 
								<div class="form-group text-center">
									<input type="checkbox" tabindex="3" class="" name="remember"
										id="remember"> <label for="remember"> Remember
										Me</label>
								</div> --><br /><br />
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12">
											<div class="text-center">
												<a href="/project/global/ForgotpwForm.jsp?what=1" tabindex="5"
													class="forgot-password">Forgot Password?</a>
											</div>
										</div>
									</div>
								</div>
							</form>
							
							<form id="prof-from" action="loginPro.jsp" method="post" role="form" style="display: none;">
								<input type="hidden" name="ppp" value="2" />
								<div class="form-group">
									<input type="text" name="id" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
								</div>

								<div class="form-group">
									<input type="password" name="pw" id="password"
										tabindex="2" class="form-control" placeholder="Password">
								</div>

								<!-- 
								<div class="form-group">
									<div class="row">
										<div class="form-group text-center">
											<input type="checkbox" tabindex="3" class="" name="remember"
												id="remember"> <label for="remember">
												Remember Me</label>
										</div> --><br /><br />
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
												<input type="hidden" name="what" value="<%=aaa%>" >
													<input type="submit" name="login-submit" id="login-submit"
														tabindex="4" class="form-control btn btn-login"
														value="Log In">
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-lg-12">
													<div class="text-center">
														<a href="/project/global/ForgotpwForm.jsp?what=2" tabindex="5"
															class="forgot-password">Forgot Password?</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
