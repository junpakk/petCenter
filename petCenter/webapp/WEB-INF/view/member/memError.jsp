<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khgMemberError</title>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memError.jsp >>> : ");
%>

</head>
<script type="text/javascript">
	alert("에러가 발생하였습니다");
	location.href="memSelectAll.pc";
</script>
<body>
에러가 발생하였습니다
</body>
</html>