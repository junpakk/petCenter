<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartInsert.jsp</title>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("cartInsert.jsp 진입: ");
	
	Object obj = request.getAttribute("mnum");//회원정보
	String mnum = (String)obj;
	logger.info("mnum: "+ mnum);
%>
<script>
	location.href="cartSelectAll.pc?mnum=<%= mnum %>";
</script>
</head>
<body>
	장바구니에 잘 저장 되었습니다.
</body>
</html>