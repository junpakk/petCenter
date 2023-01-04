<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제가 잘 처리되었습니다.</title>
</head>
<body>
<h3>cartDelete.jsp</h3>
<hr>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("cartDelete.jsp 진입: ");
	
	String mnum ="";
	mnum = request.getParameter("mnum");
	logger.info("mnum: "+ mnum);
%>
<script>
	location.href="/petCenter/cartSelectAll.pc?mnum=<%= mnum %>";
</script>
</body>
</html>