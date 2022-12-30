<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="main.pc.community.vo.CommunityVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete here</title>
</head>
<body>
<%
Object obj = request.getAttribute("delCnt");
int i = (Integer)obj;
if(i>0) {
%>
	<script type="text/javascript">
	location.href = "/pet/communitySelectAll.pc";
	</script>
<%	
}
%>
</body>
</html>