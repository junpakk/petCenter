<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET CENTER LOGIN FORM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 카카오 로그인 api  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<%
	Object obj = session.getAttribute("KID");
	if (obj != null) {
%>
<script>
	alert("로그인중입니다");
// 	location.href="/petCenter/mainPage.pc";
	location.href="/petCenter/index.jsp";
</script>
<%
	}
%>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("#mid").attr('placeholder', '아이디');
		$("#mpw").attr('placeholder', '비밀번호');
		
		$("#loginBtn").click(function() {
			console.log("loginBtn >>> : ");
			
			$('#loginForm').attr({
				'action':'loginCheck.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
	});
	
	//카카오 로그인 ====================================================
	window.Kakao.init('92dade31e34446d79aa0404eb6817dbe');
	function kakaoLoginApi() {
		alert("kakaoLoginApi >>> : ");
		window.Kakao.Auth.login({
			success: function(authObj){
				console.log("authObj >>> : " + JSON.stringify(authObj));
				window.Kakao.API.request({
					url: '/v2/user/me',
					success: function(res){
						console.log("res >>> : " + JSON.stringify(res));
						
						let k_id = res.id;
						let k_email = res.kakao_account.email;
						let k_nickname = res.properties.nickname;
						
						console.log("k_id >>> : " + k_id);
						console.log("k_email >>> : " + k_email);
						console.log("k_nickname >>> : " + k_nickname);
						
						kakaoLogin(k_id, k_email);
					}
				});
			}
		});
	}
	
	function kakaoLogin(k_id, k_email) {
		alert("kakaoLogin >>> : " + k_id + " : " + k_email);
		
// 		location.href="/khgSpring/kakaoLogin.khg?snstype=01&snsid="+k_id+"&snsemail="+k_email;
		
// 		let url = "kakaoLogin.khg";
// 		let type = "POST";
// 		let data = {
// 				snstype: "01",
// 				snsid: k_id,
// 				snsemail: k_email,
// 		};
// 		$.ajax({
// 			url: url,
// 			type: type,
// 			data: data,
// 			success: whenSuccess,
// 			error: whenError
// 		});
// 		function whenSuccess(resData){
// 			alert("whenSuccess resData >>> : " + resData);
// 		}
// 		function whenError(e){
// 			alert("e >>> : " + e.responseText);
// 		}
		
		
	}
	
	//카카오 로그인 ====================================================
	
</script>
<style type="text/css">
	
/* 	.div1 { */
/* 		background: #eee; */
/* 		border: 2px solid red; */
/* 		width: 300px; */
/* 		height: 300px; */
/* 		margin: 100px auto; */
/* 	} */
	
</style>
</head>
<body>
<div class="container">
<div class="div1 mt-5">
	<form name="loginForm" id="loginForm">
		<table border="1" class="table table-bordered w-auto" align="center">
			<thead>
			<tr>
				<td><h1 align="center">Login</h1></td>
			</tr>
			</thead>
			<tr>
				<td><input type="text" name="mid" id="mid" style="width:208px;"></td>
			</tr>
			<tr>
				<td><input type="password" name="mpw" id="mpw" style="width:208px;"></td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-primary" id="loginBtn" style="width:208px;">로그인</button>
				</td>
			</tr>
			<tr>
				<td style="text-align:center;">
					<a href="idFindForm.pc"><font size="2">아이디찾기</font></a> | 
					<a href="#pwFindForm.khg"><font size="2">비밀번호찾기</font></a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:kakaoLoginApi()">
						<img height="51" width="208" src="/petCenter/img/img_login/kakao.jpg"/>
					</a>
					<input type="hidden" name="snstype" id="snstype" />
					<input type="hidden" name="snsid" id="snsid" />
					<input type="hidden" name="snsemail" id="snsemail" />
				</td>
			</tr>
			
		</table>
	</form>
</div>
</div>
</body>
</html>