<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
	//네이버 로그인
	String clientId = "F2JhUJ5_BUtYEkqpaC9U";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8088/petCenter/naverCallback.pc", "UTF-8");
	
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		   apiURL += "&client_id=" + clientId;
		   apiURL += "&redirect_uri=" + redirectURI;
		   apiURL += "&state=" + state;
	//System.out.println("apiURL >>> : " + apiURL);
	session.setAttribute("state", state);
%>

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

<!-- 구글로그인 -->
<!-- <meta name="referrer" content="no-referrer-when-downgrade" /> -->
<script src="https://accounts.google.com/gsi/client" async defer></script>

<%
	Object obj = session.getAttribute("KID");
	if (obj != null) {
%>
<script>
	alert("로그인중입니다");
	location.href="/petCenter/mainPage.pc";
// 	location.href="/petCenter/index.jsp";
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
			
			let loginURL = 'loginCheck.pc';
			let reqType = "POST";
			let dataParam = {
					mid : $("#mid").val(),
					mpw : $("#mpw").val(),
			};
			
			$.ajax({
				url: loginURL,
				type: reqType,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){
				//alert("whenSuccess resData >>> : " + resData);
				if(resData == "loginSuccess"){
					alert("로그인에 성공하였습니다");
					location.href = "mainPage.pc";
				}else{
					alert("로그인에 실패하였습니다");
					$("#mid").val('');
					$("#mpw").val('');
					$("#mid").focus();
				}
			}
			
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
			
// 			$('#loginForm').attr({
// 				'action':'loginCheck.pc',
// 				'method':'POST',
// 				'enctype':'application/x-www-form-urlencoded'
// 			}).submit();
		});
	});
	
	//카카오 로그인 ====================================================
	
	window.Kakao.init('92dade31e34446d79aa0404eb6817dbe');
	function kakaoLoginApi() {
		//alert("kakaoLoginApi >>> : ");
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
						
						$("#snstype").val('01');
						$("#snsid").val(k_id);
						$("#snsemail").val(k_email);
						$("#mname").val(k_nickname);
						
						kakaoLogin();
					}
				});
			}
		});
	}
	
	function kakaoLogin() {
		//alert("kakaoLogin >>> : ");
		
		$('#loginForm').attr({
			'action':'kakaoLogin.pc',
			'method':'POST',
			'enctype':'application/x-www-form-urlencoded'
		}).submit();
		
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
	
	function moveFocus(next){
		if(event.keyCode==13){
			document.getElementById(next).focus();
		}
	}
	
	//구글 로그인 ====================================================
	function handleCredentialResponse(response) {
		// decodeJwtResponse() is a custom function defined by you
		// to decode the credential response.
		const responsePayload = parseJwt(response.credential);

		console.log("ID: " + responsePayload.sub);
// 		console.log('Full Name: ' + responsePayload.name);
// 		console.log('Given Name: ' + responsePayload.given_name);
// 		console.log('Family Name: ' + responsePayload.family_name);
// 		console.log("Image URL: " + responsePayload.picture);
		console.log("Email: " + responsePayload.email);
		
		$("#snstype").val('03');
		$("#snsid").val(responsePayload.sub);
		$("#snsemail").val(responsePayload.email);
		
		$('#loginForm').attr({
			'action':'googleLogin.pc',
			'method':'POST',
			'enctype':'application/x-www-form-urlencoded'
		}).submit();
	};

	function parseJwt (token) {
		var base64Url = token.split('.')[1];
		var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
		var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
			return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
		}).join(''));

		return JSON.parse(jsonPayload);
	};
	//구글 로그인 ====================================================
	
</script>
<style type="text/css">
	
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
	
</style>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="true">
	<jsp:param name="url" value="produectSelectAll.jsp"/>
</jsp:include>
<br><br><br><br><br><br>

<div class="container">
<div class="row">
<div class="col">
</div>
<div class="col-3">

	<form name="loginForm" id="loginForm">
		<table border="1" class="table table-bordered w-auto" align="center">
			<thead>
			<tr>
				<td><h1 align="center">Login</h1></td>
			</tr>
			</thead>
			<tr>
				<td><input type="text" name="mid" id="mid" style="width:229px;" onkeydown=moveFocus("mpw") class="form-control"></td>
			</tr>
			<tr>
				<td><input type="password" name="mpw" id="mpw" style="width:229px;" onkeydown=moveFocus("loginBtn") class="form-control"></td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-info" id="loginBtn" style="width:229px; height:51px;">로그인</button>
				</td>
			</tr>
			<tr>
				<td style="text-align:center;">
					<a href="memInsertForm.pc"><font size="2">회원가입</font></a> | 
					<a href="idFindForm.pc"><font size="2">아이디찾기</font></a> | 
					<a href="pwFindForm.pc"><font size="2">비밀번호찾기</font></a>
				</td>
			</tr>
			<tr>
				<td align="center">
					<p>SNS 계정 간편로그인</p>
					<input type="hidden" name="snstype" id="snstype" />
					<input type="hidden" name="snsid" id="snsid" />
					<input type="hidden" name="snsemail" id="snsemail" />
					<input type="hidden" name="mname" id="mname" />
					<div class="form-row">
						<div class="col" >
							<div class="g_id_signin" data-type="icon" data-shape="circle" ></div>
						</div>
						<div class="col" >
							<a href="javascript:kakaoLoginApi()">
								<img height="40" width="40" src="/petCenter/img/login/kakao_login_circle.png" />
							</a>
						</div>
						<div class="col" >
							<a href="<%= apiURL %>">
								<img height="40" width="40" src="/petCenter/img/login/btnG_icon_circle.png" />
							</a>
						</div>
					</div>
				</td>
			</tr>
			
		</table>
	</form>
</div>
<div class="col">
</div>
</div>
</div>

<div id="g_id_onload"
		data-client_id="746917974555-nrnjepua5q068n73p1747adnuld44poq.apps.googleusercontent.com"
		data-callback="handleCredentialResponse"
		data-auto_select="false" 
		data-auto_prompt="false">
</div>

<br><br><br><br><br><br>
<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
</jsp:include>
</body>
</html>