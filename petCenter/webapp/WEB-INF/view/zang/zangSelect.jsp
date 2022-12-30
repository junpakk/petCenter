<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.pc.zang.vo.ZangVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	alert("수정하러가요 >>> : ");
	$(document).ready(function() {
		alert("수정합니다 >>> : ");
		$("#SBtn").on("click", function() {
			
			$("#ssForm").attr({
				"action":"zangUpdate.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});	
		
	});

</script>
</head>
<body>
<h3>장터거래글내용수정하세요</h3>
<%
request.setCharacterEncoding("UTF-8");
Object obj = request.getAttribute("listAll");
if(obj == null) {return;}

List<ZangVO> list = (List<ZangVO>)obj;
int nCnt = list.size();
if(nCnt>0) {
	
	ZangVO zvo = list.get(0);
%>
<form action="ssForm" id="ssForm" name="ssForm">
<table border="1" align="center">
<tr>
<td>장터번호</td>
<td><input type="text" id="bznum" name="bznum" value="<%= zvo.getBznum() %>"/></td>
</tr>
<tr>
<td>장터카테고리</td>
<td><input type="text" id="bzc" name="bzc" value="<%= zvo.getBzc() %>"/></td>
</tr>
<tr>
<td>회원아이디</td>
<td><input type="text" id="mid" name="mid" value="<%= zvo.getMid() %>"/></td>
</tr>
<tr>
<td>거래장터글제목</td>
<td><input type="text" id="bztitle" name="bztitle" value="<%= zvo.getBztitle() %>"/></td>
</tr>
<tr>
<td>거래장터글내용(수정)</td>
<td><input type="text" id="bzcontent" name="bzcontent" value="<%= zvo.getBzcontent() %>"/></td>
</tr>


<% 	
}
%>
<tr>
<td colspan="2">
<input type="button" value="거래장터글내용수정하기" id="SBtn"/>
</td>
</tr>
</table>
</form>
</body>
</html>