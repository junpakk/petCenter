<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert</title>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memInsert.jsp >>> : ");
	
	//int cnt = (Integer)request.getAttribute("cnt");
	String result = (String)request.getAttribute("result");
%>

</head>
<script type="text/javascript">
	alert("<%= result %> 되었습니다.");
	alert("메인페이지로 이동합니다.");
 	location.href="mainPage.pc";
</script>
<body>
${ result } 되었습니다.
</body>
</html>