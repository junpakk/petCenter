<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	alert("입력폼 스크립트 >>> : ");
	$(document).ready(function() {
		alert("입력폼 제이쿼리 >>> : ");
		$("#fBtn").on("click", function() {
			$("#Form").attr({
			
				"action":"zangInsert.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
				
				
			}).submit();
			
		});
		
	});
</script>

</head>
<body>
<h3>장터입력폼</h3>
<form action="Form" id="Form" name="Form">
<table border="1" align="center">
<tr>
<td>장터번호</td>
<td><input type="text" id="bznum" name="bznum" readonly/></td>
</tr>
<tr>
<td>장터카테고리</td>
<td><input type="text" id="bzc" name="bzc"/></td>
</tr>
<tr>
<td>회원아이디</td>
<td><input type="text" id="mid" name="mid"/></td>
</tr>

<tr>
<td>거래물건제목</td>
<td><input type="text" id="bztitle" name="bztitle"/></td>
</tr>
<tr>
<td>거래물건내용</td>
<td><input type="text" id="bzcontent" name="bzcontent"/></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="입력" id="fBtn"/>
</td>
</tr>
</table>
</form>
</body>
</html>