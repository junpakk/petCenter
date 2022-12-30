<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.pc.koji.vo.KojiVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#sSBtn").on("click", function() {
			$("#ssssForm").attr({
				"action":"kojiUpdate.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();	
		});
		
		
	});

</script>
</head>
<body>
<h3>Select</h3>
<%
request.setCharacterEncoding("UTF-8");

Object obj = request.getAttribute("listAll");
if(obj == null) {return;}

List<KojiVO> list = (List<KojiVO>)obj;
int nCnt = list.size();

if(nCnt>0) {
	
	KojiVO kvo = list.get(0);
%>
<form action="ssssForm" id="ssssForm" name="ssssForm">
<table border="1" align="center">
<tr>
<td>아이디</td>
<td>
<input type="text" id="mid" name="mid" value="<%=kvo.getMid() %>"/>
</td>
</tr>
<tr>
<td>공지글제목</td>
<td>
<input type="text" id="ktitle" name="ktitle" value="<%=kvo.getKtitle() %>"/>
</td>
</tr>
<tr>
<td>공지사항글내용수정</td>
<td>
<input type="text" id="kcontent" name="kcontent" value="<%=kvo.getKcontent() %>"/>
</td>
</tr>

<% 
}

%>

<tr>
<td colspan="2">

<input type="button" id="sSBtn" value="글내용수정"/>
</td>
</tr>
</table>
</form>
</body>
</html>