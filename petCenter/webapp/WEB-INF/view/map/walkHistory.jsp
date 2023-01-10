<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>Walk History</title>
		<style type='text/css'>
		.container{
			width:700px;
			margin:0 auto;
		}
		</style>		
			
	</head>
	<body>
	<%
		Object mnum_ = session.getAttribute("KNUM");
		Object mid_ = session.getAttribute("KID");
		
		String mnum = null;
		String mid = null;
		
		if(mnum_ != null) mnum = (String)mnum_;
		if(mid_ != null) mid = (String)mid_;

	%>
	<script>
		if(<%=mid%> === null || "<%=mid%>" === ""){
			alert("먼저 로그인 해주세요 "+ <%=mid%>);
			location.href="mainPage.pc";
		}
	</script>	
	<jsp:include page="../include/header.jsp" flush="true">
		<jsp:param name="url" value="#"/>
	</jsp:include>
	<br><br>
	<div class='container'>
	<jsp:include page="walkHistoryInclude.jsp" flush="true">
		<jsp:param name="mid" value="<%=mid %>"/>
	</jsp:include>
	</div>

	</body>
</html>