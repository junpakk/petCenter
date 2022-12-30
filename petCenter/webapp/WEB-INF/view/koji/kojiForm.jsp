<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#kBtn").on("click", function() {
			
			$("#kForm").attr({
				"action":"petkojiInsert.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});
		
	});

</script>
</head>
<body>
<h3>공지사항입력폼</h3>
<form action="kForm" id="kForm" name="kForm">
<table border="1" align="center">
<tr>
<td>아이디</td>
<td>
<input type="text" id="mid" name="mid"/>
</td>
</tr>
<tr>
<td>공지제목</td>
<td>
<input type="text" id="ktitle" name="ktitle"/>
</td>
</tr>
<tr>
<td>공지내용</td>
<td>
<input type="text" id="kcontent" name="kcontent"/>
</td>
</tr>
<tr>
<td colspan="2">
<input type="button" id="kBtn" value="공지입력"/>
</td>
</tr>
</table>
</form>
</body>
</html>