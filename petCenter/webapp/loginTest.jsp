<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="referrer" content="no-referrer-when-downgrade" />
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script>

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
	};

	function parseJwt (token) {
		var base64Url = token.split('.')[1];
		var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
		var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
			return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
		}).join(''));

		return JSON.parse(jsonPayload);
	};

</script>
<title>Insert title here</title>
</head>
<body>

	<div id="g_id_onload"
		data-client_id="746917974555-nrnjepua5q068n73p1747adnuld44poq.apps.googleusercontent.com"
		data-callback="handleCredentialResponse"
		data-auto_select="false" 
		data-auto_prompt="false">
	</div>
	<div class="g_id_signin" data-type="icon" data-shape="circle" ></div>
	<input type="text" name="snstype" id="snstype" />
	<input type="text" name="snsid" id="snsid" />
	<input type="text" name="snsemail" id="snsemail" />


</body>
</html>