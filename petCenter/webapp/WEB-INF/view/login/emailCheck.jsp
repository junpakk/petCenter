<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMAIL CHECK</title>
</head>
<body>
<%
	String authnumStr = "메일을 확인하고 인증번호를 입력하세요";
	System.out.println("emailCheck >>> : " + authnumStr);
%>
<?xml version='1.0' encoding='UTF-8'?>
<login>
	<result><%= authnumStr %></result>
</login>
</body>
</html>