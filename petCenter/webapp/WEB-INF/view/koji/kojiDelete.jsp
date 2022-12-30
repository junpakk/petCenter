<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.pc.koji.vo.KojiVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
Object obj = request.getAttribute("delnCnt");
int i = (Integer)obj;

if(i>0) {
%>
<script type="text/javascript">
location.href = "kojiSelectAll.pc"; 
</script>
<% 	
}
%>
</body>
</html>