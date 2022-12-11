<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
body, html {
	overflow: hidden;
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
	font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
}

/* body {
	background: rgba(42,97,186,1);
	background: -moz-linear-gradient(-45deg, rgba(42,97,186,1) 0%, rgba(89,141,224,1) 54%, rgba(232,61,104,1) 54%, rgba(240,81,126,1) 100%);
	background: -webkit-gradient(left top, right bottom, color-stop(0%, rgba(42,97,186,1)), color-stop(54%, rgba(89,141,224,1)), color-stop(54%, rgba(232,61,104,1)), color-stop(100%, rgba(240,81,126,1)));
	background: -webkit-linear-gradient(-45deg, rgba(42,97,186,1) 0%, rgba(89,141,224,1) 54%, rgba(232,61,104,1) 54%, rgba(240,81,126,1) 100%);
	background: -o-linear-gradient(-45deg, rgba(42,97,186,1) 0%, rgba(89,141,224,1) 54%, rgba(232,61,104,1) 54%, rgba(240,81,126,1) 100%);
	background: -ms-linear-gradient(-45deg, rgba(42,97,186,1) 0%, rgba(89,141,224,1) 54%, rgba(232,61,104,1) 54%, rgba(240,81,126,1) 100%);
	background: linear-gradient(135deg, rgba(42,97,186,1) 0%, rgba(89,141,224,1) 54%, rgba(232,61,104,1) 54%, rgba(240,81,126,1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2a61ba', endColorstr='#f0517e', GradientType=1 );
} */


.vertical-middle-out {
	height: 100%;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-ms-flex-direction: row;
	flex-direction: row;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-webkit-box-align: stretch;
	-ms-flex-align: stretch;
	align-items: stretch;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
}

.vertical-middle-out > .vertical-middle-in {
	width: 100%;
	max-width: 360px;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	vertical-align: middle;
	-ms-flex-item-align: center!important;
	align-self: center!important;
	text-align: center;
}

.sample-box {
	border-radius: 10px;
	width: 100%;
	height: 50vh;
	line-height: 20vh;
}
</style>

<% session.invalidate(); // 세션 전체 삭제. %>

<div class="vertical-middle-out">
	<div class="vertical-middle-in">
		<div class="sample-box">
			<img src="errorPic.png" width = "400" height = "400"/> <br/>
			<input type="button" value="메인으로" onclick="window.location='loginForm.jsp'"/>
		</div>
	</div>
</div>

