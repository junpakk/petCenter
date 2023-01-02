<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	alert("스크립트진입 >>> : ");
	$(document).ready(function() {
		alert("제이쿼리진입 >>> : ");
		$("#fBtn").on("click", function() {
			$("#Form").attr({
				"action":"communityInsert.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});
		
	});
	</script>
	<%
	String mid = (String)session.getAttribute("KID");
	
	%>
</head>
<body>
<h3>커뮤니티입력폼</h3>
<form action="Form" id="Form" name="Form">
<table border="1" align="center">
<tr>
<td>글번호</td>
<td><input type="text" id="bcnum" name="bcnum" readonly/></td>
</tr>
<tr>
<td>글카테고리</td>
<td><input type="text" id="bcc" name="bcc"/></td>
</tr>
<tr>
<td>회원아이디</td>
<td><input id="mid" name="mid" value="<%=mid %>"/></td>
</tr>
<tr>
<td>글제목</td>
<td><input type="text" id="bctitle" name="bctitle"/></td>
</tr>
<tr>
<td>글내용</td>
<td><input type="text" id="bccontent" name="bccontent"/></td>
</tr>

<tr>
<td colspan="2">
<input type="button" id="fBtn" name="fBtn" value="입력"/>
</td>
</tr>

</table>
</form>
</body>
</html>