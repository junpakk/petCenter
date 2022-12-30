<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DELETE</title>
</head>
<body>
<h3>DELETE</h3>
<% 
request.setCharacterEncoding("UTF-8");
Object obj = request.getAttribute("delCnt");
if(obj == null) {return;}

int i = (Integer)obj;
if(i>0) {
%>
<script type="text/javascript">
location.href = "/pet/petzangSelectAll.pc";
</script>

<% 	
	
}
%>
</body>
</html>